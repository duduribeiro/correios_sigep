module CorreiosSigep
  module Models
    class AdministrativeFields
      attr_accessor :administrative_code, :card, :contract, :service_code

      def initialize(options={})
        self.administrative_code  = options[:administrative_code]
        self.card                 = options[:card]
        self.contract             = options[:contract]
        self.service_code         = options[:service_code]
      end
    end
  end
end
