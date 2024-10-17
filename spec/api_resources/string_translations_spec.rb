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

    describe '#add_approval' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/approvals")
        add_approval = @crowdin.add_approval({}, project_id)
        expect(add_approval).to eq(200)
      end
    end

    describe '#get_approval' do
      let(:approval_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/approvals/#{approval_id}")
        get_approval = @crowdin.get_approval(approval_id, project_id)
        expect(get_approval).to eq(200)
      end
    end

    describe '#remove_approval' do
      let(:approval_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/approvals/#{approval_id}")
        remove_approval = @crowdin.remove_approval(approval_id, project_id)
        expect(remove_approval).to eq(200)
      end
    end

    describe '#remove_string_approvals' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/approvals")
        remove_string_approvals = @crowdin.remove_string_approvals({}, project_id)
        expect(remove_string_approvals).to eq(200)
      end
    end

    describe '#list_language_translations' do
      let(:language_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/languages/#{language_id}/translations")
        list_language_translations = @crowdin.list_language_translations(language_id, {}, project_id)
        expect(list_language_translations).to eq(200)
      end
    end

    describe '#list_string_translations' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations")
        list_string_translations = @crowdin.list_string_translations({}, project_id)
        expect(list_string_translations).to eq(200)
      end
    end

    describe '#add_translation' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations")
        add_translation = @crowdin.add_translation({}, project_id)
        expect(add_translation).to eq(200)
      end
    end

    describe '#delete_string_translations' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations")
        delete_string_translations = @crowdin.delete_string_translations({}, project_id)
        expect(delete_string_translations).to eq(200)
      end
    end

    describe '#get_translation' do
      let(:translation_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/#{translation_id}")
        get_translation = @crowdin.get_translation(translation_id, {}, project_id)
        expect(get_translation).to eq(200)
      end
    end

    describe '#restore_translation' do
      let(:translation_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:put, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/#{translation_id}")
        restore_translation = @crowdin.restore_translation(translation_id, project_id)
        expect(restore_translation).to eq(200)
      end
    end

    describe '#delete_translation' do
      let(:translation_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/#{translation_id}")
        delete_translation = @crowdin.delete_translation(translation_id, project_id)
        expect(delete_translation).to eq(200)
      end
    end

    describe '#list_translation_votes' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/votes")
        list_translation_votes = @crowdin.list_translation_votes({}, project_id)
        expect(list_translation_votes).to eq(200)
      end
    end

    describe '#add_vote' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/votes")
        add_vote = @crowdin.add_vote({}, project_id)
        expect(add_vote).to eq(200)
      end
    end

    describe '#get_vote' do
      let(:vote_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/votes/#{vote_id}")
        get_vote = @crowdin.get_vote(vote_id, project_id)
        expect(get_vote).to eq(200)
      end
    end

    describe '#cancel_vote' do
      let(:vote_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/votes/#{vote_id}")
        cancel_vote = @crowdin.cancel_vote(vote_id, project_id)
        expect(cancel_vote).to eq(200)
      end
    end

    describe '#add_translation_alignment' do
      let(:project_id) { 1 }

      it 'returns 200 when request is valid', :default do
        query = { source_language_id: 'en', target_language_id: 'ar', text: 'Hello world!' }
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/alignment")
        add_translation_alignment = @crowdin.add_translation_alignment(project_id, query)
        expect(add_translation_alignment).to eq(200)
      end

      it 'raises ArgumentError when request is missing required query parameter', :default do
        query = { source_language_id: 'en', target_language_id: 'ar' }
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/translations/alignment")
        expect do
          @crowdin.add_translation_alignment(project_id, query)
        end.to raise_error(ArgumentError, ':text is required')
      end
    end
  end
end
