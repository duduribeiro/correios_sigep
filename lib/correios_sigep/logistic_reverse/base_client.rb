module CorreiosSigep
  module LogisticReverse
    class BaseClient
      DEFAULT_TIMEOUT = 30

      def initialize
        timeout     = CorreiosSigep.configuration.timeout || DEFAULT_TIMEOUT
        user        = CorreiosSigep.configuration.user
        password    = CorreiosSigep.configuration.password  

        options = {
          adapter: :net_http_persistent,
          proxy: CorreiosSigep.configuration.proxy,
          wsdl: wsdl,
          open_timeout: timeout,
          read_timeout: timeout,
          basic_auth: [user, password]
        }
        options.delete(:proxy) unless options[:proxy]

        options.merge!({ headers: { 'SOAPAction' => '' }}) if ENV['GEM_ENV'] == 'test'

        @client = Savon.client(options)
      end

      def wsdl
        @wsdl ||= if ENV['GEM_ENV'] == 'test'
                    'https://apphom.correios.com.br/logisticaReversaWS/logisticaReversaService/logisticaReversaWS?wsdl'
                  else
                    'https://cws.correios.com.br/logisticaReversaWS/logisticaReversaService/logisticaReversaWS?wsdl'
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
