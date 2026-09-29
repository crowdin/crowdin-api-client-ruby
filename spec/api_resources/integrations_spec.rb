# frozen_string_literal: true

describe Crowdin::ApiResources::Integrations do
  describe 'Default endpoints' do
    describe '#list_jobs' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/applications/1/api/all-jobs")
        result = @crowdin.list_jobs(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#list_crowdin_files' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/applications/1/api/crowdin-files")
        result = @crowdin.list_crowdin_files(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#update_crowdin_files' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/applications/1/api/crowdin-update")
        result = @crowdin.update_crowdin_files(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#get_integration_file_progress' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/applications/1/api/file-progress")
        result = @crowdin.get_integration_file_progress(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#list_integration_files' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/applications/1/api/integration-files")
        result = @crowdin.list_integration_files(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#update_integration_files' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/applications/1/api/integration-update")
        result = @crowdin.update_integration_files(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#get_job_info' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/applications/1/api/job-info")
        result = @crowdin.get_job_info(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#cancel_job' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/applications/1/api/jobs")
        result = @crowdin.cancel_job(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#integration_login' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/applications/1/api/login")
        result = @crowdin.integration_login(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#integration_login_form_fields' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/applications/1/api/login-fields")
        result = @crowdin.integration_login_form_fields(1)
        expect(result).to eq(200)
      end
    end

    describe '#get_application_settings' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/applications/1/api/settings")
        result = @crowdin.get_application_settings(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#update_application_settings' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/applications/1/api/settings")
        result = @crowdin.update_application_settings(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#get_sync_settings' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/applications/1/api/sync-settings")
        result = @crowdin.get_sync_settings(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#update_sync_settings' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/applications/1/api/sync-settings")
        result = @crowdin.update_sync_settings(1, {})
        expect(result).to eq(200)
      end
    end
  end
end
