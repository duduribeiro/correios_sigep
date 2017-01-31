require 'spec_helper'

describe CorreiosSigep::LogisticReverse::CollectNumberActions::ProcessValidRequest do
  describe '#run' do
    subject(:process) { described_class.new(content).run }

    let(:content) { Nokogiri::XML.parse(correios_fixture("request_collect_number/#{response_body}").read) }

    context 'when some information is wrong' do
      let(:response_body) { 'response_validation_error.xml' }
      let(:message)       { 'CEP DO REMETENTE INEXISTENTE (88334883)' }

      it 'raises InvalidSolicitation error' do
        expect{process}.to raise_error(CorreiosSigep::Models::Errors::InvalidSolicitation, message)
      end
    end

    context 'with success response' do
      let(:response_body) { 'response_success.xml' }

      it { is_expected.to eq('373533437') }
    end
  end
end
