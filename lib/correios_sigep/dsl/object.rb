module CorreiosSigep
  module DSL
    module Object
      def self.included(_base)
        %w(description id item num ship).each do |property|
          define_method(property) do |param|
            @instance.send("#{property}=", param)
          end
        end
      end
    end
  end
end
