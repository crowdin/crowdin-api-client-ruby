# frozen_string_literal: true

require 'simplecov'
require 'codecov'

SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require 'crowdin-api'

RSpec.shared_context 'crowdin_client_options' do
  let(:api_token) { 'api_token' }
  let(:project_id) { 1 }
  let(:organization_domain) { 'domain' }
  let(:full_organization_domain) { 'domain.com' }
end

RSpec.configure do |config|
  config.include_context 'crowdin_client_options'
end
