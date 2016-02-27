module CorreiosSigep
  module Models
    describe LogisticReverse do
      it { should respond_to :collect }
      it { should respond_to :recipient }

      describe ".build" do
        let(:recipient) do
          CorreiosSigep::Models::Recipient.new({
            address: 'Endereco',
            area_code: 'DDD',
            city: 'Cidade',
            complement: 'Complemento',
            email: 'Email',
            name: 'Nome',
            neighborhood: 'Bairro',
            number: 'Numero',
            phone: 'Telefone',
            postal_code: 'CEP',
            reference: 'Referencia',
            state: 'Estado'
          })
        end

        let(:sender) do
          CorreiosSigep::Models::Sender.new({
            address: 'Endereco',
            area_code: 'DDD',
            city: 'Cidade',
            complement: 'Complemento',
            email: 'Email',
            name: 'Nome',
            neighborhood: 'Bairro',
            number: 'Numero',
            phone: 'Telefone',
            postal_code: 'CEP',
            reference: 'Referencia',
            state: 'Estado'
          })
        end

        let(:collect) do
          CorreiosSigep::Models::Collect.new({
            aditional_service: '10.00',
            ag: '5',
            ar: '1',
            card: '',
            checklist: '2',
            client_id: '102030',
            declared_value: '1000.00',
            description: 'Descricao',
            number: '',
            type: 'A'
          })
        end

        subject do
          described_class.build do
            with_recipient do
              address      'Endereco'
              area_code    'DDD'
              city         'Cidade'
              complement   'Complemento'
              email        'Email'
              name         'Nome'
              neighborhood 'Bairro'
              number       'Numero'
              phone        'Telefone'
              postal_code  'CEP'
              reference    'Referencia'
              state        'Estado'
            end

            with_collect do
              aditional_service '10.00'
              ag                '5'
              ar                '1'
              card              ''
              checklist         '2'
              client_id         '102030'
              declared_value    '1000.00'
              description       'Descricao'
              number            ''
              type              'A'

              with_sender do
                address      'Endereco'
                area_code    'DDD'
                city         'Cidade'
                complement   'Complemento'
                email        'Email'
                name         'Nome'
                neighborhood 'Bairro'
                number       'Numero'
                phone        'Telefone'
                postal_code  'CEP'
                reference    'Referencia'
                state        'Estado'
              end
            end
          end
        end

        it 'initializes with the correct recipient' do
          %i(address area_code city complement email name neighborhood number
             phone postal_code reference state).each do |property|
            expect(subject.recipient.send(property)).to eq(recipient.send(property))
          end
        end

        it 'initializes with the correct collect' do
          %i(aditional_service ag ar card checklist declared_value description
             number objects type client_id).each do |property|
               expect(subject.collect.send(property)).to eq(collect.send(property))
          end
        end

        it 'initializes with the correct sender' do
          %i(address area_code city complement email name neighborhood number
             phone postal_code reference state).each do |property|
            expect(subject.collect.sender.send(property)).to eq(sender.send(property))
          end
        end
      end

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
