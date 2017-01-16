module CorreiosSigep
  module Models
    class SRO
      attr_accessor :collect_number, :type

      def initialize(options={})
        @collect_number = options[:collect_number]
        @type           = options[:type]
      end

      def to_xml
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.root do
            xml.tipoBusca('H')
            xml.tipoSolicitacao(@type)
            xml.numeroPedido(@collect_number)
          end
        end
        builder.to_xml
      end
    end
  end
end
