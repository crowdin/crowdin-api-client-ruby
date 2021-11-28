# frozen_string_literal: true

describe 'Config instance' do
  it 'should have a project_id' do
    @crowdin = Crowdin::Client.new do |config|
      config.project_id = 1
    end

    expect(@crowdin.config.project_id).to_not be_nil
  end

  it 'should have a api_token' do
    @crowdin = Crowdin::Client.new do |config|
      config.api_token = 'api_token'
    end

    expect(@crowdin.config.api_token).to_not be_nil
  end

  it 'should have a base_url' do
    @crowdin = Crowdin::Client.new do |config|
      config.api_token = 'api_token'
    end

    expect(@crowdin.config.base_url).to_not be_nil
  end

  it 'should have a logger set to false by default' do
    @crowdin = Crowdin::Client.new do |config|
      config.api_token = 'api_token'
    end

    expect(@crowdin.config.logger).eql? false
  end
end
