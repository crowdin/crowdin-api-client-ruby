# frozen_string_literal: true

describe Crowdin::ApiResources::Reports do
  describe 'Default endpoints' do
    describe '#list_report_settings_templates' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/reports/settings-templates")
        result = @crowdin.list_report_settings_templates({}, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#add_report_settings_template' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/reports/settings-templates")
        query = { name: 't', currency: 'USD', unit: 'words', mode: 'simple', config: {} }
        result = @crowdin.add_report_settings_template(query, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#get_report_settings_template' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/reports/settings-templates/1")
        result = @crowdin.get_report_settings_template(1, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#edit_report_settings_template' do
      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/reports/settings-templates/1")
        result = @crowdin.edit_report_settings_template({}, 1, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#delete_report_settings_template' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/reports/settings-templates/1")
        result = @crowdin.delete_report_settings_template(1, project_id)
        expect(result).to eq(200)
      end
    end

    describe '#generate_report' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/reports")
        generate_report = @crowdin.generate_report({}, project_id)
        expect(generate_report).to eq(200)
      end
    end

    describe '#check_report_generation_status' do
      let(:report_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/reports/#{report_id}")
        check_report_generation_status = @crowdin.check_report_generation_status(report_id, project_id)
        expect(check_report_generation_status).to eq(200)
      end
    end

    describe '#download_report' do
      let(:report_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/reports/#{report_id}/download")
        download_report = @crowdin.download_report(report_id, nil, project_id)
        expect(download_report).to eq(200)
      end
    end
  end

  describe 'Enterprise endpoints' do
    describe '#generate_group_report' do
      let(:group_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/groups/#{group_id}/reports")
        generate_group_report = @crowdin.generate_group_report(group_id, project_id)
        expect(generate_group_report).to eq(200)
      end
    end

    describe '#check_group_report_generation_status' do
      let(:group_id) { 1 }
      let(:report_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/groups/#{group_id}/reports/#{report_id}")
        check_group_report_generation_status = @crowdin.check_group_report_generation_status(group_id, report_id)
        expect(check_group_report_generation_status).to eq(200)
      end
    end

    describe '#download_group_report' do
      let(:group_id) { 1 }
      let(:report_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/groups/#{group_id}/reports/#{report_id}/download")
        download_group_report = @crowdin.download_group_report(group_id, project_id)
        expect(download_group_report).to eq(200)
      end
    end

    describe '#generate_organization_report' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/reports")
        generate_organization_report = @crowdin.generate_organization_report
        expect(generate_organization_report).to eq(200)
      end
    end

    describe '#check_organization_report_generation_status' do
      let(:report_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/reports/#{report_id}")
        check_organization_report_generation_status = @crowdin.check_organization_report_generation_status(report_id)
        expect(check_organization_report_generation_status).to eq(200)
      end
    end

    describe '#download_organization_report' do
      let(:report_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/reports/#{report_id}/download")
        download_organization_report = @crowdin.download_organization_report(report_id)
        expect(download_organization_report).to eq(200)
      end
    end
  end

  describe 'Setting Templates endpoints' do
    describe 'List Report Settings templates' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/reports/settings-templates")
        settings_templates = @crowdin.list_report_settings_templates({}, project_id)
        expect(settings_templates).to eq(200)
      end
    end

    describe 'Add Report Settings template' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/reports/settings-templates")
        settings_templates = @crowdin.add_report_settings_template(
          { name: '', currency: '', unit: '', mode: '', config: '' }, project_id
        )
        expect(settings_templates).to eq(200)
      end
    end

    describe 'Get Report Settings template' do
      let(:template_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/reports/settings-templates/#{template_id}")
        settings_templates = @crowdin.get_report_settings_template(template_id, project_id)
        expect(settings_templates).to eq(200)
      end
    end

    describe 'Get Report Settings template' do
      let(:template_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/reports/settings-templates/#{template_id}")
        settings_templates = @crowdin.edit_report_settings_template({}, template_id, project_id)
        expect(settings_templates).to eq(200)
      end
    end

    describe 'Get Report Settings template' do
      let(:template_id) { 1 }

      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/projects/#{project_id}/reports/settings-templates/#{template_id}")
        settings_templates = @crowdin.delete_report_settings_template(template_id, project_id)
        expect(settings_templates).to eq(200)
      end
    end
  end

  describe 'Default endpoints' do
    describe '#list_report_archives' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/reports/archives")
        result = @crowdin.list_report_archives({}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#delete_report_archive' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/users/1/reports/archives/1")
        result = @crowdin.delete_report_archive(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#get_report_archive' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/reports/archives/1")
        result = @crowdin.get_report_archive(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#export_report_archive' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/users/1/reports/archives/1/exports")
        result = @crowdin.export_report_archive(1, {}, 1)
        expect(result).to eq(200)
      end
    end

    describe '#check_report_archive_export_status' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/reports/archives/1/exports/1")
        result = @crowdin.check_report_archive_export_status(1, 1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#download_report_archive' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/reports/archives/1/exports/1/download")
        result = @crowdin.download_report_archive(1, 1, nil, 1)
        expect(result).to eq(200)
      end
    end

    describe '#list_user_report_settings_templates' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/reports/settings-templates")
        result = @crowdin.list_user_report_settings_templates(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#add_user_report_settings_template' do
      it 'when request are valid', :default do
        stub_request(:post, "https://api.crowdin.com/#{target_api_url}/users/1/reports/settings-templates")
        result = @crowdin.add_user_report_settings_template(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#delete_user_report_settings_template' do
      it 'when request are valid', :default do
        stub_request(:delete, "https://api.crowdin.com/#{target_api_url}/users/1/reports/settings-templates/1")
        result = @crowdin.delete_user_report_settings_template(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#get_user_report_settings_template' do
      it 'when request are valid', :default do
        stub_request(:get, "https://api.crowdin.com/#{target_api_url}/users/1/reports/settings-templates/1")
        result = @crowdin.get_user_report_settings_template(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#edit_user_report_settings_template' do
      it 'when request are valid', :default do
        stub_request(:patch, "https://api.crowdin.com/#{target_api_url}/users/1/reports/settings-templates/1")
        result = @crowdin.edit_user_report_settings_template(1, 1, [])
        expect(result).to eq(200)
      end
    end
  end

  describe 'Enterprise endpoints' do
    describe '#list_organization_report_settings_templates' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/reports/settings-templates")
        result = @crowdin.list_organization_report_settings_templates({})
        expect(result).to eq(200)
      end
    end

    describe '#add_organization_report_settings_template' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/reports/settings-templates")
        result = @crowdin.add_organization_report_settings_template({})
        expect(result).to eq(200)
      end
    end

    describe '#delete_organization_report_settings_template' do
      it 'when request are valid', :enterprise do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/reports/settings-templates/1")
        result = @crowdin.delete_organization_report_settings_template(1)
        expect(result).to eq(200)
      end
    end

    describe '#get_organization_report_settings_template' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/reports/settings-templates/1")
        result = @crowdin.get_organization_report_settings_template(1)
        expect(result).to eq(200)
      end
    end

    describe '#edit_organization_report_settings_template' do
      it 'when request are valid', :enterprise do
        stub_request(:patch, "https://domain.api.crowdin.com/#{target_api_url}/reports/settings-templates/1")
        result = @crowdin.edit_organization_report_settings_template(1, [])
        expect(result).to eq(200)
      end
    end

    describe '#list_report_archives' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/reports/archives")
        result = @crowdin.list_report_archives({})
        expect(result).to eq(200)
      end
    end

    describe '#delete_report_archive' do
      it 'when request are valid', :enterprise do
        stub_request(:delete, "https://domain.api.crowdin.com/#{target_api_url}/reports/archives/1")
        result = @crowdin.delete_report_archive(1)
        expect(result).to eq(200)
      end
    end

    describe '#get_report_archive' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/reports/archives/1")
        result = @crowdin.get_report_archive(1)
        expect(result).to eq(200)
      end
    end

    describe '#export_report_archive' do
      it 'when request are valid', :enterprise do
        stub_request(:post, "https://domain.api.crowdin.com/#{target_api_url}/reports/archives/1/exports")
        result = @crowdin.export_report_archive(1, {})
        expect(result).to eq(200)
      end
    end

    describe '#check_report_archive_export_status' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/reports/archives/1/exports/1")
        result = @crowdin.check_report_archive_export_status(1, 1)
        expect(result).to eq(200)
      end
    end

    describe '#download_report_archive' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/reports/archives/1/exports/1/download")
        result = @crowdin.download_report_archive(1, 1, nil)
        expect(result).to eq(200)
      end
    end
  end
end
