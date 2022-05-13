# frozen_string_literal: true

describe Crowdin::ApiResources::Screenshots do
  describe 'Default endpoints' do
    describe '#list_screenshots' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/screenshots")
        list_screenshots = @crowdin.list_screenshots({}, project_id)
        expect(list_screenshots).to eq(200)
      end
    end

    describe '#add_screenshot' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/screenshots")
        add_screenshot = @crowdin.add_screenshot({}, project_id)
        expect(add_screenshot).to eq(200)
      end
    end

    describe '#get_screenshot' do
      let(:screenshot_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}")
        get_screenshot = @crowdin.get_screenshot(screenshot_id, project_id)
        expect(get_screenshot).to eq(200)
      end
    end

    describe '#update_screenshot' do
      let(:screenshot_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:put, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}")
        update_screenshot = @crowdin.update_screenshot(screenshot_id, {}, project_id)
        expect(update_screenshot).to eq(200)
      end
    end

    describe '#delete_screenshot' do
      let(:screenshot_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}")
        delete_screenshot = @crowdin.delete_screenshot(screenshot_id, project_id)
        expect(delete_screenshot).to eq(200)
      end
    end

    describe '#edit_screenshot' do
      let(:screenshot_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}")
        edit_screenshot = @crowdin.edit_screenshot(screenshot_id, {}, project_id)
        expect(edit_screenshot).to eq(200)
      end
    end

    describe '#list_tags' do
      let(:screenshot_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}/tags")
        list_tags = @crowdin.list_tags(screenshot_id, {}, project_id)
        expect(list_tags).to eq(200)
      end
    end

    describe '#replace_tags' do
      let(:screenshot_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:put, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}/tags")
        replace_tags = @crowdin.replace_tags(screenshot_id, {}, project_id)
        expect(replace_tags).to eq(200)
      end
    end

    describe '#add_tag' do
      let(:screenshot_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}/tags")
        add_tag = @crowdin.add_tag(screenshot_id, {}, project_id)
        expect(add_tag).to eq(200)
      end
    end

    describe '#clear_tags' do
      let(:screenshot_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}/tags")
        clear_tags = @crowdin.clear_tags(screenshot_id, project_id)
        expect(clear_tags).to eq(200)
      end
    end

    describe '#get_tag' do
      let(:screenshot_id) { 1 }
      let(:tag_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}/tags/#{tag_id}")
        get_tag = @crowdin.get_tag(screenshot_id, tag_id, project_id)
        expect(get_tag).to eq(200)
      end
    end

    describe '#delete_tag' do
      let(:screenshot_id) { 1 }
      let(:tag_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}/tags/#{tag_id}")
        delete_tag = @crowdin.delete_tag(screenshot_id, tag_id, project_id)
        expect(delete_tag).to eq(200)
      end
    end

    describe '#edit_tag' do
      let(:screenshot_id) { 1 }
      let(:tag_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}/tags/#{tag_id}")
        edit_tag = @crowdin.edit_tag(screenshot_id, tag_id, {}, project_id)
        expect(edit_tag).to eq(200)
      end
    end
  end
end
