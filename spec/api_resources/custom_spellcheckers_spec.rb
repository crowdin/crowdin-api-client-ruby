# frozen_string_literal: true

describe Crowdin::ApiResources::CustomSpellcheckers do
  describe 'Enterprise endpoints' do
    describe '#list_custom_spellcheckers' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/custom-spellcheckers")
        result = @crowdin.list_custom_spellcheckers({})
        expect(result).to eq(200)
      end
    end

    describe '#get_custom_spellchecker' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/custom-spellcheckers/1")
        result = @crowdin.get_custom_spellchecker(1)
        expect(result).to eq(200)
      end
    end
  end
end
