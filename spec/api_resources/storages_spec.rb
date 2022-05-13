# frozen_string_literal: true

describe Crowdin::ApiResources::Storages do
  describe 'Default endpoints' do
    describe '#list_storages' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/storages")
        list_storages = @crowdin.list_storages
        expect(list_storages).to eq(200)
      end
    end
  end
end
