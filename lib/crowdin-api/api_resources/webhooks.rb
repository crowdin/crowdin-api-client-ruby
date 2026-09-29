# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Webhooks
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.webhooks.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.webhooks.getMany  Enterprise API Documentation}
      def list_webhooks(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/webhooks",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.webhooks.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.webhooks.post  Enterprise API Documentation}
      def add_webhook(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/webhooks",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param webhook_id [Integer] Webhook Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.webhooks.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.webhooks.get  Enterprise API Documentation}
      def get_webhook(webhook_id = nil, project_id = config.project_id)
        webhook_id || raise_parameter_is_required_error(:webhook_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/webhooks/#{webhook_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param webhook_id [Integer] Webhook Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.webhooks.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.webhooks.delete  Enterprise API Documentation}
      def delete_webhook(webhook_id = nil, project_id = config.project_id)
        webhook_id || raise_parameter_is_required_error(:webhook_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/webhooks/#{webhook_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param webhook_id [Integer] Webhook Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.webhooks.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.webhooks.patch  Enterprise API Documentation}
      def edit_webhook(webhook_id = nil, query = {}, project_id = config.project_id)
        webhook_id || raise_parameter_is_required_error(:webhook_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/webhooks/#{webhook_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
