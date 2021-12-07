# frozen_string_literal: true

describe 'Config instance' do
  before do
    @crowdin = Crowdin::Client.new do |config|
      config.api_token  = 'api_token'
      config.project_id = 1
    end
  end

  it 'show have a #project_id' do
    expect(@crowdin.config.project_id).to_not be_nil
  end

  it 'should have a #api_token' do
    expect(@crowdin.config.api_token).to_not be_nil
  end

  it 'should have a #base_url' do
    expect(@crowdin.config.base_url).to_not be_nil
  end

  it '#target_api_url should equal /api/v2 by default' do
    expect(@crowdin.config.target_api_url).eql? '/api/v2'
  end

  it '.logger_enabled? should be false by default' do
    expect(@crowdin.config.logger_enabled?).eql? false
  end

  it '.logger_enabled?' do
    @crowdin = Crowdin::Client.new do |config|
      config.enable_logger = true
    end

    expect(@crowdin.config.logger_enabled?).eql? true
  end

  it '.enterprise_mode? should be false by default' do
    expect(@crowdin.config.enterprise_mode?).eql? false
  end

  it '.enterprise_mode?' do
    @crowdin = Crowdin::Client.new do |config|
      config.organization_domain = 'organization_domain'
    end

    expect(@crowdin.config.enterprise_mode?).eql? true
  end

  it '.base_url should equal https://api.crowdin.com by default' do
    expect(@crowdin.config.base_url).eql? 'https://api.crowdin.com'
  end

  it '.base_url should equal specified organization domain' do
    @crowdin = Crowdin::Client.new do |config|
      config.organization_domain = 'organization_domain'
    end

    expect(@crowdin.config.base_url).eql? 'https://organization_domain.api.crowdin.com'
  end

  it '.base_url should equal full specified organization domain when user specify full url (with .com)' do
    @crowdin = Crowdin::Client.new do |config|
      config.organization_domain = 'organization_domain.com'
    end

    expect(@crowdin.config.base_url).eql? 'organization_domain.com'
  end
end
