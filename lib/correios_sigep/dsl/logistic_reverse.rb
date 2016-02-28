module CorreiosSigep
  module DSL
    module LogisticReverse
      def with_collect(&block)
        self.collect = Models::Collect.build(&block)
      end

      def with_recipient(&block)
        self.recipient = Models::Recipient.build(&block)
      end
    end
  end
end
