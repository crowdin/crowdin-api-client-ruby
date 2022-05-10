# frozen_string_literal: true

describe Crowdin::ApiResources::MachineTranslationEngines do
  describe 'Default endpoints' do
    describe '#list_mts' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/mts")
        list_mts = @crowdin.list_mts
        expect(list_mts).to eq(200)
      end
    end

    describe '#get_mt' do
      let(:mt_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/mts/#{mt_id}")
        get_mt = @crowdin.get_mt(mt_id)
        expect(get_mt).to eq(200)
      end
    end

    describe '#translate_via_mt' do
      let(:mt_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/mts/#{mt_id}/translations")
        translate_via_mt = @crowdin.translate_via_mt(mt_id)
        expect(translate_via_mt).to eq(200)
      end
    end
  end

  describe 'Enterprise endpoints' do
    describe '#edit_mt' do
      let(:mt_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:patch, "https://domain.api.crowdin.com/#{target_api_url}/mts/#{mt_id}")
        edit_mt = @crowdin.edit_mt(mt_id)
        expect(edit_mt).to eq(200)
      end
    end

    describe '#add_mt' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/mts")
        add_mt = @crowdin.add_mt
        expect(add_mt).to eq(200)
      end
    end

    describe '#delete_mt' do
      let(:mt_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/mts/#{mt_id}")
        delete_mt = @crowdin.delete_mt(mt_id)
        expect(delete_mt).to eq(200)
      end
    end
  end
end
