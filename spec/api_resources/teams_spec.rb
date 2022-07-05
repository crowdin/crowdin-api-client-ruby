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

    describe '#list_teams' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/teams")
        list_teams = @crowdin.list_teams({})
        expect(list_teams).to eq(200)
      end
    end

    describe '#add_team' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/teams")
        add_team = @crowdin.add_team({})
        expect(add_team).to eq(200)
      end
    end

    describe '#get_team' do
      let(:team_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/teams/#{team_id}")
        get_team = @crowdin.get_team(team_id, {})
        expect(get_team).to eq(200)
      end
    end

    describe '#delete_team' do
      let(:team_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/teams/#{team_id}")
        delete_team = @crowdin.delete_team(team_id)
        expect(delete_team).to eq(200)
      end
    end

    describe '#edit_team' do
      let(:team_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:patch, "https://domain.api.crowdin.com/#{target_api_url}/teams/#{team_id}")
        edit_team = @crowdin.edit_team(team_id, {})
        expect(edit_team).to eq(200)
      end
    end

    describe '#team_members_list' do
      let(:team_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/teams/#{team_id}/members")
        team_members_list = @crowdin.team_members_list(team_id, {})
        expect(team_members_list).to eq(200)
      end
    end

    describe '#add_team_members' do
      let(:team_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/teams/#{team_id}/members")
        add_team_members = @crowdin.add_team_members(team_id, {})
        expect(add_team_members).to eq(200)
      end
    end

    describe '#delete_all_team_members' do
      let(:team_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/teams/#{team_id}/members")
        delete_all_team_members = @crowdin.delete_all_team_members(team_id)
        expect(delete_all_team_members).to eq(200)
      end
    end

    describe '#delete_team_member' do
      let(:team_id) { 1 }
      let(:member_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/teams/#{team_id}/members/#{member_id}")
        delete_team_member = @crowdin.delete_team_member(team_id, member_id)
        expect(delete_team_member).to eq(200)
      end
    end
  end
end
