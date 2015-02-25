require 'correios_sigep/version'
require 'correios_sigep/configuration'

module CorreiosSigep
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
