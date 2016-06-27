require 'spec_helper'
require 'crowdin-api'

describe Crowdin::API do
  before(:each) do
    @crowdin_client = Crowdin::API.new
  end

  it 'should have a version' do
    expect(Crowdin::API::VERSION).to eq('0.4.0')
  end

  it 'should get a list of supported languages' do
    expect(@crowdin_client.supported_languages).to eq([{}])
  end
end
