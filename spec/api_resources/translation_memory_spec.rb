# frozen_string_literal: true

describe Crowdin::ApiResources::TranslationMemory do
  describe 'Default endpoints' do
    describe '#list_tms' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/tms")
        list_tms = @crowdin.list_tms
        expect(list_tms).to eq(200)
      end
    end
  end
end
