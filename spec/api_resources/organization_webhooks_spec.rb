# frozen_string_literal: true

describe Crowdin::ApiResources::OrganizationWebhooks do
  describe 'Default endpoints' do
    describe '#list_organization_webhooks' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/webhooks")
        result = @crowdin.list_organization_webhooks({})
        expect(result).to eq(200)
      end
    end

    describe '#add_organization_webhook' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/webhooks")
        result = @crowdin.add_organization_webhook({})
        expect(result).to eq(200)
      end
    end

    describe '#delete_organization_webhook' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/webhooks/1")
        result = @crowdin.delete_organization_webhook(1)
        expect(result).to eq(200)
      end
    end

    describe '#get_organization_webhook' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/webhooks/1")
        result = @crowdin.get_organization_webhook(1)
        expect(result).to eq(200)
      end
    end

    describe '#edit_organization_webhook' do
      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/webhooks/1")
        result = @crowdin.edit_organization_webhook(1, [])
        expect(result).to eq(200)
      end
    end
  end
end
