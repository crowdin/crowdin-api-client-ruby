# frozen_string_literal: true

describe Crowdin::ApiResources::SourceStrings do
  describe 'Default endpoints' do
    describe '#list_strings' do
      it 'returns 200 when request is valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/strings")
        list_strings = @crowdin.list_strings({}, project_id)
        expect(list_strings).to eq(200)
      end
    end

    describe '#add_string' do
      it 'returns 200 when request is valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/strings")
        add_string = @crowdin.add_string({}, project_id)
        expect(add_string).to eq(200)
      end
    end

    describe '#get_string' do
      let(:string_id) { 1 }

      it 'returns 200 when request is valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/strings/#{string_id}")
        get_string = @crowdin.get_string(string_id, {}, project_id)
        expect(get_string).to eq(200)
      end
    end

    describe '#delete_string' do
      let(:string_id) { 1 }

      it 'returns 200 when request is valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/strings/#{string_id}")
        delete_string = @crowdin.delete_string(string_id, project_id)
        expect(delete_string).to eq(200)
      end
    end

    describe '#edit_string' do
      let(:string_id) { 1 }

      it 'returns 200 when request is valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/strings/#{string_id}")
        edit_string = @crowdin.edit_string(string_id, {}, project_id)
        expect(edit_string).to eq(200)
      end
    end

    describe '#string_batch_operations' do
      it 'returns 200 when request is valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/strings")
        string_batch_operations = @crowdin.string_batch_operations({}, project_id)
        expect(string_batch_operations).to eq(200)
      end
    end
  end
end
