# frozen_string_literal: true

describe Crowdin::ApiResources::Organization do
  describe 'Enterprise endpoints' do
    describe '#get_organization_info' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/organization")
        result = @crowdin.get_organization_info
        expect(result).to eq(200)
      end
    end

    describe '#get_organization_authentication_settings' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/organization/auth-settings")
        result = @crowdin.get_organization_authentication_settings
        expect(result).to eq(200)
      end
    end
  end
end
