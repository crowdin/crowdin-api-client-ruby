# frozen_string_literal: true

describe Crowdin::ApiResources::TranslationStatus do
  describe 'Default endpoints' do
    describe '#get_branch_progress' do
      let(:branch_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/branches/#{branch_id}/languages/progress")
        get_branch_progress = @crowdin.get_branch_progress(branch_id, {}, project_id)
        expect(get_branch_progress).to eq(200)
      end
    end
  end
end
