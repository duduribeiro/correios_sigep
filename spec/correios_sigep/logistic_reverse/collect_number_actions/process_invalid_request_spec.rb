require 'spec_helper'

describe CorreiosSigep::LogisticReverse::CollectNumberActions::ProcessInvalidRequest do
  describe '#run' do
    subject(:process) { described_class.new(content).run }

    let(:content) { Nokogiri::XML.parse(correios_fixture("request_collect_number/#{response_body}").read) }

    context 'with ticket already in use' do
      let(:response_body) { 'response_already_in_use.xml' }

      it 'raises TicketAlreadyUsed error' do
        expect{process}.to raise_error(CorreiosSigep::Models::Errors::TicketAlreadyUsed)
      end
    end

    context 'when service is unavailable' do
      let(:response_body) { 'response_unavailable_service.xml' }

      it 'raises UnvailableService error' do
        expect{process}.to raise_error(CorreiosSigep::Models::Errors::UnavailableService)
      end
    end

    context 'when zipcode not exist' do
      let(:response_body) { 'response_inexistent_zipcode.xml' }

      it 'raises InexistentZipcode error' do
        expect{process}.to raise_error(CorreiosSigep::Models::Errors::InexistentZipcode)
      end
    end

    context 'when collect is not available for the house' do
      let(:response_body) { 'response_unavailable_house_collect.xml' }

      it 'raises UnavailableHouseCollect error' do
        expect{process}.to raise_error(CorreiosSigep::Models::Errors::UnavailableHouseCollect)
      end
    end

    context 'when collect is for a not answered zipcode' do
      let(:response_body) { 'response_not_answered_for_zipcode.xml' }

      it 'raises CollectNotAnsweredForTheZipcode error' do
        expect{process}.to raise_error(CorreiosSigep::Models::Errors::CollectNotAnsweredForTheZipcode)
      end
    end

    context 'when user is not configured to use sigepweb' do
      let(:response_body) { 'response_not_configured_client.xml' }

      it 'raises NotConfiguredClient error' do
        expect{process}.to raise_error(CorreiosSigep::Models::Errors::NotConfiguredClient)
      end
    end

    context 'when correios answer with another code' do
      let(:response_body) { 'response_unexpected.xml' }

      it 'raises UnknownError error' do
        expect{process}.to raise_error(CorreiosSigep::Models::Errors::UnknownError)
      end
    end
  end
end
