# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Webhooks
      def list_webhooks(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/webhooks",
          query
        )

        request.perform
      end

      def add_webhook(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/webhooks",
          query
        )

        request.perform
      end

      def get_webhook(webhook_id = nil, project_id = config.project_id)
        webhook_id || raise_parameter_is_required_error(:webhook_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/webhooks/#{webhook_id}"
        )

        request.perform
      end

      def delete_webhook(webhook_id = nil, project_id = config.project_id)
        webhook_id || raise_parameter_is_required_error(:webhook_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}/webhooks/#{webhook_id}"
        )

        request.perform
      end

      def edit_screenshot(webhook_id = nil, query = {}, project_id = config.project_id)
        webhook_id || raise_parameter_is_required_error(:webhook_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :patch,
          "/projects/#{project_id}/webhooks/#{webhook_id}",
          query
        )

        request.perform
      end
    end
  end
end
