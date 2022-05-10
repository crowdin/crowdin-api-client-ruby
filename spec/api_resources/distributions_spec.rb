# frozen_string_literal: true

describe Crowdin::ApiResources::Distributions do
  describe 'Default endpoints' do
    describe '#list_distributions' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/distributions")
        list_distributions = @crowdin.list_distributions({}, project_id)
        expect(list_distributions).to eq(200)
      end
    end

    describe '#add_distribution' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/distributions")
        add_distribution = @crowdin.add_distribution({}, project_id)
        expect(add_distribution).to eq(200)
      end
    end

    describe '#get_distribution' do
      let(:hash) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/distributions/#{hash}")
        get_distribution = @crowdin.get_distribution(hash, project_id)
        expect(get_distribution).to eq(200)
      end
    end

    describe '#delete_distribution' do
      let(:hash) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/distributions/#{hash}")
        delete_distribution = @crowdin.delete_distribution(hash, project_id)
        expect(delete_distribution).to eq(200)
      end
    end

    describe '#edit_distribution' do
      let(:hash) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/distributions/#{hash}")
        edit_distribution = @crowdin.edit_distribution(hash, {}, project_id)
        expect(edit_distribution).to eq(200)
      end
    end

    describe '#get_distribution_release' do
      let(:hash) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/distributions/#{hash}/release")
        get_distribution_release = @crowdin.get_distribution_release(hash, project_id)
        expect(get_distribution_release).to eq(200)
      end
    end

    describe '#release_distribution' do
      let(:hash) { 1 }

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/distributions/#{hash}/release")
        release_distribution = @crowdin.release_distribution(hash, project_id)
        expect(release_distribution).to eq(200)
      end
    end
  end
end
