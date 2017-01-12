module CorreiosSigep
  describe Configuration do
    subject { described_class.new }

    describe '#administrative_code' do
      it 'returns nil when unset' do
        expect(subject.administrative_code).to be_nil
      end
    end

    describe '#administrative_code=' do
      it 'sets the administrative code in configuration' do
        subject.administrative_code = '12345'
        expect(subject.administrative_code).to eq '12345'
      end
    end

    describe '#card' do
      it 'returns nil when unset' do
        expect(subject.card).to be_nil
      end
    end

    describe '#card=' do
      it 'sets the card in configuration' do
        subject.card = 'card'
        expect(subject.card).to eq 'card'
      end
    end

    describe '#service_code' do
      it 'returns nil when unset' do
        expect(subject.service_code).to be_nil
      end
    end

    describe '#service_code=' do
      it 'sets the password in configuration' do
        subject.service_code = 'service_code'
        expect(subject.service_code).to eq 'service_code'
      end
    end

    describe '#timeout' do
      it 'returns nil when unset' do
        expect(subject.timeout).to be_nil
      end
    end

    describe '#timeout=' do
      it 'sets the timeout in configuration' do
        subject.timeout = 15
        expect(subject.timeout).to eq 15
      end
    end

    describe '#basic_auth_user' do
      it 'returns nil when unset' do
        expect(subject.basic_auth_user).to be_nil
      end
    end

    describe '#basic_auth_user=' do
      let(:user) { 'user' }

      it 'sets the basic_auth_user in configuration' do
        subject.basic_auth_user = user
        expect(subject.basic_auth_user).to eq user
      end
    end

    describe '#basic_auth_pass' do
      it 'returns nil when unset' do
        expect(subject.basic_auth_pass).to be_nil
      end
    end

    describe '#basic_auth_pass=' do
      let(:pass) { 'pass' }

      it 'sets the basic_auth_pass in configuration' do
        subject.basic_auth_pass = pass
        expect(subject.basic_auth_pass).to eq pass
      end
    end
  end
end
