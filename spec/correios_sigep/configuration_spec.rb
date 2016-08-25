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

    describe '#contract' do
      it 'returns nil when unset' do
        expect(subject.contract).to be_nil
      end
    end

    describe '#contract=' do
      it 'sets the contract in configuration' do
        subject.contract = 'contract'
        expect(subject.contract).to eq 'contract'
      end
    end

    describe '#password' do
      it 'returns nil when unset' do
        expect(subject.password).to be_nil
      end
    end

    describe '#password=' do
      it 'sets the password in configuration' do
        subject.password = 'password'
        expect(subject.password).to eq 'password'
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

    describe '#user' do
      it 'returns nil when unset' do
        expect(subject.user).to be_nil
      end
    end

    describe '#user=' do
      it 'sets the user in configuration' do
        subject.user = 'user'
        expect(subject.user).to eq 'user'
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
  end
end
