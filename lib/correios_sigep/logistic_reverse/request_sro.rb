module CorreiosSigep
  module LogisticReverse
    class RequestSRO < BaseClient
      def initialize(sro)
        @sro = sro
        super()
      end

      def process
        xml = Builders::XML::RequestSRO.build_xml(@sro)
        process_response invoke(:acompanhar_pedido, xml)
      end

      private
      def process_response response
        correios_hash = response.body[:acompanhar_pedido_response][:return]

        case correios_hash[:cod_erro].to_i
        when 0
          correios_hash[:coleta][:objeto][:numero_etiqueta]
        else
          # TODO look for a descritpion of this weird error
          raise Models::Errors::SRONotReady
        end
      end
    end
  end
end
