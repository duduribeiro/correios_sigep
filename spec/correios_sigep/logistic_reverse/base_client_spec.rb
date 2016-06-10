require 'spec_helper'

module CorreiosSigep
  module LogisticReverse
    describe BaseClient do
      context 'setting up a proxy' do
        subject { described_class.new }

        context 'with a proxy' do
          before { CorreiosSigep.configuration.proxy = 'http://localhost' }
          let(:params) do
            {
              adapter: :net_http_persistent,
              proxy: CorreiosSigep.configuration.proxy,
              wsdl:  described_class.new.wsdl,
              headers: { 'SOAPAction' => '' }
            }
          end

          it 'initializes @client with proxy' do
            expect(Savon).to receive(:client).with(params) { true }
            subject
          end
        end

        context 'without a proxy' do
          before { CorreiosSigep.configuration.proxy = nil }
          let(:params) do
            {
              adapter: :net_http_persistent,
              wsdl: described_class.new.wsdl,
              headers: { 'SOAPAction' => '' }
            }
          end

          it 'initializes @client without proxy' do
            expect(Savon).to receive(:client).with(params) { true }
            subject
          end
        end
      end

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
