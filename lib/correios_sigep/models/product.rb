module CorreiosSigep
  module Models
    class Product
      attr_accessor :code, :type, :quantity

      def self.build(&block)
        builder = Builders::Product.new
        builder.instance_eval(&block)
        builder.build
      end

      def initialize(options={})
        @code     = options[:code]
        @type     = options[:type]
        @quantity = options[:quantity]
      end

    end
  end
end
