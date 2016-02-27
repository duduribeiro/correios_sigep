module CorreiosSigep
  module Builders
    class Recipient
      include DSL::Recipient

      def initialize
        @instance = Models::Recipient.new
      end

      def build
        @instance
      end
    end
  end
end
