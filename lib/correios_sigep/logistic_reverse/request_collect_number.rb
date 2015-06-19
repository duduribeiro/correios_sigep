module CorreiosSigep
  module LogisticReverse
    class RequestCollectNumber < BaseClient
      def initialize(logistic_reverse, overrides={})
        @logistic_reverse = logistic_reverse
        @overrides        = overrides
        super()
      end

      def process
        xml = Builders::XML::RequestCollectNumber.build_xml(@logistic_reverse, @overrides)
        response = invoke(:solicitar_postagem_reversa, xml)
        process_response response
      end

      private

      def process_response response
        response_xml = response.to_xml.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
        response_doc = Nokogiri::XML.parse(response_xml)
        code = response_doc.search('//cod-erro | //cod_erro').text.to_i rescue nil
        handle_errors code, response_doc
      end

      def handle_errors code, response_doc
        result_string = '//resultado-solicitacao | //resultado_solicitacao'
        result_node = response_doc.search(result_string)
        error_message = response_doc.search('//msg-erro | //msg_erro').text rescue ''

        case code
        when Models::CorreiosResponseCodes::SUCCESS
          result = result_node.search('//numero-coleta | //numero_coleta')
          result.first.text rescue nil

        when Models::CorreiosResponseCodes::TICKET_ALREADY_USED
          raise Models::Errors::TicketAlreadyUsed.new error_message

        when Models::CorreiosResponseCodes::UNAVAILABLE_SERVICE
          raise Models::Errors::UnavailableService

        when Models::CorreiosResponseCodes::INEXISTENT_ZIPCODE
          raise Models::Errors::InexistentZipcode

        when Models::CorreiosResponseCodes::UNAVAILABLE_HOUSE_COLLECT
          raise Models::Errors::UnavailableHouseCollect

        when Models::CorreiosResponseCodes::COLLECT_NOT_ANSWERED_FOR_THE_ZIPCODE
          raise Models::Errors::CollectNotAnsweredForTheZipcode

        when Models::CorreiosResponseCodes::NOT_CONFIGURED_CLIENT
          raise Models::Errors::NotConfiguredClient.new error_message

        else
          error_message = result_node.search('//msg-erro | //msg_erro').text
          invalid_xml_message = response_doc.search("//return").text

          raise Models::Errors::UnknownError.new [error_message, invalid_xml_message].join(', ')
        end
      end
    end
  end
end
