require 'spec_helper'

module CorreiosSigep
  module LogisticReverse
    describe BaseClient do
      describe '#wsdl' do
        subject {  described_class.new.wsdl }
        context 'in a test environment' do
          it 'return the staging url' do
            allow(ENV).to receive(:[]).with('GEM_ENV').and_return 'test'
            expect(subject).to eq 'http://webservicescolhomologacao.correios.com.br/ScolWeb/WebServiceScol?wsdl'
          end
        end

        context 'in other environment' do
          it 'return the production url' do
            allow(ENV).to receive(:[]).with('GEM_ENV').and_return 'prod'
            expect(subject).to eq 'http://webservicescol.correios.com.br/ScolWeb/WebServiceScol?wsdl'
          end
        end

      end
    end
  end
end
