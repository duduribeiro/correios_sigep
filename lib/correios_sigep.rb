require 'correios_sigep/version'
require 'correios_sigep/models/administrative_fields'
require 'correios_sigep/configuration'
require 'correios_sigep/builders/xml/recipient'
require 'correios_sigep/builders/xml/sender'
require 'correios_sigep/builders/xml/product'
require 'correios_sigep/builders/xml/collect_objects'
require 'correios_sigep/builders/xml/collect'
require 'correios_sigep/builders/xml/authentication'
require 'correios_sigep/builders/xml/request'
require 'correios_sigep/builders/xml/request_collect_number'
require 'correios_sigep/builders/xml/request_sro'
require 'correios_sigep/models/recipient'
require 'correios_sigep/models/product'
require 'correios_sigep/models/recipient'
require 'correios_sigep/models/sender'
require 'correios_sigep/models/object'
require 'correios_sigep/models/sender'
require 'correios_sigep/models/collect'
require 'correios_sigep/models/logistic_reverse'
require 'correios_sigep/models/sro'
require 'correios_sigep/models/correios_response_codes'
require 'correios_sigep/models/errors/ticket_already_used'
require 'correios_sigep/models/errors/unavailable_service'
require 'correios_sigep/models/errors/inexistent_zipcode'
require 'correios_sigep/models/errors/unavailable_house_collect'
require 'correios_sigep/models/errors/collect_not_answered_for_the_zipcode'
require 'correios_sigep/models/errors/not_configured_client'
require 'correios_sigep/models/errors/unknown_error'
require 'correios_sigep/models/errors/sro_not_ready'
require 'correios_sigep/models/errors/required_fields'
require 'correios_sigep/models/errors/collect_number_not_found'
require 'correios_sigep/logistic_reverse/base_client'
require 'correios_sigep/logistic_reverse/request_collect_number'
require 'correios_sigep/logistic_reverse/request_sro'
require 'net/http/persistent'
require 'nokogiri'
require 'savon'

module CorreiosSigep
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
