module CorreiosSigep
  module LogisticReverse
    class BaseClient
      def initialize
        options = { adapter: :net_http_persistent, proxy: CorreiosSigep.configuration.proxy, wsdl: wsdl }
        options.delete(:proxy) unless options[:proxy]

        @client = Savon.client(options)
      end

      def wsdl
        @wsdl ||= if ENV['GEM_ENV'] == 'test'
                    'http://webservicescolhomologacao.correios.com.br/ScolWeb/WebServiceScol?wsdl'
                  else
                    'http://webservicescol.correios.com.br/ScolWeb/WebServiceScol?wsdl'
                  end
      end

      def invoke(method, message)
        @client.instance_variable_set(
          :@wsdl,
          Wasabi::Document.new(CorreiosSigep.configuration.wsdl_base_url)
        ) if wsdl_base_url_changed?

        @client.call(method, message: message)
      end

      private
      def wsdl_base_url_changed?
        wsdl_base_url && wsdl_base_url != @client.instance_variable_get(:@wsdl).document
      end

      def wsdl_base_url
        CorreiosSigep.configuration.wsdl_base_url
      end
    end
  end
end
