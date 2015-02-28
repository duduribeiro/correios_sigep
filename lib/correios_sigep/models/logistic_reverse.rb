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
            Builders::XML::Recipient.new(xml, recipient).build_xml
            Builders::XML::Collect.new(xml, collect).build_xml
          end
        end
        builder.to_xml

      end
    end
  end
end
