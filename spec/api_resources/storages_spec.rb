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

    describe '#add_storage' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/storages")
        add_storage = @crowdin.add_storage('README.md')
        expect(add_storage).to eq(200)
      end
    end

    describe '#get_storage' do
      let(:storage_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/storages/#{storage_id}")
        get_storage = @crowdin.get_storage(storage_id)
        expect(get_storage).to eq(200)
      end
    end

    describe '#delete_storage' do
      let(:storage_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/storages/#{storage_id}")
        delete_storage = @crowdin.delete_storage(storage_id)
        expect(delete_storage).to eq(200)
      end
    end
  end
end
