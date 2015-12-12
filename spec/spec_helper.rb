ENV['GEM_ENV'] = 'test'
require 'coveralls'
require 'pry'
require 'simplecov'
require 'support/logistic_reverse_helper'
require 'support/fixture_helper'
require 'webmock/rspec'
Coveralls.wear!

File.expand_path(File.dirname(File.dirname(__FILE__)))

SimpleCov.start do
  add_filter "/spec/"
end

require 'correios_sigep'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include LogisticReverseHelper
  config.include FixtureHelper

  config.before do
    CorreiosSigep.configure do |config|
      config.user                 = '60618043'
      config.password             = '8o8otn'
      config.administrative_code  = '08082650'
      config.card                 = '0057018901'
      config.contract             = '9912208555'
      config.service_code         = '41076'
    end
  end
end
