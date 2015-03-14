module CorreiosSigep
  module Builders
    module XML
      class Request

        def self.build_xml(request)
          document = Nokogiri::XML(request.to_xml)
          XML::Authentication.new(document).build_xml!

          document
            .to_xml(save_with: Nokogiri::XML::Node::SaveOptions::NO_DECLARATION)
            .gsub(/<(\/)?root>/, '')
        end

      end
    end
  end
end
