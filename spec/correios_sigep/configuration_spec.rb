module CorreiosSigep
  describe Configuration do
    subject { described_class.new }

    describe '#administrative_code' do
      it 'return nil when unset' do
        expect(subject.administrative_code).to_not be
      end
    end

    describe '#administrative_code=' do
      it 'can set the administrative code in configuration' do
        subject.administrative_code = '12345'
        expect(subject.administrative_code).to eq '12345'
      end
    end

    describe '#card' do
      it 'return nil when unset' do
        expect(subject.card).to_not be
      end
    end

    describe '#card=' do
      it 'can set the card in configuration' do
        subject.card = 'card'
        expect(subject.card).to eq 'card'
      end
    end

    describe '#contract' do
      it 'return nil when unset' do
        expect(subject.contract).to_not be
      end
    end

    describe '#contract=' do
      it 'can set the contract in configuration' do
        subject.contract = 'contract'
        expect(subject.contract).to eq 'contract'
      end
    end

    describe '#password' do
      it 'return nil when unset' do
        expect(subject.password).to_not be
      end
    end

    describe '#password=' do
      it 'can set the password in configuration' do
        subject.password = 'password'
        expect(subject.password).to eq 'password'
      end
    end


    describe '#service_code' do
      it 'return nil when unset' do
        expect(subject.service_code).to_not be
      end
    end

    describe '#service_code=' do
      it 'can set the password in configuration' do
        subject.service_code = 'service_code'
        expect(subject.service_code).to eq 'service_code'
      end
    end

    describe '#user' do
      it 'return nil when unset' do
        expect(subject.user).to_not be
      end
    end

    describe '#user=' do
      it 'can set the user in configuration' do
        subject.user = 'user'
        expect(subject.user).to eq 'user'
      end
    end

    describe '#timeout' do
      it 'return nil when unset' do
        expect(subject.timeout).to_not be
      end
    end

    describe '#timeout=' do
      it 'can set the timeout in configuration' do
        subject.timeout = 15
        expect(subject.timeout).to eq 15
      end
    end
  end
end
