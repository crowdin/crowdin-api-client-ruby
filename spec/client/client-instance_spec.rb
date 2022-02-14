# frozen_string_literal: true

describe 'Config instance' do
  before do
    @crowdin = Crowdin::Client.new do |config|
      config.api_token  = 'api_token'
      config.project_id = 1
    end
  end

  it 'should have a version' do
    expect(Crowdin::Client::VERSION).to_not be_nil
  end
end
