# frozen_string_literal: true

describe Crowdin::ApiResources::TranslationMemory do
  describe 'Default endpoints' do
    describe '#list_tms' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/tms")
        list_tms = @crowdin.list_tms
        expect(list_tms).to eq(200)
      end
    end

    describe '#add_tm' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/tms")
        add_tm = @crowdin.add_tm
        expect(add_tm).to eq(200)
      end
    end

    describe '#get_tm' do
      let(:tm_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/tms/#{tm_id}")
        get_tm = @crowdin.get_tm(tm_id)
        expect(get_tm).to eq(200)
      end
    end

    describe '#delete_tm' do
      let(:tm_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/tms/#{tm_id}")
        delete_tm = @crowdin.delete_tm(tm_id)
        expect(delete_tm).to eq(200)
      end
    end

    describe '#edit_tm' do
      let(:tm_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/tms/#{tm_id}")
        edit_tm = @crowdin.edit_tm(tm_id)
        expect(edit_tm).to eq(200)
      end
    end

    describe '#clear_tm' do
      let(:tm_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/tms/#{tm_id}/segments")
        clear_tm = @crowdin.clear_tm(tm_id)
        expect(clear_tm).to eq(200)
      end
    end

    describe '#export_tm' do
      let(:tm_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/tms/#{tm_id}/exports")
        export_tm = @crowdin.export_tm(tm_id)
        expect(export_tm).to eq(200)
      end
    end

    describe '#check_tm_export_status' do
      let(:tm_id) { 1 }
      let(:export_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/tms/#{tm_id}/exports/#{export_id}")
        check_tm_export_status = @crowdin.check_tm_export_status(tm_id, export_id)
        expect(check_tm_export_status).to eq(200)
      end
    end

    describe '#download_tm' do
      let(:tm_id) { 1 }
      let(:export_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/tms/#{tm_id}/exports/#{export_id}/download")
        download_tm = @crowdin.download_tm(tm_id, export_id)
        expect(download_tm).to eq(200)
      end
    end

    describe '#import_tm' do
      let(:tm_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/tms/#{tm_id}/imports")
        import_tm = @crowdin.import_tm(tm_id)
        expect(import_tm).to eq(200)
      end
    end

    describe '#check_tm_import_status' do
      let(:tm_id) { 1 }
      let(:import_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/tms/#{tm_id}/imports/#{import_id}")
        check_tm_import_status = @crowdin.check_tm_import_status(tm_id, import_id)
        expect(check_tm_import_status).to eq(200)
      end
    end
  end
end
