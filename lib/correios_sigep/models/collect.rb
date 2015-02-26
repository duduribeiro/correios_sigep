module CorreiosSigep
  module Models
    class Collect
      attr_accessor :aditional_service, :ag, :ar, :card, :checklist,
                    :declared_value, :description, :number, :objects, :product,
                    :product_params, :type, :sender, :sender_params, :client_id

      def initialize(options={})
        @aditional_service  = options[:aditional_service]
        @ag                 = options[:ag]
        @ar                 = options[:ar]
        @card               = options[:card]
        @checklist          = options[:checklist]
        @client_id          = options[:client_id]
        @declared_value     = options[:declared_value]
        @description        = options[:description]
        @number             = options[:number]
        @type               = options[:type]

        @product = options[:product] || Product.new(options.fetch(:product_params, {}))
        @sender  = options[:sender] || Sender.new(options.fetch(:sender_params, {}))
        @objects = options.fetch(:objects, [])
      end

    end
  end
end
