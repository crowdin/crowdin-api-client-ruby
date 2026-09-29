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

    describe '#get_directory_progress' do
      let(:directory_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/directories/#{directory_id}/languages/progress")
        get_directory_progress = @crowdin.get_directory_progress(directory_id, {}, project_id)
        expect(get_directory_progress).to eq(200)
      end
    end

    describe '#get_file_progress' do
      let(:file_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/files/#{file_id}/languages/progress")
        get_file_progress = @crowdin.get_file_progress(file_id, {}, project_id)
        expect(get_file_progress).to eq(200)
      end
    end

    describe '#get_language_progress' do
      let(:language_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/languages/#{language_id}/progress")
        get_language_progress = @crowdin.get_language_progress(language_id, {}, project_id)
        expect(get_language_progress).to eq(200)
      end
    end

    describe '#get_project_progress' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/languages/progress")
        get_project_progress = @crowdin.get_project_progress({}, project_id)
        expect(get_project_progress).to eq(200)
      end
    end

    describe '#get_qa_progress' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/qa-checks")
        get_qa_progress = @crowdin.get_qa_progress({}, project_id)
        expect(get_qa_progress).to eq(200)
      end
    end
  end

  describe 'Default endpoints' do
    describe '#revalidate_qa_checks' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/qa-checks/revalidate")
        result = @crowdin.revalidate_qa_checks({}, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#cancel_qa_checks_revalidation' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/qa-checks/revalidate/1")
        result = @crowdin.cancel_qa_checks_revalidation(1, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#qa_checks_revalidation_status' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/qa-checks/revalidate/1")
        result = @crowdin.qa_checks_revalidation_status(1, project_id)
        expect(result).to eq(200)
      end
    end
  end
end
