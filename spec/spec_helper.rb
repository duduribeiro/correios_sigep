require 'simplecov'
require 'support/logistic_reverse_helper'

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

  config.before do
    CorreiosSigep.configure do |config|
      config.user                 = 'user'
      config.password             = 'password'
      config.administrative_code  = '12345'
      config.card                 = 'card'
      config.contract             = '67890'
      config.service_code         = 'service_code'
    end
  end
end
