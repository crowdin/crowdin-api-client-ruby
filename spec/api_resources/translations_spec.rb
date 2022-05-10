# frozen_string_literal: true

describe Crowdin::ApiResources::Translations do
  describe 'Default endpoints' do
    describe '#pre_translation_status' do
      let(:pre_translation_id) { 1 }
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/pre-translations/#{pre_translation_id}")
        pre_translation_status = @crowdin.pre_translation_status(pre_translation_id, project_id)
        expect(pre_translation_status).to eq(200)
      end
    end
  end
end
