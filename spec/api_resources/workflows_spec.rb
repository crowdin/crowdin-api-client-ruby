# frozen_string_literal: true

describe Crowdin::ApiResources::Workflows do
  describe 'Enterprise endpoints' do
    describe '#list_workflow_steps' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/projects/#{project_id}/workflow-steps")
        list_workflow_steps = @crowdin.list_workflow_steps({}, project_id)
        expect(list_workflow_steps).to eq(200)
      end
    end

    describe '#get_workflow_step' do
      let(:step_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/projects/#{project_id}/workflow-steps/#{step_id}")
        get_workflow_step = @crowdin.get_workflow_step(step_id, project_id)
        expect(get_workflow_step).to eq(200)
      end
    end

    describe '#list_workflow_templates' do
      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/workflow-templates")
        list_workflow_templates = @crowdin.list_workflow_templates
        expect(list_workflow_templates).to eq(200)
      end
    end

    describe '#get_workflow_template' do
      let(:template_id) { 1 }

      it 'when request are valid', :enterprise do
        stub_request(:get, "https://domain.api.crowdin.com/#{target_api_url}/workflow-templates/#{template_id}")
        get_workflow_template = @crowdin.get_workflow_template(template_id)
        expect(get_workflow_template).to eq(200)
      end
    end
  end
end
