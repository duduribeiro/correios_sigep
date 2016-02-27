module CorreiosSigep
  module DSL
    module Collect
      def self.included(_base)
        %w(aditional_service ag ar card checklist declared_value description
             number objects product_params type sender_params client_id).each do |property|
          define_method(property) do |param|
            @instance.send("#{property}=", param)
          end
        end
      end

      def with_sender(sender = nil, &block)
        @instance.sender = if block_given?
                             Models::Sender.build(&block)
                           else
                             sender
                           end
      end
    end
  end
end
