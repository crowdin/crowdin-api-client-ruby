# frozen_string_literal: true

describe Crowdin::ApiResources::Glossaries do
  describe 'Default endpoints' do
    describe '#list_glossaries' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/glossaries")
        list_glossaries = @crowdin.list_glossaries
        expect(list_glossaries).to eq(200)
      end
    end

    describe '#add_glossary' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/glossaries")
        add_glossary = @crowdin.add_glossary
        expect(add_glossary).to eq(200)
      end
    end

    describe '#get_glossary' do
      let(:glossary_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}")
        get_glossary = @crowdin.get_glossary(glossary_id)
        expect(get_glossary).to eq(200)
      end
    end

    describe '#delete_glossary' do
      let(:glossary_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}")
        delete_glossary = @crowdin.delete_glossary(glossary_id)
        expect(delete_glossary).to eq(200)
      end
    end

    describe '#edit_glossary' do
      let(:glossary_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}")
        edit_glossary = @crowdin.edit_glossary(glossary_id)
        expect(edit_glossary).to eq(200)
      end
    end

    describe '#export_glossary' do
      let(:glossary_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}/exports")
        export_glossary = @crowdin.export_glossary({}, glossary_id)
        expect(export_glossary).to eq(200)
      end
    end

    describe '#check_glossary_export_status' do
      let(:glossary_id) { 1 }
      let(:export_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}/exports/#{export_id}")
        check_glossary_export_status = @crowdin.check_glossary_export_status(glossary_id, export_id)
        expect(check_glossary_export_status).to eq(200)
      end
    end

    describe '#download_glossary' do
      let(:glossary_id) { 1 }
      let(:export_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}/exports/#{export_id}/download")
        download_glossary = @crowdin.download_glossary(glossary_id, export_id)
        expect(download_glossary).to eq(200)
      end
    end

    describe '#import_glossary' do
      let(:glossary_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}/imports")
        import_glossary = @crowdin.import_glossary(glossary_id)
        expect(import_glossary).to eq(200)
      end
    end

    describe '#check_glossary_import_status' do
      let(:glossary_id) { 1 }
      let(:import_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}/imports/#{import_id}")
        check_glossary_import_status = @crowdin.check_glossary_import_status(glossary_id, import_id)
        expect(check_glossary_import_status).to eq(200)
      end
    end

    describe '#list_terms' do
      let(:glossary_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}/terms")
        list_terms = @crowdin.list_terms(glossary_id)
        expect(list_terms).to eq(200)
      end
    end

    describe '#add_term' do
      let(:glossary_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}/terms")
        add_term = @crowdin.add_term(glossary_id)
        expect(add_term).to eq(200)
      end
    end

    describe '#clear_glossary' do
      let(:glossary_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}/terms")
        clear_glossary = @crowdin.clear_glossary(glossary_id)
        expect(clear_glossary).to eq(200)
      end
    end

    describe '#get_term' do
      let(:glossary_id) { 1 }
      let(:term_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}/terms/#{term_id}")
        get_term = @crowdin.get_term(glossary_id, term_id)
        expect(get_term).to eq(200)
      end
    end

    describe '#delete_term' do
      let(:glossary_id) { 1 }
      let(:term_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}/terms/#{term_id}")
        delete_term = @crowdin.delete_term(glossary_id, term_id)
        expect(delete_term).to eq(200)
      end
    end

    describe '#edit_term' do
      let(:glossary_id) { 1 }
      let(:term_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}/terms/#{term_id}")
        edit_term = @crowdin.edit_term(glossary_id, term_id)
        expect(edit_term).to eq(200)
      end
    end

    describe '#list_concepts' do
      let(:glossary_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}/concepts")
        concepts = @crowdin.list_concepts(glossary_id)
        expect(concepts).to eq(200)
      end
    end

    describe '#get_concept' do
      let(:glossary_id) { 1 }
      let(:concept_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}/concepts/#{concept_id}")
        concept = @crowdin.get_concept(glossary_id, concept_id)
        expect(concept).to eq(200)
      end
    end

    describe '#update_concept' do
      let(:glossary_id) { 1 }
      let(:concept_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:put, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}/concepts/#{concept_id}")
        concept = @crowdin.update_concept(glossary_id, concept_id)
        expect(concept).to eq(200)
      end
    end

    describe '#update_concept' do
      let(:glossary_id) { 1 }
      let(:concept_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/glossaries/#{glossary_id}/concepts/#{concept_id}")
        concept = @crowdin.delete_concept(glossary_id, concept_id)
        expect(concept).to eq(200)
      end
    end

    describe '#search_glossaries_concordance' do
      let(:project_id) { 1 }

      it 'returns 200 when request is valid', :default do
        query = { source_language_id: "en", target_language_id: "ar", expression: "Hello world!" }
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/glossaries/concordance")
        search_glossaries_concordance = @crowdin.search_glossaries_concordance(project_id, query)
        expect(search_glossaries_concordance).to eq(200)
      end

      it 'raises ArgumentError when request is missing required query parameter', :default do
        query = { source_language_id: "en", target_language_id: "ar" }
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/glossaries/concordance")
        expect{ @crowdin.search_glossaries_concordance(project_id, query) }.to raise_error(ArgumentError, ":expression is required")
      end
    end
  end
end
