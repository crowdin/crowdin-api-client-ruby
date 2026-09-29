# frozen_string_literal: true

describe Crowdin::ApiResources::Placeholders do
  describe 'Default endpoints' do
    describe '#list_project_system_placeholders' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/system-placeholders")
        result = @crowdin.list_project_system_placeholders({}, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#project_system_placeholder_batch_operations' do
      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/system-placeholders")
        result = @crowdin.project_system_placeholder_batch_operations([], project_id)
        expect(result).to eq(200)
      end
    end
  end

  describe 'Enterprise endpoints' do
    describe '#list_custom_placeholders' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/custom-placeholders")
        result = @crowdin.list_custom_placeholders({})
        expect(result).to eq(200)
      end
    end

    describe '#add_custom_placeholder' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/custom-placeholders")
        result = @crowdin.add_custom_placeholder({})
        expect(result).to eq(200)
      end
    end

    describe '#delete_custom_placeholder' do
      it 'when request are valid', :enterprise do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/custom-placeholders/1")
        result = @crowdin.delete_custom_placeholder(1)
        expect(result).to eq(200)
      end
    end

    describe '#get_custom_placeholder' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/custom-placeholders/1")
        result = @crowdin.get_custom_placeholder(1)
        expect(result).to eq(200)
      end
    end

    describe '#edit_custom_placeholder' do
      it 'when request are valid', :enterprise do
        stub_request(:patch, "https://domain.api.crowdin.com/#{target_api_url}/custom-placeholders/1")
        result = @crowdin.edit_custom_placeholder(1, [])
        expect(result).to eq(200)
      end
    end

    describe '#list_project_placeholders' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/projects/#{project_id}/placeholders")
        result = @crowdin.list_project_placeholders({}, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#add_project_placeholder' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/projects/#{project_id}/placeholders")
        result = @crowdin.add_project_placeholder({}, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#delete_project_placeholder' do
      it 'when request are valid', :enterprise do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/projects/#{project_id}/placeholders/1")
        result = @crowdin.delete_project_placeholder(1, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#get_project_placeholder' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/projects/#{project_id}/placeholders/1")
        result = @crowdin.get_project_placeholder(1, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#edit_project_placeholder' do
      it 'when request are valid', :enterprise do
        stub_request(:patch, "https://domain.api.crowdin.com/#{target_api_url}/projects/#{project_id}/placeholders/1")
        result = @crowdin.edit_project_placeholder(1, [], project_id)
        expect(result).to eq(200)
      end
    end
  end
end
