# frozen_string_literal: true

describe Crowdin::ApiResources::Labels do
  describe 'Default endpoints' do
    describe '#list_labels' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/labels")
        list_labels = @crowdin.list_labels({}, project_id)
        expect(list_labels).to eq(200)
      end
    end

    describe '#add_label' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/labels")
        add_label = @crowdin.add_label({}, project_id)
        expect(add_label).to eq(200)
      end
    end

    describe '#get_label' do
      let(:label_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/labels/#{label_id}")
        get_label = @crowdin.get_label(label_id, project_id)
        expect(get_label).to eq(200)
      end
    end

    describe '#delete_label' do
      let(:label_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/labels/#{label_id}")
        delete_label = @crowdin.delete_label(label_id, project_id)
        expect(delete_label).to eq(200)
      end
    end

    describe '#edit_label' do
      let(:label_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/labels/#{label_id}")
        edit_label = @crowdin.edit_label(label_id, {}, project_id)
        expect(edit_label).to eq(200)
      end
    end

    describe '#assign_label_to_strings' do
      let(:label_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/labels/#{label_id}/strings")
        assign_label_to_strings = @crowdin.assign_label_to_strings(label_id, {}, project_id)
        expect(assign_label_to_strings).to eq(200)
      end
    end

    describe '#unassign_label_from_strings' do
      let(:label_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/labels/#{label_id}")
        unassign_label_from_strings = @crowdin.unassign_label_from_strings(label_id, {}, project_id)
        expect(unassign_label_from_strings).to eq(200)
      end
    end
  end
end
