module CorreiosSigep
  module Models
    class LogisticReverse
      include DSL::LogisticReverse

      attr_accessor :collect, :recipient

      def self.build(&block)
        instance = new
        instance.instance_eval(&block)
        instance
      end

      def initialize(options = {})
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
