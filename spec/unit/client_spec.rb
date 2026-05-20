# frozen_string_literal: true

describe 'Crowdin Client' do
  let(:crowdin_client) { Crowdin::Client.new }

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
      expect(@crowdin.options).to include(timeout: nil)
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

  describe 'Crowdin Client graphql' do
    let(:graphql_request) do
      {
        query: 'query Viewer { viewer { id } }',
        operationName: 'Viewer',
        variables: { projectId: 1, emptyValue: nil }
      }
    end
    let(:graphql_response) { { 'data' => { 'viewer' => { 'id' => 1 } } } }

    it 'posts to the default GraphQL endpoint', :default do
      stub_request(:post, 'https://api.crowdin.com/api/graphql')
        .with(body: graphql_request.to_json)
        .to_return(body: graphql_response.to_json)

      expect(@crowdin.graphql(graphql_request)).to eq(graphql_response)
    end

    it 'posts to the Enterprise GraphQL endpoint', :enterprise do
      stub_request(:post, 'https://domain.api.crowdin.com/api/graphql')
        .with(body: graphql_request.to_json)
        .to_return(body: graphql_response.to_json)

      expect(@crowdin.graphql(graphql_request)).to eq(graphql_response)
    end

    it 'supports a custom GraphQL endpoint URL', :default do
      custom_url = 'http://localhost:3000/api/graphql'

      stub_request(:post, custom_url)
        .with(body: graphql_request.to_json)
        .to_return(body: graphql_response.to_json)

      expect(@crowdin.graphql(graphql_request, url: custom_url)).to eq(graphql_response)
    end
  end

  describe 'connection' do
    subject(:connection) { crowdin_client.connection }

    it 'timeout is disabled by default' do
      is_expected.to have_attributes(options: include(timeout: be_nil))
    end

    context 'when new request timeout config is set' do
      let(:new_request_timeout) { 60 }

      let(:crowdin_client) do
        Crowdin::Client.new do |config|
          config.request_timeout = new_request_timeout
        end
      end

      it 'timeout option is changed to new value' do
        is_expected.to have_attributes(options: include(timeout: new_request_timeout))
      end
    end
  end
end
