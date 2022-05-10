# frozen_string_literal: true

describe Crowdin::ApiResources::SourceFiles do
  describe 'Default endpoints' do
    describe '#list_branches' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/branches")
        list_branches = @crowdin.list_branches({}, project_id)
        expect(list_branches).to eq(200)
      end
    end
  end
end
