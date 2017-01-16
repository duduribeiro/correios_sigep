module CorreiosSigep
  class Configuration
    attr_accessor :administrative_code, :card, :service_code, :wsdl_base_url, :proxy, :timeout,
                  :user, :password

    def administrative_fields
      @administrative_fields ||=
        Models::AdministrativeFields.new(administrative_code: administrative_code,
                                         card: card,
                                         service_code: service_code)

    end
  end
end
