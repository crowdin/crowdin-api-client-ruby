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
      subject(:add_storage) { @crowdin.add_storage(file) }

      let(:file) { 'README.md' }

      it 'uploads the file to the storage', :default do
        expected_response = 'expected_response'

        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/storages")
          .with(
            body: File.read(file),
            headers: {
              'Content-Type' => 'application/octet-stream',
              'Crowdin-API-FileName' => File.basename(file)
            }
          )
          .to_return(
            body: JSON.dump(expected_response)
          )

        is_expected.to eq(expected_response)
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
