# frozen_string_literal: true

describe Crowdin::ApiResources::SourceStrings do
  describe 'Default endpoints' do
    describe '#list_strings' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/strings")
        list_strings = @crowdin.list_strings({}, project_id)
        expect(list_strings).to eq(200)
      end
    end
  end
end
