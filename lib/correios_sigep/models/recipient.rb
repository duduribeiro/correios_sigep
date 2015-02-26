module CorreiosSigep
  module Models
    class Recipient
      attr_accessor :address, :area_code, :city, :complement, :email, :name,
                    :neighborhood, :number, :phone, :postal_code, :reference,
                    :state

      def initialize(options={})
        @address      = options[:address]
        @area_code    = options[:area_code]
        @city         = options[:city]
        @complement   = options[:complement]
        @email        = options[:email]
        @name         = options[:name]
        @neighborhood = options[:neighborhood]
        @number       = options[:number]
        @phone        = options[:phone]
        @postal_code  = options[:postal_code]
        @reference    = options[:reference]
        @state        = options[:state]
      end

    end
  end
end
