module CorreiosSigep
  module DSL
    module Product
      def self.included(_base)
        %w(code type quantity).each do |property|
          define_method(property) do |param|
            @instance.send("#{property}=", param)
          end
        end
      end
    end
  end
end
