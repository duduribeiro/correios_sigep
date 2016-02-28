module CorreiosSigep
  module DSL
    module Person
      def self.included(_base)
        %w(address area_code city complement email name neighborhood number
           phone postal_code reference state).each do |property|
          define_method(property) do |param|
            @instance.send("#{property}=", param)
          end
        end
      end
    end
  end
end
