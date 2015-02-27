require 'pry'
module CorreiosSigep
  module LogisticReverse
    class RequestCollectNumber < BaseClient
      def initialize(logistic_reverse)
        @logistic_reverse = logistic_reverse
        @client           = Savon.client(wsdl: wsdl)
      end

      def process
        xml = Builders::XML::RequestCollectNumber.build_xml(@logistic_reverse)
        response = @client.call(:solicitar_postagem_reversa, message: xml)
        process_response response
      end

      private

      def process_response(response)
        response_xml = response.to_xml.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
        response_doc = Nokogiri::XML.parse(response_xml)
        code = response_doc.search('//cod-erro | //cod_erro').text.to_i rescue nil
        handle_errors code, response_doc
      end

      def handle_errors code, response_doc
        result_string = '//resultado-solicitacao | //resultado_solicitacao'
        result_node = response_doc.search(result_string)

        case code

        when Models::CorreiosResponseCodes::SUCCESS
          result = result_node.search('//numero-coleta | //numero_coleta')
          if node = result.first
            collect_number = node.text
          end
        when Models::CorreiosResponseCodes::TICKET_ALREADY_USED
          raise Models::Errors::TicketAlreadyUsed.new result_node
            .search('//msg_erro | //msg_erro').text
        when Models::CorreiosResponseCodes::UNAVAILABLE_SERVICE
          raise Models::Errors::UnavailableService.new
        when Models::CorreiosResponseCodes::INEXISTENT_ZIPCODE
          raise Models::Errors::InexistentZipcode.new
        else
          "error"
        end
      end
    end
  end
end
