# frozen_string_literal: true

describe Crowdin::ApiResources::StyleGuides do
  describe 'Default endpoints' do
    describe '#list_style_guides' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/style-guides")
        result = @crowdin.list_style_guides({})
        expect(result).to eq(200)
      end
    end

    describe '#create_style_guide' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/style-guides")
        result = @crowdin.create_style_guide({})
        expect(result).to eq(200)
      end
    end

    describe '#delete_style_guide' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/style-guides/1")
        result = @crowdin.delete_style_guide(1)
        expect(result).to eq(200)
      end
    end

    describe '#get_style_guide' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/style-guides/1")
        result = @crowdin.get_style_guide(1)
        expect(result).to eq(200)
      end
    end

    describe '#edit_style_guide' do
      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/style-guides/1")
        result = @crowdin.edit_style_guide(1, [])
        expect(result).to eq(200)
      end
    end
  end
end
