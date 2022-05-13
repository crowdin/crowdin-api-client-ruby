# frozen_string_literal: true

describe Crowdin::ApiResources::Users do
  describe 'Default endpoints' do
    describe '#get_authenticated_user' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/user")
        get_authenticated_user = @crowdin.get_authenticated_user
        expect(get_authenticated_user).to eq(200)
      end
    end

    describe '#list_project_members' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/members")
        list_project_members = @crowdin.list_project_members({}, project_id)
        expect(list_project_members).to eq(200)
      end
    end

    describe '#get_member_info' do
      let(:member_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/members/#{member_id}")
        get_member_info = @crowdin.get_member_info(member_id, project_id)
        expect(get_member_info).to eq(200)
      end
    end
  end

  describe 'Enterprise endpoints' do
    describe '#add_project_member' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/projects/#{project_id}/members")
        add_project_member = @crowdin.add_project_member({}, project_id)
        expect(add_project_member).to eq(200)
      end
    end

    describe '#get_project_member_permissions' do
      let(:member_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/projects/#{project_id}/members/#{member_id}")
        get_project_member_permissions = @crowdin.get_project_member_permissions(member_id, project_id)
        expect(get_project_member_permissions).to eq(200)
      end
    end

    describe '#replace_project_permissions' do
      let(:member_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:put, "https://domain.api.crowdin.com/#{target_api_url}/projects/#{project_id}/members/#{member_id}")
        replace_project_permissions = @crowdin.replace_project_permissions(member_id, {}, project_id)
        expect(replace_project_permissions).to eq(200)
      end
    end

    describe '#delete_member_from_project' do
      let(:member_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/projects/#{project_id}/members/#{member_id}")
        delete_member_from_project = @crowdin.delete_member_from_project(member_id, {}, project_id)
        expect(delete_member_from_project).to eq(200)
      end
    end

    describe '#list_users' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/users")
        list_users = @crowdin.list_users
        expect(list_users).to eq(200)
      end
    end

    describe '#invite_user' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/users")
        invite_user = @crowdin.invite_user
        expect(invite_user).to eq(200)
      end
    end

    describe '#get_user' do
      let(:user_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/users/#{user_id}")
        get_user = @crowdin.get_user(user_id)
        expect(get_user).to eq(200)
      end
    end

    describe '#delete_user' do
      let(:user_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/users/#{user_id}")
        delete_user = @crowdin.delete_user(user_id)
        expect(delete_user).to eq(200)
      end
    end

    describe '#edit_user' do
      let(:user_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:patch, "https://domain.api.crowdin.com/#{target_api_url}/users/#{user_id}")
        edit_user = @crowdin.edit_user(user_id)
        expect(edit_user).to eq(200)
      end
    end
  end
end
