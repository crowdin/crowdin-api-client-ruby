# frozen_string_literal: true

describe Crowdin::ApiResources::Tasks do
  describe 'Default endpoints' do
    describe '#list_tasks' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/tasks")
        list_tasks = @crowdin.list_tasks({}, project_id)
        expect(list_tasks).to eq(200)
      end
    end
  end
end
