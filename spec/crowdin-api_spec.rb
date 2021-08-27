require 'spec_helper'
require 'crowdin-api'

describe Crowdin::API do
  before(:each) do
    @crowdin_client = Crowdin::API.new
  end

  it 'should have a version' do
    expect(Crowdin::API::VERSION).to_not be_nil
  end

  it 'should get a list of directories' do
    expect(@crowdin_client.list_directories).to eq([{}])
  end
end
