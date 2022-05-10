# frozen_string_literal: true

describe Crowdin::ApiResources::StringComments do
  describe 'Default endpoints' do
    describe '#list_string_comments' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/comments")
        list_string_comments = @crowdin.list_string_comments({}, project_id)
        expect(list_string_comments).to eq(200)
      end
    end
  end
end
