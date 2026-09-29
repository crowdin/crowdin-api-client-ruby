# frozen_string_literal: true

describe Crowdin::ApiResources::Advisor do
  describe 'Default endpoints' do
    describe '#create_advisor_check' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/advisors/checks")
        result = @crowdin.create_advisor_check({}, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#get_advisor_check_status' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/advisors/checks/1")
        result = @crowdin.get_advisor_check_status(1, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#list_advisor_insights' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/advisors/insights")
        result = @crowdin.list_advisor_insights({}, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#edit_advisor_insight' do
      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/advisors/insights/1")
        result = @crowdin.edit_advisor_insight(1, [], project_id)
        expect(result).to eq(200)
      end
    end

    describe '#create_or_update_application_advisor_insight' do
      it 'when request are valid', :default do
        stub_request(:put, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/applications/1/modules/1/advisors/insights")
        result = @crowdin.create_or_update_application_advisor_insight(1, 1, {}, project_id)
        expect(result).to eq(200)
      end
    end
  end
end
