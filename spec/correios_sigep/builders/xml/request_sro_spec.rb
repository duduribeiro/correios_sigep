module CorreiosSigep
  module Builders
    module XML
      describe RequestSRO do
        let(:sro_params) { { collect_number: '1234', type: 'A' } }
        let(:sro) { CorreiosSigep::Models::SRO.new(sro_params) }
        let(:xml) do
          "<cartao>0057018901</cartao><codigo_servico>41076</codigo_servico><contrato>9912208555</contrato><codAdministrativo>08082650</codAdministrativo><senha>8o8otn</senha><usuario>60618043</usuario>\n  <tipoBusca>H</tipoBusca>\n  <tipoSolicitacao>A</tipoSolicitacao>\n  <numeroPedido>1234</numeroPedido>\n\n"
        end

        subject { described_class.build_xml(sro) }

        it 'builds a xml without root but with authentication' do
          expect(subject).to eq xml
        end
      end
    end
  end
end
