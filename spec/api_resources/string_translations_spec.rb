# frozen_string_literal: true

describe Crowdin::ApiResources::StringTranslations do
  describe 'Default endpoints' do
    describe '#list_translation_approvals' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/approvals")
        list_translation_approvals = @crowdin.list_translation_approvals({}, project_id)
        expect(list_translation_approvals).to eq(200)
      end
    end
  end
end
