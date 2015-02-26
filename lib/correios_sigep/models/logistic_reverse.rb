require 'pry'
module CorreiosSigep
  module Models
    class LogisticReverse
      attr_accessor :collect, :recipient

      def initialize(options={})
        @collect    = options[:collect] || Models::Collect.new
        @recipient  = options[:recipient] || Models::Recipient.new
      end

      def to_xml
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.root do
            xml.destinatario do
              xml.nome        recipient.name
              xml.logradouro  recipient.address
              xml.numero      recipient.number
              xml.complemento recipient.complement
              xml.bairro      recipient.neighborhood
              xml.referencia  recipient.reference
              xml.cidade      recipient.city
              xml.uf          recipient.state
              xml.cep         recipient.postal_code
              xml.ddd         recipient.area_code
              xml.telefone    recipient.phone
              xml.email       recipient.email
            end

            xml.coletas_solicitadas do
              xml.tipo              collect.type
              xml.id_cliente        collect.client_id
              xml.valor_declarado   collect.declared_value
              xml.descricao         collect.description
              xml.cklist            collect.checklist
              xml.numero            collect.number
              xml.ag                collect.ag
              xml.cartao            collect.card
              xml.servico_adicional collect.aditional_service
              xml.ar                collect.ar

              xml.remetente do
                xml.nome          collect.sender.name
                xml.logradouro    collect.sender.address
                xml.numero        collect.sender.number
                xml.complemento   collect.sender.complement
                xml.bairro        collect.sender.neighborhood
                xml.reference     collect.sender.reference
                xml.cidade        collect.sender.city
                xml.uf            collect.sender.state
                xml.cep           collect.sender.postal_code
                xml.ddd           collect.sender.area_code
                xml.telefone      collect.sender.phone
                xml.email         collect.sender.email
                xml.identificacao collect.sender.identification
                xml.ddd_celular   collect.sender.mobile_area_code
                xml.celular       collect.sender.mobile_phone
                xml.sms           collect.sender.sms
              end

              xml.produto do
                xml.codigo  collect.product.code
                xml.tipo    collect.product.type
                xml.qtd     collect.product.quantity
              end

              xml.obj_col do
                collect.objects.each do |object|
                  xml.obj do
                    xml.item  object.item
                    xml.id    object.id
                    xml.desc  object.description
                    xml.ship  object.ship
                    xml.num   object.num
                  end
                end
              end

            end
          end
        end
        builder.to_xml

      end
    end
  end
end
