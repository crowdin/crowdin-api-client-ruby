# frozen_string_literal: true

describe Crowdin::ApiResources::Projects do
  describe 'Default endpoints' do
    describe '#list_projects' do
      let(:limit) { 1 }
      let(:offset) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects")
        list_projects = @crowdin.list_projects
        expect(list_projects).to eq(200)
      end

      it 'when request are valid and includes query parameters', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects")
          .with(query: { limit: limit, offset: offset })
        list_projects = @crowdin.list_projects({ limit: limit, offset: offset })
        expect(list_projects).to eq(200)
      end
    end

    describe '#add_project' do
      let(:project_name) { 'test_project' }
      let(:source_language_id) { 'en' }

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects")
          .with(body: { name: project_name, sourceLanguageId: source_language_id })
        add_project = @crowdin.add_project(name: project_name, sourceLanguageId: source_language_id)
        expect(add_project).to eq(200)
      end

      let(:body) do
        { "data" => { "id" => 1, "name" => "test_project" } }
      end

      it 'when request are valid and returns body', :default do
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

      it 'when request are valid', :default do
        get_project = @crowdin.get_project(project_id)
        expect(get_project).to eq(200)
      end

      it 'when request are invalid', :default do
        expect { @crowdin.get_project }.to raise_error(ArgumentError)
      end
    end

    describe '#delete_project' do
      before do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}")
      end

      let(:project_id) { 1 }

      it 'when request are valid', :default do
        delete_project = @crowdin.delete_project(project_id)
        expect(delete_project).to eq(200)
      end

      it 'when request are invalid', :default do
        expect { @crowdin.delete_project }.to raise_error(ArgumentError)
      end
    end

    describe '#edit_project' do
      let(:project_id) { 1 }
      let(:body) { [{ op: 'replace', path: '/name', value: 'project_name' }] }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}")
          .with(body: body.to_json)
        edit_project = @crowdin.edit_project(project_id, body)
        expect(edit_project).to eq(200)
      end

      it 'when request are invalid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}")
        expect { @crowdin.edit_project }.to raise_error(ArgumentError)
      end
    end

    describe '#list_project_strings_exporter_settings' do
      let(:project_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/strings-exporter-settings")
        list_project_strings_exporter_settings = @crowdin.list_project_strings_exporter_settings(project_id)
        expect(list_project_strings_exporter_settings).to eq(200)
      end

      it 'when the request is invalid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/strings-exporter-settings")
        expect { @crowdin.list_project_strings_exporter_settings }.to raise_error(ArgumentError)
      end
    end

    describe '#add_project_strings_exporter_settings' do
      let(:project_id) { 1 }
      let(:body) do
        {
          format: 'json',
          settings: {
            convertPlaceholders: true,
            convertLineBreaks: true,
          }
        }
      end

      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/strings-exporter-settings")
          .with(body: body.to_json)
        add_project_strings_exporter_settings = @crowdin.add_project_strings_exporter_settings(project_id, body)
        expect(add_project_strings_exporter_settings).to eq(200)
      end

      it 'when the request is invalid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/strings-exporter-settings")
        expect { @crowdin.add_project_strings_exporter_settings }.to raise_error(ArgumentError)
      end
    end

    describe '#get_project_strings_exporter_settings' do
      let(:project_id) { 1 }
      let(:system_strings_exporter_settings_id) { 1 }
      let(:path) { "projects/#{project_id}/strings-exporter-settings/#{system_strings_exporter_settings_id}" }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/#{path}")
        get_project_strings_exporter_settings = @crowdin.get_project_strings_exporter_settings(project_id, system_strings_exporter_settings_id)
        expect(get_project_strings_exporter_settings).to eq(200)
      end

      it 'when the request is invalid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/#{path}")
        expect { @crowdin.get_project_strings_exporter_settings }.to raise_error(ArgumentError)
      end
    end

    describe '#delete_project_strings_exporter_settings' do
      let(:project_id) { 1 }
      let(:system_strings_exporter_settings_id) { 1 }
      let(:path) { "projects/#{project_id}/strings-exporter-settings/#{system_strings_exporter_settings_id}" }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/#{path}")
        delete_project_strings_exporter_settings = @crowdin.delete_project_strings_exporter_settings(project_id, system_strings_exporter_settings_id)
        expect(delete_project_strings_exporter_settings).to eq(200)
      end

      it 'when the request is invalid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/#{path}")
        expect { @crowdin.delete_project_strings_exporter_settings }.to raise_error(ArgumentError)
      end
    end

    describe '#edit_project_strings_exporter_settings' do
      let(:project_id) { 1 }
      let(:system_strings_exporter_settings_id) { 1 }
      let(:body) do
        {
          format: 'json',
          settings: {
            convertPlaceholders: true,
            convertLineBreaks: true,
          }
        }
      end
      let(:path) { "projects/#{project_id}/strings-exporter-settings/#{system_strings_exporter_settings_id}" }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/#{path}")
          .with(body: body.to_json)
        edit_project_strings_exporter_settings = @crowdin.edit_project_strings_exporter_settings(project_id, system_strings_exporter_settings_id, body)
        expect(edit_project_strings_exporter_settings).to eq(200)
      end

      it 'when the request is invalid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/#{path}")
        expect { @crowdin.edit_project_strings_exporter_settings }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'Enterprise endpoints' do
    describe '#list_groups' do
      let(:limit) { 1 }
      let(:offset) { 1 }

      it 'when Enterprise mode is not enabled', :default do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/groups")
        expect { @crowdin.list_groups }.to raise_error(Crowdin::Errors::OnlyForEnterpriseModeError)
      end

      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/groups")
        list_groups = @crowdin.list_groups
        expect(list_groups).to eq(200)
      end

      it 'when request are valid and includes query parameters', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/groups")
          .with(query: { limit: limit, offset: offset })
        list_groups = @crowdin.list_groups({ limit: limit, offset: offset })
        expect(list_groups).to eq(200)
      end
    end

    describe '#add_group' do
      let(:group_name) { 'test_group' }

      it 'when Enterprise mode is not enabled', :default do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/groups")
        expect { @crowdin.add_group(name: group_name) }.to raise_error(Crowdin::Errors::OnlyForEnterpriseModeError)
      end

      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/groups")
          .with(body: { name: group_name })
        add_group = @crowdin.add_group(name: group_name)
        expect(add_group).to eq(200)
      end

      let(:body) do
        { "data"=> { "id"=>1, "name"=>"test_group" } }
      end

      it 'when request are valid and returns body', :enterprise do
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

      it 'when Enterprise mode is not enabled', :default do
        expect { @crowdin.get_group(group_id) }.to raise_error(Crowdin::Errors::OnlyForEnterpriseModeError)
      end

      it 'when request are valid', :enterprise do
        get_group = @crowdin.get_group(group_id)
        expect(get_group).to eq(200)
      end

      it 'when request are invalid', :enterprise do
        expect { @crowdin.get_group }.to raise_error(ArgumentError)
      end
    end

    describe '#delete_group' do
      before do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/groups/#{group_id}")
      end

      let(:group_id) { 1 }

      it 'when Enterprise mode is not enabled', :default do
        expect { @crowdin.delete_group(group_id) }.to raise_error(Crowdin::Errors::OnlyForEnterpriseModeError)
      end

      it 'when request are valid', :enterprise do
        delete_group = @crowdin.delete_group(group_id)
        expect(delete_group).to eq(200)
      end

      it 'when request are invalid', :enterprise do
        expect { @crowdin.delete_group }.to raise_error(ArgumentError)
      end
    end

    describe '#edit_group' do
      let(:group_id) { 1 }
      let(:body) { [{ op: 'replace', path: '/name', value: 'group_name' }] }

      it 'when Enterprise mode is not enabled', :default do
        stub_request(:patch, "https://domain.api.crowdin.com/#{target_api_url}/groups/#{group_id}")
        expect { @crowdin.edit_group(group_id, body) }.to raise_error(Crowdin::Errors::OnlyForEnterpriseModeError)
      end

      it 'when request are valid', :enterprise do
        stub_request(:patch, "https://domain.api.crowdin.com/#{target_api_url}/groups/#{group_id}")
          .with(body: body.to_json)
        edit_group = @crowdin.edit_group(group_id, body)
        expect(edit_group).to eq(200)
      end

      it 'when request are invalid', :enterprise do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/groups/#{group_id}")
        expect { @crowdin.edit_group }.to raise_error(ArgumentError)
      end
    end
  end
end
