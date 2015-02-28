module CorreiosSigep
  module Builders
    module XML
      class Authentication
        def initialize(builder)
          @builder = builder
          @config = CorreiosSigep.configuration
        end

        def build_xml
          add_node "usuario", @config.user
          add_node "senha", @config.password
          add_node "codAdministrativo", @config.administrative_code
          add_node "contrato", @config.contract
          add_node "codigo_servico", @config.service_code
          add_node "cartao", @config.card
        end

        private

        def add_node(node_name, node_content)
          @builder.root.children.first.add_previous_sibling(
            create_node(node_name, node_content)
          )
        end

        def create_node(node_name, node_content)
          node = Nokogiri::XML::Node.new(node_name, @builder)
          node.content = node_content
          node
        end

      end
    end
  end
end
