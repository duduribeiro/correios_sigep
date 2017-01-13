require 'spec_helper'

module CorreiosSigep
  module LogisticReverse
    describe BaseClient do
      let(:user) { CorreiosSigep.configuration.basic_auth_user }
      let(:pass) { CorreiosSigep.configuration.basic_auth_pass }
      
      context 'setting up a proxy' do
        subject { described_class.new }

        context 'with a proxy' do
          before { CorreiosSigep.configuration.proxy = 'http://localhost' }
          let(:params) do
            {
              adapter: :net_http_persistent,
              proxy: CorreiosSigep.configuration.proxy,
              wsdl:  described_class.new.wsdl,
              open_timeout: CorreiosSigep::LogisticReverse::BaseClient::DEFAULT_TIMEOUT,
              read_timeout: CorreiosSigep::LogisticReverse::BaseClient::DEFAULT_TIMEOUT,
              basic_auth: [user, pass],
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
              open_timeout: CorreiosSigep::LogisticReverse::BaseClient::DEFAULT_TIMEOUT,
              read_timeout: CorreiosSigep::LogisticReverse::BaseClient::DEFAULT_TIMEOUT,
              basic_auth: [user, pass],
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
          it 'returns the staging url' do
            allow(ENV).to receive(:[]).with('GEM_ENV').and_return 'test'
            expect(subject).to eq 'https://apphom.correios.com.br/logisticaReversaWS/logisticaReversaService/logisticaReversaWS?wsdl'
          end
        end

        context 'in other environment' do
          it 'returns the production url' do
            allow(ENV).to receive(:[]).with('GEM_ENV').and_return 'prod'
            expect(subject).to eq 'https://cws.correios.com.br/logisticaReversaWS/logisticaReversaService/logisticaReversaWS?wsdl'
          end
        end

      end

      context 'setting a timeout' do
        subject { described_class.new }

        before { CorreiosSigep.configuration.timeout = 15 }
        let(:params) do
          {
            adapter: :net_http_persistent,
            wsdl:  described_class.new.wsdl,
            open_timeout: CorreiosSigep.configuration.timeout,
            read_timeout: CorreiosSigep.configuration.timeout,
            basic_auth: [user, pass],
            headers: { 'SOAPAction' => '' }
          }
        end

        it 'initializes @client with informed timeout' do
          expect(Savon).to receive(:client).with(params) { true }
          subject
        end
      end
    end
  end
end
