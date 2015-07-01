module CorreiosSigep
  module Models
    describe LogisticReverse do
      it { should respond_to :collect }
      it { should respond_to :recipient }

      describe '#initialize' do
        let(:logistic_reverse) { described_class.new params }

        context 'collect params' do
          context 'present' do
            let(:collect) { double(:collect) }
            let(:params) { { collect: collect } }
            it 'sets collect value as the same in the param' do
              expect(logistic_reverse.collect).to eq collect
            end
          end

          context 'not present' do
            let(:params) { {} }
            it 'sets collect as a new Collect model' do
              expect(Models::Collect).to receive(:new).and_call_original
              expect(logistic_reverse.collect).to be_a(Models::Collect)
            end
          end

        end

        context 'recipient param' do
          context 'present' do
            let(:recipient) { double(:recipient) }
            let(:params) { { recipient: recipient } }
            it 'set recipient value as the same in the param' do
              expect(logistic_reverse.recipient).to eq recipient
            end
          end

          context 'not present' do
            let(:params) { {} }
            it 'sets recipient as a new Recipient model' do
              expect(Models::Recipient).to receive(:new).and_call_original
              expect(logistic_reverse.recipient).to be_a(Models::Recipient)
            end
          end
        end

      end

      describe '#to_xml' do
        let(:logistic_reverse) { described_class.new }
        let(:expected_xml)     { builders_fixture('logistic_reverse.xml') }
        before { seed_logistic_reverse(logistic_reverse) }

        it 'generates the correct XMl of the logistic_reverse' do
          expect(logistic_reverse.to_xml).to match expected_xml
        end
      end
    end
  end
end
