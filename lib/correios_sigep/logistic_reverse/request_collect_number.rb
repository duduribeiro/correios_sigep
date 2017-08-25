# encoding UTF-8

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
        response_xml = response.to_xml.force_encoding('UTF-8')
        response_doc = Nokogiri::XML.parse(response_xml)
        code         = response_doc.search('//cod_erro').text.to_i

        unless response_doc.search('//codigo_erro').empty?
          new_code = response_doc.search('//codigo_erro').text.to_i
        end

        action([code, new_code || nil].compact).new(response_doc).run
      end

      def action(response_codes)
        if response_codes.all?{|response_code| response_code == Models::CorreiosResponseCodes::SUCCESS}
          CollectNumberActions::ProcessValidRequest
        else
          CollectNumberActions::ProcessInvalidRequest
        end
      end
    end
  end
end
