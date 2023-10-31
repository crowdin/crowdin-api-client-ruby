# frozen_string_literal: true

describe Crowdin::ApiResources::Notifications do
  describe 'Default endpoints' do
    describe '#send_notification_to_authenticated_user' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/notify")
          .with(body: { 'message' => 'New notification message' })
        query = { message: 'New notification message' }
        response = @crowdin.send_notification_to_authenticated_user(query)
        expect(response).to eq(200)
      end

      it 'raises ArgumentError when request is missing required query parameter', :default do
        expect do
          @crowdin.send_notification_to_authenticated_user({})
        end.to raise_error(ArgumentError, ':message is required')
      end
    end

    describe '#send_notifications_to_project_members' do
      let(:project_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/notify")
          .with(body: { 'message' => 'New notification message' })
        query = { message: 'New notification message' }
        response = @crowdin.send_notifications_to_project_members(query, project_id)
        expect(response).to eq(200)
      end

      it 'raises ArgumentError when request is missing required query parameter', :default do
        expect do
          @crowdin.send_notifications_to_project_members({}, project_id)
        end.to raise_error(ArgumentError, ':message is required')
      end

      it 'raises ArgumentError when request is missing project_id parameter', :default do
        query =  { message: 'New notification message' }
        expect do
          @crowdin.send_notifications_to_project_members(query, nil)
        end.to raise_error(ArgumentError, ':project_id is required in parameters or while Client initialization')
      end
    end
  end

  describe 'Enterprise endpoints' do
    describe '#send_notification_to_organization_members' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/notify")
          .with(body: { 'message' => 'New notification message' })
        query = { message: 'New notification message' }
        response = @crowdin.send_notification_to_organization_members(query)
        expect(response).to eq(200)
      end

      it 'raises ArgumentError when request is missing required query parameter', :enterprise do
        expect do
          @crowdin.send_notification_to_organization_members({})
        end.to raise_error(ArgumentError, ':message is required')
      end
    end
  end
end
