# frozen_string_literal: true

describe Crowdin::ApiResources::Teams do
  describe 'Enterprise endpoints' do
    describe '#add_team_to_project' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/projects/#{project_id}/teams")
        add_team_to_project = @crowdin.add_team_to_project({}, project_id)
        expect(add_team_to_project).to eq(200)
      end
    end
  end
end
