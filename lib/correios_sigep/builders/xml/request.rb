module CorreiosSigep
  module Builders
    module XML
      class Request

        def initialize(document, overrides={})
          @document = Nokogiri::XML(document.to_xml)
          set_administrative_fields!(overrides[:administrative] || CorreiosSigep.configuration.administrative_fields)
        end

        def set_administrative_fields!(administrative_fields)
          add_node "codAdministrativo", administrative_fields.administrative_code
        end

        def to_xml
          @document
            .to_xml(save_with: Nokogiri::XML::Node::SaveOptions::NO_DECLARATION)
            .gsub(/<(\/)?root>/, '')
        end

        def self.build_xml(request, overrides={})
          new(request, overrides).to_xml
        end

        private

        def add_node(node_name, node_content)
          @document.root.children.first.add_previous_sibling(
            create_node(node_name, node_content)
          )
        end

        def create_node(node_name, node_content)
          node = Nokogiri::XML::Node.new(node_name, @document)
          node.content = node_content
          node
        end
      end
    end
  end
end
