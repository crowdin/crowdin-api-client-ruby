describe Crowdin::ApiResources::Notifications do
  describe 'Default endpoints' do
    describe '#send_notification_to_organization_member' do
      let(:body) do
        { "message" => "New notification message" }
      end

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/notify")
          .with(body: { "message" => "New notification message" })
        query =  { message: "New notification message" }
        add_project = @crowdin.send_notification_to_organization_member(query)
        expect(add_project).to eq(200)
      end

      it 'raises ArgumentError when request is missing required query parameter', :default do
        expect do
          @crowdin.send_notification_to_organization_member({})
        end.to raise_error(ArgumentError, ':message is required')
      end

    end

    describe '#send_notification_to_organization_member' do
      let(:project_id) { 1 }
      let(:body) do
        { "message" => "New notification message" }
      end

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/notify")
          .with(body: { "message" => "New notification message" })
        query =  { message: "New notification message" }
        add_project = @crowdin.send_notifications_to_project_members(project_id, query)
        expect(add_project).to eq(200)
      end

      it 'raises ArgumentError when request is missing required query parameter', :default do
        expect do
          @crowdin.send_notifications_to_project_members(project_id, {})
        end.to raise_error(ArgumentError, ':message is required')
      end

      it 'raises ArgumentError when request is missing required query parameter', :default do
        query =  { message: "New notification message" }
        expect do
          @crowdin.send_notifications_to_project_members(nil, query)
        end.to raise_error(ArgumentError, ':project_id is required in parameters or while Client initialization')
      end

    end
  end
end