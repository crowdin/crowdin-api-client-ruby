require 'spec_helper'

describe 'External request' do
  it 'should call crowdin api' do
    uri = URI('https://api.crowdin.com//api/project/123/supported-languages')

    response = JSON.load(Net::HTTP.get(uri))

    expect(response).to eq([{}])
  end
end
