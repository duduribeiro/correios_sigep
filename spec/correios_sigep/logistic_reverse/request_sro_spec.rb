require 'spec_helper'

module CorreiosSigep
  module LogisticReverse
    describe RequestSRO do
      let(:sro_params) { { collect_number: '1234', type: 'A' } }
      let(:sro) { CorreiosSigep::Models::SRO.new(sro_params) }
      let(:body)             { request_fixture('sro_request.xml').chop }

      before do
        # WSDL
        stub_request(:get, "http://webservicescolhomologacao.correios.com.br/ScolWeb/WebServiceScol?wsdl").
          with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
          to_return(:status => 200, :body => correios_fixture('wsdl.xml'), :headers => {})

        # REQUEST
        stub_request(:post, "http://webservicescolhomologacao.correios.com.br/ScolWeb/WebServiceScol").
         with(:body => body, :headers => { 'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Length'=>'633', 'Content-Type'=>'text/xml;charset=UTF-8',
            'Soapaction'=>'"acompanharPedido"', 'User-Agent'=>'Ruby' }).
         to_return(:status => 200, :body => correios_fixture("request_sro/#{response_body}"), :headers => {})
      end

      describe '.process' do
        subject { described_class.new(sro).process }

        context 'when successfully brings a SRO' do
          let(:response_body) { 'response_success.xml' }

          it 'returns sro ticket' do
            expect(subject).to eq 'ETI12345'
          end
        end

        context 'when SRO is not ready yet' do
          let(:response_body) { 'response_sro_not_ready.xml' }

          it 'raises SRONotReady error' do
            expect{subject}.to raise_error Models::Errors::SRONotReady
          end
        end

        context 'when required fields is not filled' do
          let(:response_body) { 'response_required_fields.xml' }

          it 'raises RequiredFields error' do
            expect{subject}.to raise_error Models::Errors::RequiredFields
          end
        end

        context 'when CollectNumber does not exist or it is not valid' do
          let(:response_body) { 'response_collect_number_not_found.xml' }

          it 'raises CollectNumberNotFound' do
            expect{subject}.to raise_error Models::Errors::CollectNumberNotFound
          end
        end

        context 'with an unknow error' do
          let(:response_body) { 'response_unknown_error.xml' }

          it 'raises UnkowError' do
            expect{subject}.to raise_error Models::Errors::UnknownError
          end
        end

      end
    end
  end
end
