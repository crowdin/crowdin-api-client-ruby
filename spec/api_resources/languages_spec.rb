# frozen_string_literal: true

describe Crowdin::ApiResources::Languages do
  describe 'Default endpoints' do
    describe '#list_languages' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/languages")
        list_languages = @crowdin.list_languages
        expect(list_languages).to eq(200)
      end
    end

    describe '#add_custom_language' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/languages")
        add_custom_language = @crowdin.add_custom_language
        expect(add_custom_language).to eq(200)
      end
    end

    describe '#get_language' do
      let(:language_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/languages/#{language_id}")
        get_language = @crowdin.get_language(language_id)
        expect(get_language).to eq(200)
      end
    end

    describe '#delete_custom_language' do
      let(:language_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/languages/#{language_id}")
        delete_custom_language = @crowdin.delete_custom_language(language_id)
        expect(delete_custom_language).to eq(200)
      end
    end

    describe '#edit_custom_language' do
      let(:language_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/languages/#{language_id}")
        edit_custom_language = @crowdin.edit_custom_language(language_id)
        expect(edit_custom_language).to eq(200)
      end
    end
  end
end
