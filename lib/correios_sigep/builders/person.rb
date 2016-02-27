module CorreiosSigep
  module Builders
    class Person
      include DSL::Person

      def initialize(klass)
        @instance = klass.new
      end

      def build
        @instance
      end
    end
  end
end
