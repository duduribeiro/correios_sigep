module LogisticReverseHelper
  def seed_logistic_reverse(logistic_reverse)
    recipient = CorreiosSigep::Models::Recipient.new(name: "ESTABELECIMENT W*M", address: "ESTRADA DE ACESSO A JANDIRA", number: 1400, complement: "G4", neighborhood: "FAZENDA ITAQUI", reference: "REFERENCE",  city: "BARUERI", state: "SP", postal_code: "06442130", area_code: 11, phone: "21683228", email: "teste@example.com")

    sender = CorreiosSigep::Models::Sender.new(name: "JEFERSON VAZ DOS SANTOS", address: "RUA BLA BLA BLA", number: 666, complement: "APT 100", neighborhood: "PINHEIROS", city: "SÃO PAULO", state: "SP", postal_code: "05427020", reference: "REFERENCE", area_code: 16, phone: "41606809", email: "jeff@example.com")
    object1 = CorreiosSigep::Models::Object.new(item: "127078", id: "1405670", description: "Pen Drive SAndisk 16GB SDCZ50-016G-A95", ship: "ship", num: 1)
    object2 = CorreiosSigep::Models::Object.new(item: "277574", id: "1405670", description: "Chip unico claro Pre pago", ship: "ship", num: 2)
    product = CorreiosSigep::Models::Product.new(code: "code", type: "type", quantity: 3)

    collect = CorreiosSigep::Models::Collect.new(type: "CA", number: 1, client_id: "1405670", ag: "1", card: "1234", declared_value: "100.5", aditional_service: "20.5", description: "teste", ar: "2", checklist: "cklist", sender: sender, objects: [object1, object2], product: product)

    logistic_reverse.recipient  = recipient
    logistic_reverse.collect    = collect
  end
end
