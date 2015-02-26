module CorreiosSigep
  module Builders
    class RequestCollectNumberXMLBuilder

      def self.build_xml(logistic_reverse)
        logistic_reverse.to_xml.gsub(/<(\/)?root>/, '')
      end

    end
  end
end
