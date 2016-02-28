module CorreiosSigep
  module Models
    class Object
      attr_accessor :description, :id, :item, :num, :ship

      def self.build(&block)
        builder = Builders::Object.new
        builder.instance_eval(&block)
        builder.build
      end

      def initialize(options={})
        @description  = options[:description]
        @id           = options[:id]
        @item         = options[:item]
        @num          = options[:num]
        @ship         = options[:ship]
      end

    end
  end
end
