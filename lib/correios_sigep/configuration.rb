module CorreiosSigep
  class Configuration
    attr_accessor :administrative_code, :card, :contract, :password,
                  :service_code, :user, :wsdl_base_url, :proxy, :timeout

    def administrative_fields
      @administrative_fields ||=
        Models::AdministrativeFields.new(administrative_code: administrative_code,
                                         card: card, contract: contract,
                                         service_code: service_code)

    end
  end
end
