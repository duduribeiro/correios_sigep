module CorreiosSigep
  module LogisticReverse
    autoload :BaseClient, 'correios_sigep/logistic_reverse/base_client'
    autoload :RequestCollectNumber, 'correios_sigep/logistic_reverse/request_collect_number'
    autoload :RequestSRO, 'correios_sigep/logistic_reverse/request_sro'

    module CollectNumberActions
      autoload :ProcessInvalidRequest, 'correios_sigep/logistic_reverse/collect_number_actions/process_invalid_request'
      autoload :ProcessValidRequest, 'correios_sigep/logistic_reverse/collect_number_actions/process_valid_request'
    end
  end
end
