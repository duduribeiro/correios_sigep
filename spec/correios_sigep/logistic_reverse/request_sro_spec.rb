module CorreiosSigep
  module LogisticReverse
    describe RequestSRO do
      let(:sro_params) { { collect_number: '1234', type: 'A' } }
      let(:sro) { CorreiosSigep::Models::SRO.new(sro_params) }

      describe '.initialize' do
        subject { described_class.new(sro) }

        it 'instantiates necessary classes' do
          expect(subject.class).to eq CorreiosSigep::LogisticReverse::RequestSRO
        end
      end

      describe '.process' do
        subject { described_class.new(sro).process }

        before :each do
          expect_any_instance_of(RequestSRO).to receive(:invoke).with(any_args) { response }
        end

        let(:response) { double('response', body: response_hash) }
        let(:sro_ticket) { 'ABC123123123BR' }

        context 'when successfully brings a SRO' do
          let(:response_hash) do
            {
              acompanhar_pedido_response: {
                return: {
                  cod_erro: 0,
                  coleta: {
                    objeto: {
                      numero_etiqueta: sro_ticket
                    }
                  }
                }
              }
            }
          end

          it 'returns sro ticket' do
            expect(subject).to eq sro_ticket
          end
        end

        context 'when SRO is not ready yet' do
          let(:response_hash) do
            {
              acompanhar_pedido_response: {
                return: {
                  cod_erro: 1
                }
              }
            }
          end

          it 'raises an error' do
            expect{subject}.to raise_error Models::Errors::SRONotReady
          end
        end
      end
    end
  end
end
