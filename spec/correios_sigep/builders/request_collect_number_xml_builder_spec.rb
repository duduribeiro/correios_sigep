require 'spec_helper'

module CorreiosSigep
  module Builders
    describe RequestCollectNumberXMLBuilder do
      describe '.build_xml' do
        let(:logistic_reverse) { CorreiosSigep::Models::LogisticReverse.new }
        let(:expected_xml) do
          "<?xml version=\"1.0\"?>\n\n  <destinatario>\n    <nome>ESTABELECIMENT W*M</nome>\n    <logradouro>ESTRADA DE ACESSO A JANDIRA</logradouro>\n    <numero>1400</numero>\n    <complemento>G4</complemento>\n    <bairro>FAZENDA ITAQUI</bairro>\n    <referencia>REFERENCE</referencia>\n    <cidade>BARUERI</cidade>\n    <uf>SP</uf>\n    <cep>06442130</cep>\n    <ddd>11</ddd>\n    <telefone>21683228</telefone>\n    <email>teste@example.com</email>\n  </destinatario>\n  <coletas_solicitadas>\n    <tipo>CA</tipo>\n    <id_cliente>1405670</id_cliente>\n    <valor_declarado>100.5</valor_declarado>\n    <descricao>teste</descricao>\n    <cklist>cklist</cklist>\n    <numero>1</numero>\n    <ag>1</ag>\n    <cartao>1234</cartao>\n    <servico_adicional>20.5</servico_adicional>\n    <ar>2</ar>\n    <remetente>\n      <nome>JEFERSON VAZ DOS SANTOS</nome>\n      <logradouro>RUA BLA BLA BLA</logradouro>\n      <numero>666</numero>\n      <complemento>APT 100</complemento>\n      <bairro>PINHEIROS</bairro>\n      <reference>REFERENCE</reference>\n      <cidade>S&#xC3;O PAULO</cidade>\n      <uf>SP</uf>\n      <cep>05427020</cep>\n      <ddd>16</ddd>\n      <telefone>41606809</telefone>\n      <email>jeff@example.com</email>\n      <identificacao/>\n      <ddd_celular/>\n      <celular/>\n      <sms/>\n    </remetente>\n    <produto>\n      <codigo>code</codigo>\n      <tipo>type</tipo>\n      <qtd>3</qtd>\n    </produto>\n    <obj_col>\n      <obj>\n        <item>127078</item>\n        <id>1405670</id>\n        <desc>Pen Drive SAndisk 16GB SDCZ50-016G-A95</desc>\n        <ship>ship</ship>\n        <num>1</num>\n      </obj>\n      <obj>\n        <item>277574</item>\n        <id>1405670</id>\n        <desc>Chip unico claro Pre pago</desc>\n        <ship>ship</ship>\n        <num>2</num>\n      </obj>\n    </obj_col>\n  </coletas_solicitadas>\n\n"
        end
        subject { described_class.build_xml(logistic_reverse) }
        before :each do
          seed_logistic_reverse(logistic_reverse)
        end

        it {  should eq expected_xml }
      end
    end
  end
end
