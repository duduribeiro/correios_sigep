module CorreiosSigep
  module Builders
    module XML
      class Authentication
        def initialize(builder, administrative_fields)
          @builder = builder
          @config = CorreiosSigep.configuration
          @administrative_fields = administrative_fields
        end

        def build_xml!
          add_node "codAdministrativo", @administrative_fields.administrative_code
          add_node "codigo_servico", @administrative_fields.service_code
          add_node "cartao", @administrative_fields.card
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
