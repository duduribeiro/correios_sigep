module CorreiosSigep
  module Builders
    module XML
      class Collect
        def initialize(builder, collect)
          @builder = builder
          @collect = collect
        end

        def build_xml
          @builder.coletas_solicitadas do
            @builder.tipo              @collect.type
            @builder.id_cliente        @collect.client_id
            @builder.valor_declarado   @collect.declared_value
            @builder.descricao         @collect.description
            @builder.cklist            @collect.checklist
            @builder.numero            @collect.number
            @builder.ag                @collect.ag
            @builder.cartao            @collect.card
            @builder.servico_adicional @collect.aditional_service
            @builder.ar                @collect.ar
            XML::Sender.new(@builder, @collect.sender).build_xml
            XML::Product.new(@builder, @collect.product).build_xml
            XML::CollectObjects.new(@builder, @collect.objects).build_xml
          end
        end
      end
    end
  end
end
