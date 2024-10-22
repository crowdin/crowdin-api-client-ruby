# frozen_string_literal: true

describe Crowdin::ApiResources::SourceFiles do
  describe 'Default endpoints' do
    describe '#list_branches' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/branches")
        list_branches = @crowdin.list_branches({}, project_id)
        expect(list_branches).to eq(200)
      end
    end

    describe '#add_branch' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/branches")
        add_branch = @crowdin.add_branch({}, project_id)
        expect(add_branch).to eq(200)
      end
    end

    describe '#get_branch' do
      let(:branch_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/branches/#{branch_id}")
        get_branch = @crowdin.get_branch(branch_id, project_id)
        expect(get_branch).to eq(200)
      end
    end

    describe '#delete_branch' do
      let(:branch_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/branches/#{branch_id}")
        delete_branch = @crowdin.delete_branch(branch_id, project_id)
        expect(delete_branch).to eq(200)
      end
    end

    describe '#edit_branch' do
      let(:branch_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/branches/#{branch_id}")
        edit_branch = @crowdin.edit_branch(branch_id, {}, project_id)
        expect(edit_branch).to eq(200)
      end
    end

    describe '#list_directories' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/directories")
        list_directories = @crowdin.list_directories({}, project_id)
        expect(list_directories).to eq(200)
      end
    end

    describe '#add_directory' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/directories")
        add_directory = @crowdin.add_directory({}, project_id)
        expect(add_directory).to eq(200)
      end
    end

    describe '#get_directory' do
      let(:directory_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/directories/#{directory_id}")
        get_directory = @crowdin.get_directory(directory_id, project_id)
        expect(get_directory).to eq(200)
      end
    end

    describe '#delete_directory' do
      let(:directory_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/directories/#{directory_id}")
        delete_directory = @crowdin.delete_directory(directory_id, project_id)
        expect(delete_directory).to eq(200)
      end
    end

    describe '#edit_directory' do
      let(:directory_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/directories/#{directory_id}")
        edit_directory = @crowdin.edit_directory(directory_id, {}, project_id)
        expect(edit_directory).to eq(200)
      end
    end

    describe '#list_files' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/files")
        list_files = @crowdin.list_files({}, project_id)
        expect(list_files).to eq(200)
      end
    end

    describe '#add_file' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/files")
        add_file = @crowdin.add_file({}, project_id)
        expect(add_file).to eq(200)
      end
    end

    describe '#get_file' do
      let(:file_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/files/#{file_id}")
        get_file = @crowdin.get_file(file_id, project_id)
        expect(get_file).to eq(200)
      end
    end

    describe '#update_or_restore_file' do
      let(:file_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:put, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/files/#{file_id}")
        update_or_restore_file = @crowdin.update_or_restore_file(file_id, {}, project_id)
        expect(update_or_restore_file).to eq(200)
      end
    end

    describe '#delete_file' do
      let(:file_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/files/#{file_id}")
        delete_file = @crowdin.delete_file(file_id, project_id)
        expect(delete_file).to eq(200)
      end
    end

    describe '#edit_file' do
      let(:file_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/files/#{file_id}")
        edit_file = @crowdin.edit_file(file_id, {}, project_id)
        expect(edit_file).to eq(200)
      end
    end

    describe '#download_file' do
      let(:file_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/files/#{file_id}/download")
        download_file = @crowdin.download_file(file_id, nil, project_id)
        expect(download_file).to eq(200)
      end
    end

    describe '#download_file_preview' do
      let(:file_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/files/#{file_id}/preview")
        download_file_preview = @crowdin.download_file_preview(file_id, nil, project_id)
        expect(download_file_preview).to eq(200)
      end
    end

    describe '#list_file_revisions' do
      let(:file_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/files/#{file_id}/revisions")
        list_file_revisions = @crowdin.list_file_revisions(file_id, {}, project_id)
        expect(list_file_revisions).to eq(200)
      end
    end

    describe '#get_file_revision' do
      let(:file_id) { 1 }
      let(:revision_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/files/#{file_id}/revisions/#{revision_id}")
        get_file_revision = @crowdin.get_file_revision(file_id, revision_id, project_id)
        expect(get_file_revision).to eq(200)
      end
    end
  end
end
