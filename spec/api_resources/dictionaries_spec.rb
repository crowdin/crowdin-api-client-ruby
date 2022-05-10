# frozen_string_literal: true

describe Crowdin::ApiResources::Dictionaries do
  describe 'Default endpoints' do
    describe '#list_dictionaries' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/dictionaries")
        list_dictionaries = @crowdin.list_dictionaries({}, project_id)
        expect(list_dictionaries).to eq(200)
      end
    end

    describe '#edit_dictionary' do
      let(:language_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/dictionaries/#{language_id}")
        edit_dictionary = @crowdin.edit_dictionary(language_id, {}, project_id)
        expect(edit_dictionary).to eq(200)
      end
    end
  end
end
