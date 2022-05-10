# frozen_string_literal: true

describe Crowdin::ApiResources::Webhooks do
  describe 'Default endpoints' do
    describe '#list_webhooks' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/webhooks")
        list_webhooks = @crowdin.list_webhooks({}, project_id)
        expect(list_webhooks).to eq(200)
      end
    end

    describe '#add_webhook' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/webhooks")
        add_webhook = @crowdin.add_webhook({}, project_id)
        expect(add_webhook).to eq(200)
      end
    end

    describe '#get_webhook' do
      let(:webhook_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/webhooks/#{webhook_id}")
        get_webhook = @crowdin.get_webhook(webhook_id, project_id)
        expect(get_webhook).to eq(200)
      end
    end

    describe '#delete_webhook' do
      let(:webhook_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/webhooks/#{webhook_id}")
        delete_webhook = @crowdin.delete_webhook(webhook_id, project_id)
        expect(delete_webhook).to eq(200)
      end
    end

    describe '#edit_screenshot' do
      let(:webhook_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/webhooks/#{webhook_id}")
        edit_screenshot = @crowdin.edit_screenshot(webhook_id, {}, project_id)
        expect(edit_screenshot).to eq(200)
      end
    end
  end
end
