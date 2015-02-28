module CorreiosSigep
  module Builders
    module XML
      class Product
        def initialize(builder, product)
          @builder = builder
          @product = product
        end

        def build_xml
          @builder.produto do
            @builder.codigo  @product.code
            @builder.tipo    @product.type
            @builder.qtd     @product.quantity
          end
        end

      end
    end
  end
end
