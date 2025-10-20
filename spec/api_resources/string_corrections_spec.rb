# frozen_string_literal: true

describe Crowdin::ApiResources::StringCorrections do
  describe 'Default endpoints' do
    let(:correction_id) { 35 }
    let(:string_id) { 2 }

    describe '#list_corrections' do
      it 'when request is valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/corrections")
          .with(query: { stringId: string_id })
        list_corrections = @crowdin.list_corrections({ stringId: string_id }, project_id)
        expect(list_corrections).to eq(200)
      end

      it 'when request is valid', :default do
        query = { stringId: string_id, limit: 50, offset: 10, orderBy: 'createdAt desc', denormalizePlaceholders: 1 }
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/corrections")
          .with(query: query)
        list_corrections = @crowdin.list_corrections(query, project_id)
        expect(list_corrections).to eq(200)
      end
    end

    describe '#add_correction' do
      it 'when request is valid', :default do
        body = { stringId: 35_434, text: 'This string has been corrected', pluralCategoryName: 'few' }
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/corrections")
          .with(body: body)
        add_correction = @crowdin.add_correction(body, project_id)
        expect(add_correction).to eq(200)
      end

      it 'when request is valid', :default do
        body = { stringId: 35_434, text: 'This string has been corrected' }
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/corrections")
          .with(body: body)
        add_correction = @crowdin.add_correction(body, project_id)
        expect(add_correction).to eq(200)
      end
    end

    describe '#get_correction' do
      it 'when request is valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/corrections/#{correction_id}")
        get_correction = @crowdin.get_correction(correction_id, {}, project_id)
        expect(get_correction).to eq(200)
      end

      it 'when request is valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/corrections/#{correction_id}")
          .with(query: { denormalizePlaceholders: 1 })
        get_correction = @crowdin.get_correction(correction_id, { denormalizePlaceholders: 1 }, project_id)
        expect(get_correction).to eq(200)
      end
    end

    describe '#delete_corrections' do
      it 'when request is valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/corrections")
          .with(query: { stringId: string_id })
        delete_corrections = @crowdin.delete_corrections({ stringId: string_id }, project_id)
        expect(delete_corrections).to eq(200)
      end
    end

    describe '#delete_correction' do
      it 'when request is valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/corrections/#{correction_id}")
        delete_correction = @crowdin.delete_correction(correction_id, project_id)
        expect(delete_correction).to eq(200)
      end
    end

    describe '#restore_correction' do
      it 'when request is valid', :default do
        stub_request(:put, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/corrections/#{correction_id}")
        restore_correction = @crowdin.restore_correction(correction_id, project_id)
        expect(restore_correction).to eq(200)
      end
    end
  end
end
