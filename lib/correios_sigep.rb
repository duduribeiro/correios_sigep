require 'correios_sigep/version'
require 'correios_sigep/configuration'
require 'correios_sigep/models/recipient'
require 'correios_sigep/models/product'
require 'correios_sigep/models/recipient'
require 'correios_sigep/models/sender'
require 'correios_sigep/models/object'
require 'correios_sigep/models/sender'
require 'correios_sigep/models/collect'
require 'correios_sigep/models/logistic_reverse'
require 'nokogiri'

module CorreiosSigep
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
