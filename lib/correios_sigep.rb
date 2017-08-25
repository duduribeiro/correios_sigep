require 'net/http/persistent'
require 'nokogiri'
require 'savon'

require 'correios_sigep/version'

require 'correios_sigep/builders'
require 'correios_sigep/dsl'
require 'correios_sigep/logistic_reverse'
require 'correios_sigep/models'

module CorreiosSigep
  autoload :Configuration, 'correios_sigep/configuration'

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
