module CorreiosSigep
  module Models
    class AdministrativeFields
      attr_accessor :administrative_code, :card, :service_code

      def initialize(options={})
        self.administrative_code  = options[:administrative_code]
        self.card                 = options[:card]
        self.service_code         = options[:service_code]
      end
    end
  end
end
