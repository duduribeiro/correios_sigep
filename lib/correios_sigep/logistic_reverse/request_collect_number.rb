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
        process_response(response)
      end

      private

      def process_response(response)
        response_xml = response.to_xml.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
        response_doc = Nokogiri::XML.parse(response_xml)
        code = response_doc.search('//cod_erro').text.to_i

        action(code).new(response_doc).run
      end

      def action(code)
        if Models::CorreiosResponseCodes::SUCCESS == code
          CollectNumberActions::ProcessValidRequest
        else
          CollectNumberActions::ProcessInvalidRequest
        end
      end
    end
  end
end
