module CorreiosSigep
  module Builders
    class Object
      include DSL::Object

      def initialize
        @instance = Models::Object.new
      end

      def build
        @instance
      end
    end
  end
end
