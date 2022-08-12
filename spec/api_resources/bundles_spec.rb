# frozen_string_literal: true

describe Crowdin::ApiResources::Bundles do
  describe 'Default endpoints' do
    describe '#list_bundles' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/bundles")
        list_bundles = @crowdin.list_bundles({}, project_id)
        expect(list_bundles).to eq(200)
      end
    end

    describe '#add_bundle' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/bundles")
        add_bundle = @crowdin.add_bundle({}, project_id)
        expect(add_bundle).to eq(200)
      end
    end

    describe '#get_bundle' do
      let(:bundle_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/bundles/#{bundle_id}")
        get_bundle = @crowdin.get_bundle(bundle_id, project_id)
        expect(get_bundle).to eq(200)
      end
    end

    describe '#delete_bundle' do
      let(:bundle_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/bundles/#{bundle_id}")
        delete_bundle = @crowdin.delete_bundle(bundle_id, project_id)
        expect(delete_bundle).to eq(200)
      end
    end

    describe '#edit_bundle' do
      let(:bundle_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/bundles/#{bundle_id}")
        edit_bundle = @crowdin.edit_bundle(bundle_id, {}, project_id)
        expect(edit_bundle).to eq(200)
      end
    end

    describe '#bundle_list_files' do
      let(:bundle_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/bundles/#{bundle_id}/files")
        bundle_list_files = @crowdin.bundle_list_files(bundle_id, {}, project_id)
        expect(bundle_list_files).to eq(200)
      end
    end
  end
end
