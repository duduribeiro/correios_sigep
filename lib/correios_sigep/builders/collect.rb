module CorreiosSigep
  module Builders
    class Collect
      include DSL::Collect

      def initialize
        @instance = Models::Collect.new
      end

      def build
        @instance
      end
    end
  end
end
