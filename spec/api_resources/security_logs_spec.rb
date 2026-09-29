# frozen_string_literal: true

describe Crowdin::ApiResources::SecurityLogs do
  describe 'Default endpoints' do
    describe '#list_user_security_logs' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/security-logs")
        result = @crowdin.list_user_security_logs(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#get_user_security_log' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/security-logs/1")
        result = @crowdin.get_user_security_log(1, 1)
        expect(result).to eq(200)
      end
    end
  end

  describe 'Enterprise endpoints' do
    describe '#list_organization_security_logs' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/security-logs")
        result = @crowdin.list_organization_security_logs({})
        expect(result).to eq(200)
      end
    end

    describe '#get_organization_security_log' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/security-logs/1")
        result = @crowdin.get_organization_security_log(1)
        expect(result).to eq(200)
      end
    end
  end
end
