module CorreiosSigep
  module Builders
    module XML
      class Sender
        def initialize(builder, sender)
          @builder = builder
          @sender = sender
        end

        def build_xml
          @builder.remetente do
            @builder.nome          @sender.name
            @builder.logradouro    @sender.address
            @builder.numero        @sender.number
            @builder.complemento   @sender.complement
            @builder.bairro        @sender.neighborhood
            @builder.referencia    @sender.reference
            @builder.cidade        @sender.city
            @builder.uf            @sender.state
            @builder.cep           @sender.postal_code
            @builder.ddd           @sender.area_code
            @builder.telefone      @sender.phone
            @builder.email         @sender.email
            @builder.identificacao @sender.identification
            @builder.ddd_celular   @sender.mobile_area_code
            @builder.celular       @sender.mobile_phone
            @builder.sms           @sender.sms
          end
        end

      end
    end
  end
end
