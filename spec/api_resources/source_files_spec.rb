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

      it 'sends Prefer header when async', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/branches/1")
          .with(headers: { 'Prefer' => 'respond-async' })
        expect(@crowdin.delete_branch(1, project_id, async: true)).to eq(200)
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

      it 'sends Prefer header when async', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/directories/1")
          .with(headers: { 'Prefer' => 'respond-async' })
        expect(@crowdin.delete_directory(1, project_id, async: true)).to eq(200)
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

      it 'sends Prefer header when async', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/files/1")
          .with(headers: { 'Prefer' => 'respond-async' })
        expect(@crowdin.delete_file(1, project_id, async: true)).to eq(200)
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

  describe 'Default endpoints' do
    describe '#search_branches' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/branches")
        result = @crowdin.search_branches({})
        expect(result).to eq(200)
      end
    end

    describe '#search_directories' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/directories")
        result = @crowdin.search_directories({})
        expect(result).to eq(200)
      end
    end

    describe '#search_files' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/files")
        result = @crowdin.search_files({})
        expect(result).to eq(200)
      end
    end

    describe '#clone_branch' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/branches/1/clones")
        result = @crowdin.clone_branch(1, {}, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#check_branch_clone_status' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/branches/1/clones/1")
        result = @crowdin.check_branch_clone_status(1, 1, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#get_cloned_branch' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/branches/1/clones/1/branch")
        result = @crowdin.get_cloned_branch(1, 1, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#check_delete_branch_job_status' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/branches/1/jobs/1")
        result = @crowdin.check_delete_branch_job_status(1, 1, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#merge_branch' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/branches/1/merges")
        result = @crowdin.merge_branch(1, {}, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#check_branch_merge_status' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/branches/1/merges/1")
        result = @crowdin.check_branch_merge_status(1, 1, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#get_branch_merge_summary' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/branches/1/merges/1/summary")
        result = @crowdin.get_branch_merge_summary(1, 1, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#check_delete_directory_job_status' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/directories/1/jobs/1")
        result = @crowdin.check_delete_directory_job_status(1, 1, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#check_delete_file_job_status' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/files/1/jobs/1")
        result = @crowdin.check_delete_file_job_status(1, 1, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#list_asset_references' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/files/1/references")
        result = @crowdin.list_asset_references(1, {}, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#add_asset_reference' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/files/1/references")
        result = @crowdin.add_asset_reference(1, {}, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#delete_asset_reference' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/files/1/references/1")
        result = @crowdin.delete_asset_reference(1, 1, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#get_asset_reference' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/files/1/references/1")
        result = @crowdin.get_asset_reference(1, 1, project_id)
        expect(result).to eq(200)
      end
    end
  end

  describe 'Enterprise endpoints' do
    describe '#list_reviewed_source_files_builds' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/projects/#{project_id}/strings/reviewed-builds")
        result = @crowdin.list_reviewed_source_files_builds({}, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#build_reviewed_source_files' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/projects/#{project_id}/strings/reviewed-builds")
        result = @crowdin.build_reviewed_source_files({}, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#check_reviewed_source_files_build_status' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/projects/#{project_id}/strings/reviewed-builds/1")
        result = @crowdin.check_reviewed_source_files_build_status(1, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#download_reviewed_source_files' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/projects/#{project_id}/strings/reviewed-builds/1/download")
        result = @crowdin.download_reviewed_source_files(1, nil, project_id)
        expect(result).to eq(200)
      end
    end
  end
end
