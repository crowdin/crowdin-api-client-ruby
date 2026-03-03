# frozen_string_literal: true

describe Crowdin::ApiResources::AI do
  describe 'Default endpoints' do
    describe '#ai_translate_strings' do
      let(:user_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/users/#{user_id}/ai/translations/translate-strings")
        ai_translate_strings = @crowdin.ai_translate_strings(user_id)
        expect(ai_translate_strings).to eq(200)
      end
    end
  end
end
