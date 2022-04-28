# frozen_string_literal: true

describe Crowdin::Client do
  it 'should have a list of API Resources' do
    expect(Crowdin::API_RESOURCES_MODULES).to_not be_nil
  end

  it 'should have a list of Error Raisers' do
    expect(Crowdin::ERROR_RAISERS_MODULES).to_not be_nil
  end

  it 'should have a version' do
    expect(described_class::VERSION).to_not be_nil
  end

  describe 'Crowdin Client with a default options' do
    before do
      @crowdin = Crowdin::Client.new do |config|
        config.api_token  = api_token
        config.project_id = project_id
      end
    end

    it 'should have a RestClient connection' do
      expect(@crowdin.connection).to_not be_nil
      expect(@crowdin.connection.class).to eq(RestClient::Resource)
    end

    it 'should have a options and headers for RestClient' do
      expect(@crowdin.options).to_not be_nil
      expect(@crowdin.options.class).to eq(Hash)
      expect(@crowdin.options[:headers]).to_not be_nil
      expect(@crowdin.options[:headers].class).to eq(Hash)
    end

    it 'should have a Config instance' do
      expect(@crowdin.config).to_not be_nil
      expect(@crowdin.config.class).to eq(Crowdin::Configuration)
    end

    it 'should have a disabled Logger by default' do
      expect(@crowdin.logger).to be_nil
    end

    it 'should have a disabled Enterprise mode by default' do
      expect(@crowdin.enterprise_mode?).to be_falsey
    end

    it 'should have a default base url' do
      expect(@crowdin.config.base_url).to_not be_nil
      expect(@crowdin.config.target_api_url).to eq('/api/v2')
    end
  end

  describe 'Crowdin Client with enabled Logger' do
    before do
      @crowdin = Crowdin::Client.new do |config|
        config.api_token     = api_token
        config.project_id    = project_id
        config.enable_logger = true
      end
    end

    it 'should have a Logger instance' do
      expect(@crowdin.logger).to_not be_nil
      expect(@crowdin.logger.class).to eq(Logger)
    end
  end

  describe 'Crowdin Client with enabled enterprise mode' do
    before do
      @crowdin = Crowdin::Client.new do |config|
        config.api_token           = api_token
        config.project_id          = project_id
        config.organization_domain = organization_domain
      end
    end

    it 'should have a generated Enterprise url' do
      expect(@crowdin.config.base_url).to_not be_nil
      expect(@crowdin.enterprise_mode?).to be_truthy
      expect(@crowdin.config.base_url).to eq("https://#{organization_domain}.api.crowdin.com")
    end
  end

  describe 'Crowdin Client with enabled enterprise mode and specified full organization domain' do
    before do
      @crowdin = Crowdin::Client.new do |config|
        config.api_token           = api_token
        config.project_id          = project_id
        config.organization_domain = full_organization_domain
      end
    end

    it 'should have a generated Enterprise url' do
      expect(@crowdin.config.base_url).to_not be_nil
      expect(@crowdin.enterprise_mode?).to be_truthy
      expect(@crowdin.config.base_url).to eq("https://#{full_organization_domain}")
    end
  end
end
