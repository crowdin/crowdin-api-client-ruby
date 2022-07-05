# frozen_string_literal: true

require 'simplecov'
require 'codecov'

SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require 'webmock/rspec'
require 'crowdin-api'

RSpec.shared_context 'crowdin_client_options' do
  let(:api_token) { 'api_token' }
  let(:project_id) { 1 }
  let(:organization_domain) { 'domain' }
  let(:full_organization_domain) { 'domain.com' }
  let(:target_api_url) { 'api/v2' }
end

RSpec.configure do |config|
  config.include_context 'crowdin_client_options'

  config.before(:each) do |spec|
    @crowdin = if spec.metadata[:enterprise]
                 Crowdin::Client.new { |cfg| cfg.organization_domain = organization_domain }
               else # default
                 Crowdin::Client.new
               end
  end
end
