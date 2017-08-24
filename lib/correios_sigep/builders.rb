module CorreiosSigep
  module Builders
    autoload :Collect, 'correios_sigep/builders/collect'
    autoload :Object, 'correios_sigep/builders/object'
    autoload :Person, 'correios_sigep/builders/person'
    autoload :Product, 'correios_sigep/builders/product'

    module XML
      autoload :Collect, 'correios_sigep/builders/xml/collect'
      autoload :CollectObjects, 'correios_sigep/builders/xml/collect_objects'
      autoload :Product, 'correios_sigep/builders/xml/product'
      autoload :Recipient, 'correios_sigep/builders/xml/recipient'
      autoload :Request, 'correios_sigep/builders/xml/request'
      autoload :RequestCollectNumber, 'correios_sigep/builders/xml/request_collect_number'
      autoload :RequestSRO, 'correios_sigep/builders/xml/request_sro'
      autoload :Sender,  'correios_sigep/builders/xml/sender'
    end
  end
end
