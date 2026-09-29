# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Advisor
      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.advisors.checks.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.advisors.checks.post  Enterprise API Documentation}
      def create_advisor_check(body = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/advisors/checks",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param check_id [String] Advisor Check Identifier, consists of 36 characters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.advisors.checks.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.advisors.checks.get  Enterprise API Documentation}
      def get_advisor_check_status(check_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/advisors/checks/#{check_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.advisors.insights.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.advisors.insights.getMany  Enterprise API Documentation}
      def list_advisor_insights(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/advisors/insights",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param insight_id [Integer] Insight Identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.advisors.insights.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.advisors.insights.patch  Enterprise API Documentation}
      def edit_advisor_insight(insight_id, body = [], project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/advisors/insights/#{insight_id}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] applicationIdentifier
      # @param module_key [String] moduleKey
      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.applications.modules.advisors.insights.put  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.applications.modules.advisors.insights.put  Enterprise API Documentation}
      def create_or_update_application_advisor_insight(application_identifier, module_key, body = {},
                                                       project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        endpoint = "projects/#{project_id}/applications/#{application_identifier}/modules/#{module_key}/advisors/insights"
        request = Web::Request.new(
          connection,
          :put,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
