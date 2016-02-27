module CorreiosSigep
  module DSL
    module LogisticReverse
      def with_recipient(&block)
        self.recipient = Models::Recipient.build(&block)
      end
    end
  end
end
