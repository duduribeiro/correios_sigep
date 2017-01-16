require 'spec_helper'

describe CorreiosSigep do
  describe '#configure' do
    subject { described_class.configuration }
    before do
      described_class.configure do |config|
        config.administrative_code  = '08082650'
        config.card                 = '0057018901'
        config.service_code         = '41076'
      end
    end

    it 'configures the correct administrative code' do
      expect(subject.administrative_code).to eq '08082650'
    end

    it 'configures the correct card' do
      expect(subject.card).to eq '0057018901'
    end

    it 'configures the correct service_code' do
      expect(subject.service_code).to eq '41076'
    end

  end
end
