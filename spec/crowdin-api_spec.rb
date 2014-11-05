require 'spec_helper'

describe Crowdin::API do
  before do
    @crowdin_client = Crowdin::API.new
  end

  it 'should have a version' do
    expect(Crowdin::API::VERSION).to eq('0.2.5')
  end
end
