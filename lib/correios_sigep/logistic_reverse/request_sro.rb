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

        correios_hash[:coleta][:objeto][:numero_etiqueta] || begin raise Models::Errors::SRONotReady; end
      end
    end
  end
end
