# frozen_string_literal: true

describe Crowdin::ApiResources::Vendors do
  describe 'Enterprise endpoints' do
    describe '#list_vendors' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/vendors")
        list_vendors = @crowdin.list_vendors
        expect(list_vendors).to eq(200)
      end
    end
  end
end
