module CorreiosSigep
  module Builders
    module XML
      class Request

        def self.build_xml(request, overrides={})
          config = CorreiosSigep.configuration
          document = Nokogiri::XML(request.to_xml)
          administrative_fields =
            overrides[:administrative] || config.administrative_fields
          XML::Authentication.new(document, administrative_fields).build_xml!

          document
            .to_xml(save_with: Nokogiri::XML::Node::SaveOptions::NO_DECLARATION)
            .gsub(/<(\/)?root>/, '')
        end

      end
    end
  end
end
