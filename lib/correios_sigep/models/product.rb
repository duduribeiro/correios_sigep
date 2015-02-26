module CorreiosSigep
  module Models
    class Product
      attr_accessor :code, :type, :quantity

      def initialize(options={})
        @code     = options[:code]
        @type     = options[:type]
        @quantity = options[:quantity]
      end

    end
  end
end
