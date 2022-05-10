# frozen_string_literal: true

describe Crowdin::ApiResources::Screenshots do
  describe 'Default endpoints' do
    describe '#list_screenshots' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/screenshots")
        list_screenshots = @crowdin.list_screenshots({}, project_id)
        expect(list_screenshots).to eq(200)
      end
    end
  end
end
