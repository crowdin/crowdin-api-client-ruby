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

  it '#target_api_url should equal /api/v2 by default' do
    expect(@crowdin.config.target_api_url).to eq('/api/v2')
  end

  describe '#logger_enabled?' do
    it 'should be false by default' do
      expect(@crowdin.config.logger_enabled?).to be_falsey
    end

    it 'should equal specified argument' do
      @crowdin = Crowdin::Client.new do |config|
        config.enable_logger = true
      end

      expect(@crowdin.config.logger_enabled?).to be_truthy
    end
  end

  describe '#enterprise_mode?' do
    it 'should be false by default' do
      expect(@crowdin.config.enterprise_mode?).to be_falsey
    end

    it 'should equal specified arguments' do
      @crowdin = Crowdin::Client.new do |config|
        config.organization_domain = 'organization_domain'
      end

      expect(@crowdin.config.enterprise_mode?).to be_truthy
    end
  end

  describe '#base_url' do
    it 'should equal https://api.crowdin.com by default' do
      expect(@crowdin.config.base_url).to eq('https://api.crowdin.com')
    end

    it 'should equal specified organization domain' do
      @crowdin = Crowdin::Client.new do |config|
        config.organization_domain = 'organization_domain'
      end

      expect(@crowdin.config.base_url).to eq('https://organization_domain.api.crowdin.com')
    end

    it 'should equal full specified organization domain when user specify full url (with .com)' do
      @crowdin = Crowdin::Client.new do |config|
        config.organization_domain = 'organization_domain.com'
      end

      expect(@crowdin.config.base_url).to eq('organization_domain.com')
    end
  end
end
