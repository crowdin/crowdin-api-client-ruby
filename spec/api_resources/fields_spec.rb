# frozen_string_literal: true

describe Crowdin::ApiResources::Fields do
  describe 'Enterprise endpoints' do
    describe '#list_fields' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/fields")
        result = @crowdin.list_fields({})
        expect(result).to eq(200)
      end
    end

    describe '#add_field' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/fields")
        result = @crowdin.add_field({})
        expect(result).to eq(200)
      end
    end

    describe '#delete_field' do
      it 'when request are valid', :enterprise do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/fields/1")
        result = @crowdin.delete_field(1)
        expect(result).to eq(200)
      end
    end

    describe '#get_field' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/fields/1")
        result = @crowdin.get_field(1)
        expect(result).to eq(200)
      end
    end

    describe '#edit_field' do
      it 'when request are valid', :enterprise do
        stub_request(:patch, "https://domain.api.crowdin.com/#{target_api_url}/fields/1")
        result = @crowdin.edit_field(1, [])
        expect(result).to eq(200)
      end
    end
  end
end
