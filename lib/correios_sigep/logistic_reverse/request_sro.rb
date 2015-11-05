module CorreiosSigep
  module LogisticReverse
    class RequestSRO < BaseClient
      def initialize(sro, overrides={})
        @sro = sro
        @overrides = overrides
        super()
      end

      def process
        xml = Builders::XML::RequestSRO.build_xml(@sro, @overrides)
        process_response invoke(:acompanhar_pedido, xml)
      end

      private
      def process_response response
        correios_hash = response.body[:acompanhar_pedido_response][:return]
        check_sro_errors(correios_hash)
        correios_response(correios_hash[:coleta][:objeto])[:numero_etiqueta] || begin raise Models::Errors::SRONotReady; end
      end

      def correios_response response
        response.is_a?(Array) ? response.first : response
      end

      def check_sro_errors return_body
        error_msg = return_body[:msg_erro]
        case return_body[:cod_erro].to_i
        when 0
          return
        when -7
          raise Models::Errors::RequiredFields.new(error_msg)
        when -5
          raise Models::Errors::CollectNumberNotFound.new(error_msg)
        else
          raise Models::Errors::UnknownError.new(error_msg)
        end
      end
    end
  end
end
