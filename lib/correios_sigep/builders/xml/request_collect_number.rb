module CorreiosSigep
  module Builders
    module XML
      class RequestCollectNumber

        def self.build_xml(logistic_reverse)
          document                  = Nokogiri::XML(logistic_reverse.to_xml)
          XML::Authentication.new(document).build_xml
          document.to_xml(save_with: Nokogiri::XML::Node::SaveOptions::NO_DECLARATION)
            .gsub(/<(\/)?root>/, '')
        end

      end
    end
  end
end
