# frozen_string_literal: true

describe Crowdin::ApiResources::Applications do
  let(:application_identifier) { 'identifier' }
  let(:path) { 'application_path' }
  describe 'Default endpoints' do
    describe '#get_application_data' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/applications/#{application_identifier}/api/#{path}")
        get_application_data = @crowdin.get_application_data(application_identifier, path)
        expect(get_application_data).to eq(200)
      end
    end

    describe '#update_or_restore_application_data' do
      it 'when request are valid', :default do
        stub_request(:put, "https://api.crowdin.com/#{target_api_url}/applications/#{application_identifier}/api/#{path}")
        get_application_data = @crowdin.update_or_restore_application_data({}, application_identifier, path)
        expect(get_application_data).to eq(200)
      end
    end

    describe '#add_application_data' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/applications/#{application_identifier}/api/#{path}")
        get_application_data = @crowdin.add_application_data({}, application_identifier, path)
        expect(get_application_data).to eq(200)
      end
    end

    describe '#delete_application_data' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/applications/#{application_identifier}/api/#{path}")
        get_application_data = @crowdin.delete_application_data({}, application_identifier, path)
        expect(get_application_data).to eq(200)
      end
    end

    describe '#edit_application_data' do
      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/applications/#{application_identifier}/api/#{path}")
        get_application_data = @crowdin.edit_application_data({}, application_identifier, path)
        expect(get_application_data).to eq(200)
      end
    end
  end

  describe 'Default endpoints' do
    describe '#list_application_consent_decisions' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/applications/consents")
        result = @crowdin.list_application_consent_decisions({})
        expect(result).to eq(200)
      end
    end

    describe '#create_application_consent_decision' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/applications/consents")
        result = @crowdin.create_application_consent_decision({})
        expect(result).to eq(200)
      end
    end

    describe '#delete_application_consent_decision' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/applications/consents/1")
        result = @crowdin.delete_application_consent_decision(1)
        expect(result).to eq(200)
      end
    end

    describe '#edit_application_consent_decision' do
      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/applications/consents/1")
        result = @crowdin.edit_application_consent_decision(1, [])
        expect(result).to eq(200)
      end
    end

    describe '#list_application_installations' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/applications/installations")
        result = @crowdin.list_application_installations({})
        expect(result).to eq(200)
      end
    end

    describe '#install_application' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/applications/installations")
        result = @crowdin.install_application({})
        expect(result).to eq(200)
      end
    end

    describe '#delete_application_installation' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/applications/installations/1")
        result = @crowdin.delete_application_installation(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#get_application_installation' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/applications/installations/1")
        result = @crowdin.get_application_installation(1)
        expect(result).to eq(200)
      end
    end

    describe '#edit_application_installation' do
      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/applications/installations/1")
        result = @crowdin.edit_application_installation(1, [])
        expect(result).to eq(200)
      end
    end

    describe '#upload_application_bundle' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/applications/installations/1/bundles")
        result = @crowdin.upload_application_bundle(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#get_application_installation_update' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/applications/installations/1/update")
        result = @crowdin.get_application_installation_update(1)
        expect(result).to eq(200)
      end
    end

    describe '#apply_application_installation_update' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/applications/installations/1/update")
        result = @crowdin.apply_application_installation_update(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#list_application_kv_records' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/applications/1/storage/kv/records")
        result = @crowdin.list_application_kv_records(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#add_application_kv_record' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/applications/1/storage/kv/records")
        result = @crowdin.add_application_kv_record(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#delete_application_kv_record' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/applications/1/storage/kv/records/1")
        result = @crowdin.delete_application_kv_record(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#get_application_kv_record' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/applications/1/storage/kv/records/1")
        result = @crowdin.get_application_kv_record(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#edit_application_kv_record' do
      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/applications/1/storage/kv/records/1")
        result = @crowdin.edit_application_kv_record(1, 1, [])
        expect(result).to eq(200)
      end
    end
  end
end
