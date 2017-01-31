require 'spec_helper'

module CorreiosSigep
  module LogisticReverse
    describe RequestCollectNumber do
      let(:logistic_reverse)  { Models::LogisticReverse.new }
      let(:request_collect)   { described_class.new logistic_reverse }
      let(:body)              { request_fixture('collect_number_request.xml').chop }
      let(:user)              { 'user' }
      let(:pass)              { 'pass' }

      before do
        seed_logistic_reverse(logistic_reverse)

        # WSDL
        stub_request(:get, 'https://apphom.correios.com.br/logisticaReversaWS/logisticaReversaService/logisticaReversaWS?wsdl').
          with(basic_auth: [user, pass]).
          with(:headers => {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent'=>'Ruby'
          }).to_return(:status => 200, :body => correios_fixture('wsdl.xml'), :headers => {})

        # REQUEST
        stub_request(:post, 'https://apphom.correios.com.br/logisticaReversaWS/logisticaReversaService/logisticaReversaWS').
          with(basic_auth: [user, pass]).
          with(:body => body, :headers => {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent'=>'Ruby'
          }).to_return(:status => 200, :body => correios_fixture("request_collect_number/#{response_body}"), :headers => {})
      end

      describe '.process' do
        subject { request_collect.process }

        context 'with success response' do
          let(:response_body) { 'response_success.xml' }

          it 'returns the collect number' do
            expect(subject).to eq '373533437'
          end
        end

        context 'with ticket already in use' do
          let(:response_body) { 'response_already_in_use.xml' }

          it 'raises TicketAlreadyUsed error' do
            expect{subject}.to raise_error(Models::Errors::TicketAlreadyUsed)
          end
        end

        context 'when service is unavailable' do
          let(:response_body) { 'response_unavailable_service.xml' }

          it 'raises UnvailableService error' do
            expect{subject}.to raise_error(Models::Errors::UnavailableService)
          end
        end

        context 'when zipcode not exist' do
          let(:response_body) { 'response_inexistent_zipcode.xml' }

          it 'raises InexistentZipcode error' do
            expect{subject}.to raise_error(Models::Errors::InexistentZipcode)
          end
        end

        context 'when collect is not available for the house' do
          let(:response_body) { 'response_unavailable_house_collect.xml' }

          it 'raises UnavailableHouseCollect error' do
            expect{subject}.to raise_error(Models::Errors::UnavailableHouseCollect)
          end
        end

        context 'when collect is for a not answered zipcode' do
          let(:response_body) { 'response_not_answered_for_zipcode.xml' }

          it 'raises CollectNotAnsweredForTheZipcode error' do
            expect{subject}.to raise_error(Models::Errors::CollectNotAnsweredForTheZipcode)
          end
        end

        context 'when user is not configured to use sigepweb' do
          let(:response_body) { 'response_not_configured_client.xml' }

          it 'raises NotConfiguredClient error' do
            expect{subject}.to raise_error(Models::Errors::NotConfiguredClient)
          end
        end

        context 'when correios answer with another code' do
          let(:response_body) { 'response_unexpected.xml' }

          it 'raises UnknownError error' do
            expect{subject}.to raise_error(Models::Errors::UnknownError)
          end
        end

        context 'when some information is wrong' do
          let(:response_body) { 'response_validation_error.xml' }
          let(:message)       { 'CEP DO REMETENTE INEXISTENTE (88334883)' }

          it 'raises InvalidSolicitation error' do
            expect{subject}.to raise_error(Models::Errors::InvalidSolicitation, message)
          end
        end

      end
    end
  end
end
