# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Webhooks
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

      def edit_screenshot(webhook_id = nil, query = {}, project_id = config.project_id)
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
