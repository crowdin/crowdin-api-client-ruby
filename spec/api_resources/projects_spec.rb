# frozen_string_literal: true

describe Crowdin::ApiResources::Projects do

  describe 'Default endpoints' do

    describe '#list_projects' do
      let(:limit) { 1 }
      let(:offset) { 1 }

      it 'returns 200 when request is valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects")
        list_projects = @crowdin.list_projects
        expect(list_projects).to eq(200)
      end

      it 'returns 200 when request is valid and contains query parameters', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects")
          .with(query: { limit: limit, offset: offset })
        list_projects = @crowdin.list_projects({ limit: limit, offset: offset })
        expect(list_projects).to eq(200)
      end
    end

    describe '#add_project' do
      let(:project_name) { 'test_project' }
      let(:source_language_id) { 'en' }

      it 'returns 200 when request is valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects")
          .with(body: { name: project_name, sourceLanguageId: source_language_id })
        add_project = @crowdin.add_project(name: project_name, sourceLanguageId: source_language_id)
        expect(add_project).to eq(200)
      end

      let(:body) do
        { "data" => { "id" => 1, "name" => "test_project" } }
      end

      it 'returns 200 and expected body when request is valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects")
          .with(body: { name: project_name, sourceLanguageId: source_language_id })
          .to_return(body: body.to_json)
        add_project = @crowdin.add_project(name: project_name, sourceLanguageId: source_language_id)
        expect(add_project).to eq(body)
      end
    end

    describe '#get_project' do
      before do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}")
      end

      let(:project_id) { 1 }

      it 'returns 200 when request is valid', :default do
        get_project = @crowdin.get_project(project_id)
        expect(get_project).to eq(200)
      end

      it 'raises ArgumentError when request is missing required query parameter', :default do
        expect { @crowdin.get_project }.to raise_error(ArgumentError)
      end
    end

    describe '#delete_project' do
      before do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}")
      end

      let(:project_id) { 1 }

      it 'returns 200 when request is valid', :default do
        delete_project = @crowdin.delete_project(project_id)
        expect(delete_project).to eq(200)
      end

      it 'raises ArgumentError when request is missing required query parameter', :default do
        expect { @crowdin.delete_project }.to raise_error(ArgumentError)
      end
    end

    describe '#edit_project' do
      let(:project_id) { 1 }
      let(:body) { [{ op: 'replace', path: '/name', value: 'project_name' }] }

      it 'returns 200 when request is valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}")
          .with(body: body.to_json)
        edit_project = @crowdin.edit_project(project_id, body)
        expect(edit_project).to eq(200)
      end

      it 'raises ArgumentError when request is missing required query parameter', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}")
        expect { @crowdin.edit_project }.to raise_error(ArgumentError)
      end
    end

  end

  describe 'Enterprise endpoints' do

    describe '#list_groups' do
      let(:limit) { 1 }
      let(:offset) { 1 }

      it 'raises OnlyForEnterpriseModeError when Enterprise mode is not enabled for Client', :default do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/groups")
        expect { @crowdin.list_groups }.to raise_error(Crowdin::Errors::OnlyForEnterpriseModeError)
      end

      it 'returns 200 when request is valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/groups")
        list_groups = @crowdin.list_groups
        expect(list_groups).to eq(200)
      end

      it 'returns 200 and expected body when request is valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/groups")
          .with(query: { limit: limit, offset: offset })
        list_groups = @crowdin.list_groups({ limit: limit, offset: offset })
        expect(list_groups).to eq(200)
      end
    end

    describe '#add_group' do
      let(:group_name) { 'test_group' }

      it 'raises OnlyForEnterpriseModeError when Enterprise mode is not enabled for Client', :default do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/groups")
        expect { @crowdin.add_group(name: group_name) }.to raise_error(Crowdin::Errors::OnlyForEnterpriseModeError)
      end

      it 'returns 200 when request is valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/groups")
          .with(body: { name: group_name })
        add_group = @crowdin.add_group(name: group_name)
        expect(add_group).to eq(200)
      end

      let(:body) do
        { "data"=> { "id"=>1, "name"=>"test_group" } }
      end

      it 'returns 200 and expected body when request is valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/groups")
          .with(body: { name: group_name })
          .to_return(body: body.to_json)
        add_group = @crowdin.add_group(name: group_name)
        expect(add_group).to eq(body)
      end
    end

    describe '#get_group' do
      before do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/groups/#{group_id}")
      end

      let(:group_id) { 1 }

      it 'raises OnlyForEnterpriseModeError when Enterprise mode is not enabled for Client', :default do
        expect { @crowdin.get_group(group_id) }.to raise_error(Crowdin::Errors::OnlyForEnterpriseModeError)
      end

      it 'returns 200 when request is valid', :enterprise do
        get_group = @crowdin.get_group(group_id)
        expect(get_group).to eq(200)
      end

      it 'raises ArgumentError when request is missing required query parameter', :enterprise do
        expect { @crowdin.get_group }.to raise_error(ArgumentError)
      end
    end

    describe '#delete_group' do
      before do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/groups/#{group_id}")
      end

      let(:group_id) { 1 }

      it 'raises OnlyForEnterpriseModeError when Enterprise mode is not enabled for Client', :default do
        expect { @crowdin.delete_group(group_id) }.to raise_error(Crowdin::Errors::OnlyForEnterpriseModeError)
      end

      it 'returns 200 when request is valid', :enterprise do
        delete_group = @crowdin.delete_group(group_id)
        expect(delete_group).to eq(200)
      end

      it 'raises ArgumentError when request is missing required query parameter', :enterprise do
        expect { @crowdin.delete_group }.to raise_error(ArgumentError)
      end
    end

    describe '#edit_group' do
      let(:group_id) { 1 }
      let(:body) { [{ op: 'replace', path: '/name', value: 'group_name' }] }

      it 'raises OnlyForEnterpriseModeError when Enterprise mode is not enabled for Client', :default do
        stub_request(:patch, "https://domain.api.crowdin.com/#{target_api_url}/groups/#{group_id}")
        expect { @crowdin.edit_group(group_id, body) }.to raise_error(Crowdin::Errors::OnlyForEnterpriseModeError)
      end

      it 'returns 200 when request is valid', :enterprise do
        stub_request(:patch, "https://domain.api.crowdin.com/#{target_api_url}/groups/#{group_id}")
          .with(body: body.to_json)
        edit_group = @crowdin.edit_group(group_id, body)
        expect(edit_group).to eq(200)
      end

      it 'raises ArgumentError when request is missing required query parameter', :enterprise do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/groups/#{group_id}")
        expect { @crowdin.edit_group }.to raise_error(ArgumentError)
      end
    end

  end

end
