# frozen_string_literal: true

describe 'Crowdin Client' do
  it 'should have a list of API Resources' do
    expect(Crowdin::API_RESOURCES_MODULES).to_not be_nil
  end

  it 'should have a list of Error Raisers' do
    expect(Crowdin::ERROR_RAISERS_MODULES).to_not be_nil
  end

  it 'should have a version' do
    expect(Crowdin::Client::VERSION).to_not be_nil
  end

  describe 'Crowdin Client with a default options' do
    it 'should have a RestClient connection', :default do
      expect(@crowdin.connection.class).to eq(RestClient::Resource)
    end

    it 'should have options and headers for RestClient', :default do
      expect(@crowdin.options.class).to eq(Hash)
      expect(@crowdin.options).to include(:headers)
    end

    it 'should have a Config instance', :default do
      expect(@crowdin.config.class).to eq(Crowdin::Configuration)
    end

    it 'should have a disabled Logger by default', :default do
      expect(@crowdin.logger_enabled?).to be_falsey
      expect(@crowdin.logger).to be_nil
    end

    it 'should have a disabled Enterprise mode by default', :default do
      expect(@crowdin.enterprise_mode?).to be_falsey
    end

    it 'should have a default target api url', :default do
      expect(@crowdin.config.target_api_url).to eq('/api/v2')
    end
    it 'should have a default base url', :default do
      expect(@crowdin.config.base_url).to eq('https://api.crowdin.com')
    end
  end

  describe 'Crowdin Client with enabled Logger' do
    before do
      @crowdin = Crowdin::Client.new do |config|
        config.enable_logger = true
      end
    end

    it 'should have a Logger instance' do
      expect(@crowdin.logger_enabled?).to be_truthy
      expect(@crowdin.logger.class).to eq(Logger)
    end
  end

  describe 'Crowdin Client with enabled Enterprise mode' do
    before do
      @crowdin = Crowdin::Client.new do |config|
        config.organization_domain = organization_domain
      end
    end

    it 'should have a generated Enterprise url' do
      expect(@crowdin.enterprise_mode?).to be_truthy
      expect(@crowdin.config.base_url).to eq("https://#{organization_domain}.api.crowdin.com")
    end
  end

  describe 'Crowdin Client with enabled Enterprise mode and specified full organization domain' do
    before do
      @crowdin = Crowdin::Client.new do |config|
        config.organization_domain = full_organization_domain
      end
    end

    it 'should have a generated Enterprise url' do
      expect(@crowdin.enterprise_mode?).to be_truthy
      expect(@crowdin.config.base_url).to eq("https://#{full_organization_domain}")
    end
  end

  describe 'Crowdin Client fetch_all' do
    it 'should raise error if fetch_all is called for unsupported methods' do
      expect { @crowdin.fetch_all(:add_bundle).to raise_error(Crowdin::Errors::FetchAllProcessingError) }
    end
  end

  describe 'Crowdin Client fetch_all' do
    it 'should raise error if fetch_all is called for unsupported methods' do
      expect { @crowdin.fetch_all(:export_bundle).to raise_error(Crowdin::Errors::FetchAllProcessingError) }
    end
  end
end
