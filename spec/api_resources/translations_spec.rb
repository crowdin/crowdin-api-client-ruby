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

    describe '#list_pre_translations' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/pre-translations")
        list_pre_translations = @crowdin.list_pre_translations({}, project_id)
        expect(list_pre_translations).to eq(200)
      end
    end

    describe '#edit_pre_translations' do
      let(:pre_translation_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/pre-translations/#{pre_translation_id}")
        edit_pre_translations = @crowdin.edit_pre_translations(pre_translation_id, {}, project_id)
        expect(edit_pre_translations).to eq(200)
      end
    end

    describe '#pre_translation_report' do
      let(:pre_translation_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/pre-translations/#{pre_translation_id}/report")
        pre_translation_report = @crowdin.pre_translation_report(pre_translation_id, project_id)
        expect(pre_translation_report).to eq(200)
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
      subject(:build_project_file_translation) do
        @crowdin.build_project_file_translation(file_id, query, destination, project_id)
      end

      let(:file_id) { 1 }
      let(:query) { { targetLanguageId: target_language_id } }
      let(:destination) { nil }

      let(:target_language_id) { 'expected_language_id' }

      it 'builds project file translation', :default do
        expected_response = 'expected_response'

        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/builds/files/#{file_id}")
          .with(
            body: JSON.dump(query)
          )
          .to_return(
            body: JSON.dump(expected_response)
          )

        is_expected.to eq(expected_response)
      end

      context 'when the `eTag` query param is passed' do
        let(:query) { { targetLanguageId: 'expected_language_id', eTag: etag } }

        let(:etag) { 'expected_etag' }

        it 'builds project file translation for new changes after the passed `eTag`', :default do
          expected_response = 'expected_response'

          stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/builds/files/#{file_id}")
            .with(
              body: JSON.dump({ targetLanguageId: target_language_id }),
              headers: { 'If-None-Match' => etag }
            )
            .to_return(
              body: JSON.dump(expected_response)
            )

          is_expected.to eq(expected_response)
        end
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
  end
end
