module CorreiosSigep
  module Builders
    class RequestCollectNumberXMLBuilder

      def self.build_xml(logistic_reverse)
        document                  = Nokogiri::XML(logistic_reverse.to_xml)
        user_node                 = Nokogiri::XML::Node.new("usuario", document)
        password_node             = Nokogiri::XML::Node.new("senha", document)
        administrative_code_node  = Nokogiri::XML::Node.new("codAdministrativo", document)
        contract_node             = Nokogiri::XML::Node.new("contrato", document)
        service_code_node         = Nokogiri::XML::Node.new("codigo_servico", document)
        card_node                 = Nokogiri::XML::Node.new("cartao", document)

        config = CorreiosSigep.configuration

        user_node.content                 = config.user
        password_node.content             = config.password
        administrative_code_node.content  = config.administrative_code
        contract_node.content             = config.contract
        service_code_node.content         = config.service_code
        card_node.content                 = config.card

        document.root.children.first.add_previous_sibling user_node
        document.root.children.first.add_previous_sibling password_node
        document.root.children.first.add_previous_sibling administrative_code_node
        document.root.children.first.add_previous_sibling contract_node
        document.root.children.first.add_previous_sibling service_code_node
        document.root.children.first.add_previous_sibling card_node

        document.to_xml.gsub(/<(\/)?root>/, '')
      end

    end
  end
end
