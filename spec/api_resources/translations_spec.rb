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

    describe '#apply_pre_translation' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/pre-translations")
        apply_pre_translation = @crowdin.apply_pre_translation({}, project_id)
        expect(apply_pre_translation).to eq(200)
      end
    end

    describe '#build_project_directory_translation' do
      let(:directory_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/builds/directories/#{directory_id}")
        build_project_directory_translation = @crowdin.build_project_directory_translation(directory_id, {}, project_id)
        expect(build_project_directory_translation).to eq(200)
      end
    end

    describe '#build_project_file_translation' do
      let(:file_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/builds/files/#{file_id}")
        build_project_file_translation = @crowdin.build_project_file_translation(file_id, {}, nil, project_id)
        expect(build_project_file_translation).to eq(200)
      end
    end

    describe '#list_project_builds' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/builds")
        list_project_builds = @crowdin.list_project_builds({}, project_id)
        expect(list_project_builds).to eq(200)
      end
    end

    describe '#build_project_translation' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/builds")
        build_project_translation = @crowdin.build_project_translation({}, project_id)
        expect(build_project_translation).to eq(200)
      end
    end

    describe '#upload_translations' do
      let(:language_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/#{language_id}")
        upload_translations = @crowdin.upload_translations(language_id, {}, project_id)
        expect(upload_translations).to eq(200)
      end
    end

    describe '#download_project_translations' do
      let(:build_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/builds/#{build_id}/download")
        download_project_translations = @crowdin.download_project_translations(build_id, nil, project_id)
        expect(download_project_translations).to eq(200)
      end
    end

    describe '#check_project_build_status' do
      let(:build_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/builds/#{build_id}")
        check_project_build_status = @crowdin.check_project_build_status(build_id, project_id)
        expect(check_project_build_status).to eq(200)
      end
    end

    describe '#cancel_build' do
      let(:build_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/builds/#{build_id}")
        cancel_build = @crowdin.cancel_build(build_id, project_id)
        expect(cancel_build).to eq(200)
      end
    end

    describe '#export_project_translation' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/exports")
        export_project_translation = @crowdin.export_project_translation({}, nil, project_id)
        expect(export_project_translation).to eq(200)
      end
    end

    describe '#add_translation_alignment' do
      let(:project_id) { 1 }

      it 'returns 200 when request is valid', :default do
        query = { source_language_id: "en", target_language_id: "ar", text: "Hello world!" }
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/alignment")
        add_translation_alignment = @crowdin.add_translation_alignment(project_id, query)
        expect(add_translation_alignment).to eq(200)
      end

      it 'raises ArgumentError when request is missing required query parameter', :default do
        query = { source_language_id: "en", target_language_id: "ar" }
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/alignment")
        expect{ @crowdin.add_translation_alignment(project_id, query) }.to raise_error(ArgumentError, ":text is required")
      end
    end
  end
end
