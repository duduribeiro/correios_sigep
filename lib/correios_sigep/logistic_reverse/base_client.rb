module CorreiosSigep
  module LogisticReverse
    class BaseClient
      def wsdl
        @wsdl ||= if ENV['GEM_ENV'] == 'test'
                    'http://webservicescolhomologacao.correios.com.br/ScolWeb/WebServiceScol?wsdl'
                  else
                    'http://webservicescol.correios.com.br/ScolWeb/WebServiceScol?wsdl'
                  end
      end
    end
  end
end
