module CorreiosSigep
  module Models
    describe SRO do
      it { should respond_to :collect_number }
      it { should respond_to :type }

      describe '.initialize' do
        subject { described_class.new params }

        context 'with nil params' do
          let(:params) { Hash.new }

          it 'binds attrs to nil' do
            expect(subject.collect_number).to be_nil
            expect(subject.type).to be_nil
          end
        end

        context 'with present params' do
          let(:params) { { collect_number: '1234', type: 'A' } }
          it 'binds params to params' do
            expect(subject.collect_number).to eq params[:collect_number]
            expect(subject.type).to eq params[:type]
          end
        end
      end

      describe '.to_xml' do
        let(:sro) { described_class.new(collect_number: '12345', type: 'A') }
        let(:xml) do
          "<?xml version=\"1.0\"?>\n<root>\n  <tipoBusca>H</tipoBusca>\n  <tipoSolicitacao>A</tipoSolicitacao>\n  <numeroPedido>12345</numeroPedido>\n</root>\n"
        end

        it 'generates the correct xml with root' do
          expect(sro.to_xml).to eq xml
        end
      end
    end
  end
end
