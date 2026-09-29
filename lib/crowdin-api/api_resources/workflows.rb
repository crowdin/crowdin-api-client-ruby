# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Workflows
      # -- For Enterprise mode only --

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.workflow-steps.getMany  Enterprise API Documentation}
      def list_workflow_steps(query = {}, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        project_id       || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/workflow-steps",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param step_id [Integer] Workflow Step Identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.workflow-steps.get  Enterprise API Documentation}
      def get_workflow_step(step_id = nil, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        step_id          || raise_parameter_is_required_error(:step_id)
        project_id       || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/workflow-steps/#{step_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.workflow-templates.getMany  Enterprise API Documentation}
      def list_workflow_templates(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/workflow-templates",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param template_id [Integer] Workflow Template Identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.workflow-templates.get  Enterprise API Documentation}
      def get_workflow_template(template_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        template_id      || raise_parameter_is_required_error(:template_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/workflow-templates/#{template_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param step_id [Integer] Workflow Step Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.workflow-steps.strings.getMany  Enterprise API Documentation}
      def list_workflow_step_strings(step_id, query = {}, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/workflow-steps/#{step_id}/strings",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
