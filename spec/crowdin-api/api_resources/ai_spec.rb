# frozen_string_literal: true

require 'spec_helper'

describe Crowdin::ApiResources::Ai do
  describe '#ai_translate_strings' do
    let(:user_id) { 1 }

    it 'when request are valid in Crowdin mode' do
      @crowdin = Crowdin::Client.new
      
      stub_request(:post, "https://api.crowdin.com/api/v2/users/#{user_id}/ai/translations/translate-strings")
        .to_return(
          status: 200,
          body: {
            data: {
              translations: ['Hallo Welt']
            }
          }.to_json
        )

      result = @crowdin.ai_translate_strings(user_id, { strings: ['Hello'], targetLanguageId: 'de' })
      expect(result['data']['translations']).to eq(['Hallo Welt'])
    end

    it 'when request are valid in Enterprise mode' do
      @crowdin = Crowdin::Client.new { |cfg| cfg.organization_domain = 'domain' }
      
      stub_request(:post, "https://domain.api.crowdin.com/api/v2/ai/translations/translate-strings")
        .to_return(
          status: 200,
          body: {
            data: {
              translations: ['Hallo Welt']
            }
          }.to_json
        )

      result = @crowdin.ai_translate_strings(user_id, { strings: ['Hello'], targetLanguageId: 'de' })
      expect(result['data']['translations']).to eq(['Hallo Welt'])
    end

    it 'should raise error when user_id is missing' do
      expect { @crowdin.ai_translate_strings(nil, { strings: ['Hello'] }) }
        .to raise_error(ArgumentError)
    end
  end
end
