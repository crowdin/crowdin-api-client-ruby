# frozen_string_literal: true

describe Crowdin::ApiResources::Reports do
  describe 'Default endpoints' do
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
end
