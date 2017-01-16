module CorreiosSigep
  module Builders
    module XML
      class RequestCollectNumber < Request
        def set_administrative_fields!(administrative_fields)
          add_node "codAdministrativo", administrative_fields.administrative_code
          add_node "codigo_servico", administrative_fields.service_code
          add_node "cartao", administrative_fields.card
        end
      end
    end
  end
end
