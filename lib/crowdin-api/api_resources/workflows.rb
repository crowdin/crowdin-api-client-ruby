# frozen_string_literal: true

module Crowdin
  module ApiResources
    # -- For Enterprise mode only --
    module Workflows
      def list_workflow_steps(query = {}, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        project_id              || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/workflow-steps",
          query
        )

        request.perform
      end

      def get_workflow_step(step_id = nil, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        step_id                 || raise_parameter_is_required_error(:step_id)
        project_id              || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/workflow-steps/#{step_id}"
        )

        request.perform
      end

      def list_workflow_templates(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          self,
          :get,
          '/workflow-templates',
          query
        )

        request.perform
      end

      def get_workflow_template(template_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        template_id             || raise_parameter_is_required_error(:template_id)

        request = Web::Request.new(
          self,
          :get,
          "/workflow-templates/#{template_id}"
        )

        request.perform
      end
    end
  end
end
