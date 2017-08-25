
module CorreiosSigep
  module Models
    autoload :AdministrativeFields, 'correios_sigep/models/administrative_fields'
    autoload :Collect, 'correios_sigep/models/collect'
    autoload :CorreiosResponseCodes, 'correios_sigep/models/correios_response_codes'
    autoload :LogisticReverse, 'correios_sigep/models/logistic_reverse'
    autoload :Object, 'correios_sigep/models/object'
    autoload :Product, 'correios_sigep/models/product'
    autoload :Recipient, 'correios_sigep/models/recipient'
    autoload :Sender, 'correios_sigep/models/sender'
    autoload :SRO, 'correios_sigep/models/sro'

    module Errors
      autoload :CollectNotAnsweredForTheZipcode, 'correios_sigep/models/errors/collect_not_answered_for_the_zipcode'
      autoload :CollectNumberNotFound, 'correios_sigep/models/errors/collect_number_not_found'
      autoload :InexistentZipcode, 'correios_sigep/models/errors/inexistent_zipcode'
      autoload :InvalidSolicitation, 'correios_sigep/models/errors/invalid_solicitation'
      autoload :NotConfiguredClient, 'correios_sigep/models/errors/not_configured_client'
      autoload :RequiredFields, 'correios_sigep/models/errors/required_fields'
      autoload :SRONotReady, 'correios_sigep/models/errors/sro_not_ready'
      autoload :TicketAlreadyUsed, 'correios_sigep/models/errors/ticket_already_used'
      autoload :UnavailableHouseCollect, 'correios_sigep/models/errors/unavailable_house_collect'
      autoload :UnavailableService, 'correios_sigep/models/errors/unavailable_service'
      autoload :InvalidContract, 'correios_sigep/models/errors/invalid_contract'
      autoload :InvalidDeclaredValue, 'correios_sigep/models/errors/invalid_declared_value'
      autoload :UnknownError, 'correios_sigep/models/errors/unknown_error'
    end
  end
end
