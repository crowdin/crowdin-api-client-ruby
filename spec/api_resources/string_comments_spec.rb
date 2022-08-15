# frozen_string_literal: true

describe Crowdin::ApiResources::StringComments do
  describe 'Default endpoints' do
    describe '#list_string_comments' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/comments")
        list_string_comments = @crowdin.list_string_comments({}, project_id)
        expect(list_string_comments).to eq(200)
      end
    end

    describe '#add_string_comment' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/comments")
        add_string_comment = @crowdin.add_string_comment({}, project_id)
        expect(add_string_comment).to eq(200)
      end
    end

    describe '#get_string_comment' do
      let(:string_comment_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/comments/#{string_comment_id}")
        get_string_comment = @crowdin.get_string_comment(string_comment_id, project_id)
        expect(get_string_comment).to eq(200)
      end
    end

    describe '#delete_string_comment' do
      let(:string_comment_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/comments/#{string_comment_id}")
        delete_string_comment = @crowdin.delete_string_comment(string_comment_id, project_id)
        expect(delete_string_comment).to eq(200)
      end
    end

    describe '#edit_string_comment' do
      let(:string_comment_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/comments/#{string_comment_id}")
        edit_string_comment = @crowdin.edit_string_comment(string_comment_id, {}, project_id)
        expect(edit_string_comment).to eq(200)
      end
    end
  end
end
