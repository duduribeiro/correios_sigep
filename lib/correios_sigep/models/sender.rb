module CorreiosSigep
  module Models
    class Sender
      attr_accessor :address, :area_code, :city, :complement, :email,
                    :identification, :mobile_area_code, :mobile_phone, :name,
                    :neighborhood, :number, :phone, :postal_code, :reference,
                    :sms, :state

      def self.build(&block)
        builder = Builders::Person.new(self)
        builder.instance_eval(&block)
        builder.build
      end

      def initialize(options={})
        @area_code        = options[:area_code]
        @address          = options[:address]
        @city             = options[:city]
        @complement       = options[:complement]
        @email            = options[:email]
        @identification   = options[:identification]
        @mobile_area_code = options[:mobile_area_code]
        @mobile_phone     = options[:mobile_phone]
        @name             = options[:name]
        @neighborhood     = options[:neighborhood]
        @number           = options[:number]
        @phone            = options[:phone]
        @postal_code      = options[:postal_code]
        @reference        = options[:reference]
        @sms              = options[:sms]
        @state            = options[:state]
      end

    end
  end
end
