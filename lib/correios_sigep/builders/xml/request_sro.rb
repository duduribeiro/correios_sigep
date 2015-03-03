module CorreiosSigep
  module Builders
    module XML
      class RequestSRO

        def self.build_xml(sro)
          document = Nokogiri::XML(sro.to_xml)
          XML::Authentication.new(document).build_xml!

          document
            .to_xml(save_with: Nokogiri::XML::Node::SaveOptions::NO_DECLARATION)
            .gsub(/<(\/)?root>/, '')
        end

      end
    end
  end
end

