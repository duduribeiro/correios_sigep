module CorreiosSigep
  module Builders
    class Product
      include DSL::Product

      def initialize
        @instance = Models::Product.new
      end

      def build
        @instance
      end
    end
  end
end
