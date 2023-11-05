# frozen_string_literal: true

describe Crowdin::ApiResources::Applications do
  let(:application_identifier) { 'identifier of the application' }
  let(:path) { 'application implemented path' }
  describe 'Default endpoints' do
    describe '#get_application_data' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api/crowdin.com/#{target_api_url}/applications/#{application_identifier}/api/#{path}")
        get_application_data = @crowdin.get_application_data(application_identifier, path)
        expect(get_application_data).to eq(200)
      end
    end

    describe '#update_or_restore_application_data' do
      it 'when request are valid', :default do
        stub_request(:put, "https://api/crowdin.com/#{target_api_url}/applications/#{application_identifier}/api/#{path}")
        get_application_data = @crowdin.update_or_restore_application_data({}, application_identifier, path)
        expect(get_application_data).to eq(200)
      end
    end

    describe '#add_application_data' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api/crowdin.com/#{target_api_url}/applications/#{application_identifier}/api/#{path}")
        get_application_data = @crowdin.update_or_restore_application_data({}, application_identifier, path)
        expect(get_application_data).to eq(200)
      end
    end

    describe '#delete_application_data' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api/crowdin.com/#{target_api_url}/applications/#{application_identifier}/api/#{path}")
        get_application_data = @crowdin.update_or_restore_application_data({}, application_identifier, path)
        expect(get_application_data).to eq(200)
      end
    end

    describe '#edit_application_data' do
      it 'when request are valid', :default do
        stub_request(:patch, "https://api/crowdin.com/#{target_api_url}/applications/#{application_identifier}/api/#{path}")
        get_application_data = @crowdin.update_or_restore_application_data({}, application_identifier, path)
        expect(get_application_data).to eq(200)
      end
    end
  end
end
