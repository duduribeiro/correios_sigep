module CorreiosSigep
  module Builders
    module XML
      class Recipient
        def initialize(builder, recipient)
          @builder = builder
          @recipient = recipient
        end

        def build_xml
          @builder.destinatario do
            @builder.nome        @recipient.name
            @builder.logradouro  @recipient.address
            @builder.numero      @recipient.number
            @builder.complemento @recipient.complement
            @builder.bairro      @recipient.neighborhood
            @builder.referencia  @recipient.reference
            @builder.cidade      @recipient.city
            @builder.uf          @recipient.state
            @builder.cep         @recipient.postal_code
            @builder.ddd         @recipient.area_code
            @builder.telefone    @recipient.phone
            @builder.email       @recipient.email
          end
        end

      end
    end
  end
end
