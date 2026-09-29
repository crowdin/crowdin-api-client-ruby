# frozen_string_literal: true

describe Crowdin::ApiResources::Clients do
  describe 'Enterprise endpoints' do
    describe '#list_clients' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/clients")
        result = @crowdin.list_clients({})
        expect(result).to eq(200)
      end
    end
  end
end
