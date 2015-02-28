module CorreiosSigep
  module Builders
    module XML
      class CollectObjects
        def initialize(builder, objects=[])
          @builder = builder
          @objects = objects
        end

        def build_xml
          @objects.each do |object|
            @builder.obj do
              @builder.item  object.item
              @builder.id    object.id
              @builder.desc  object.description
              @builder.ship  object.ship
              @builder.num   object.num
            end
          end
        end

      end
    end
  end
end
