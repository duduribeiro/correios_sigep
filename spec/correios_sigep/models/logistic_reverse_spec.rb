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
            it 'set collect value as the same in the param' do
              expect(logistic_reverse.collect).to eq collect
            end
          end

          context 'not present' do
            let(:params) { {} }
            it 'set collect as a new Collect model' do
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
            it 'set recipient as a new Recipient model' do
              expect(Models::Recipient).to receive(:new).and_call_original
              expect(logistic_reverse.recipient).to be_a(Models::Recipient)
            end
          end
        end

      end

      describe '#to_xml' do
        let(:logistic_reverse) { described_class.new }
        before :each do
          recipient = CorreiosSigep::Models::Recipient.new(name: "ESTABELECIMENT W*M", address: "ESTRADA DE ACESSO A JANDIRA", number: 1400, complement: "G4", neighborhood: "FAZENDA ITAQUI", reference: "REFERENCE",  city: "BARUERI", state: "SP", postal_code: "06442130", area_code: 11, phone: "21683228", email: "teste@example.com")

          sender = CorreiosSigep::Models::Sender.new(name: "JEFERSON VAZ DOS SANTOS", address: "RUA BLA BLA BLA", number: 666, complement: "APT 100", neighborhood: "PINHEIROS", city: "SÃO PAULO", state: "SP", postal_code: "05427020", reference: "REFERENCE", area_code: 16, phone: "41606809", email: "jeff@example.com")
          object1 = CorreiosSigep::Models::Object.new(item: "127078", id: "1405670", description: "Pen Drive SAndisk 16GB SDCZ50-016G-A95", ship: "ship", num: 1)
          object2 = CorreiosSigep::Models::Object.new(item: "277574", id: "1405670", description: "Chip unico claro Pre pago", ship: "ship", num: 2)
          product = CorreiosSigep::Models::Product.new(code: "code", type: "type", quantity: 3)

          collect = CorreiosSigep::Models::Collect.new(type: "CA", number: 1, client_id: "1405670", ag: "1", card: "1234", declared_value: "100.5", aditional_service: "20.5", description: "teste", ar: "2", checklist: "cklist", sender: sender, objects: [object1, object2], product: product)

          logistic_reverse.recipient  = recipient
          logistic_reverse.collect    = collect
        end

        it 'will generate the correct XMl of the logistic_reverse' do
          expected_xml = "<?xml version=\"1.0\"?>\n<root>\n  <destinatario>\n    <nome>ESTABELECIMENT W*M</nome>\n    <logradouro>ESTRADA DE ACESSO A JANDIRA</logradouro>\n    <numero>1400</numero>\n    <complemento>G4</complemento>\n    <bairro>FAZENDA ITAQUI</bairro>\n    <referencia>REFERENCE</referencia>\n    <cidade>BARUERI</cidade>\n    <uf>SP</uf>\n    <cep>06442130</cep>\n    <ddd>11</ddd>\n    <telefone>21683228</telefone>\n    <email>teste@example.com</email>\n  </destinatario>\n  <coletas_solicitadas>\n    <tipo>CA</tipo>\n    <id_cliente>1405670</id_cliente>\n    <valor_declarado>100.5</valor_declarado>\n    <descricao>teste</descricao>\n    <cklist>cklist</cklist>\n    <numero>1</numero>\n    <ag>1</ag>\n    <cartao>1234</cartao>\n    <servico_adicional>20.5</servico_adicional>\n    <ar>2</ar>\n    <remetente>\n      <nome>JEFERSON VAZ DOS SANTOS</nome>\n      <logradouro>RUA BLA BLA BLA</logradouro>\n      <numero>666</numero>\n      <complemento>APT 100</complemento>\n      <bairro>PINHEIROS</bairro>\n      <reference>REFERENCE</reference>\n      <cidade>S&#xC3;O PAULO</cidade>\n      <uf>SP</uf>\n      <cep>05427020</cep>\n      <ddd>16</ddd>\n      <telefone>41606809</telefone>\n      <email>jeff@example.com</email>\n      <identificacao/>\n      <ddd_celular/>\n      <celular/>\n      <sms/>\n    </remetente>\n    <produto>\n      <codigo>code</codigo>\n      <tipo>type</tipo>\n      <qtd>3</qtd>\n    </produto>\n    <obj_col>\n      <obj>\n        <item>127078</item>\n        <id>1405670</id>\n        <desc>Pen Drive SAndisk 16GB SDCZ50-016G-A95</desc>\n        <ship>ship</ship>\n        <num>1</num>\n      </obj>\n      <obj>\n        <item>277574</item>\n        <id>1405670</id>\n        <desc>Chip unico claro Pre pago</desc>\n        <ship>ship</ship>\n        <num>2</num>\n      </obj>\n    </obj_col>\n  </coletas_solicitadas>\n</root>\n"
          expect(logistic_reverse.to_xml).to eq expected_xml
        end
      end
    end
  end
end
