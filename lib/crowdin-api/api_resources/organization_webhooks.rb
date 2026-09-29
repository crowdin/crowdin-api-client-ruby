# frozen_string_literal: true

module Crowdin
  module ApiResources
    module OrganizationWebhooks
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.webhooks.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.webhooks.getMany  Enterprise API Documentation}
      def list_organization_webhooks(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/webhooks",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.webhooks.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.webhooks.post  Enterprise API Documentation}
      def add_organization_webhook(body = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/webhooks",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param organization_webhook_id [Integer] Webhook Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.webhooks.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.webhooks.delete  Enterprise API Documentation}
      def delete_organization_webhook(organization_webhook_id)
        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/webhooks/#{organization_webhook_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param organization_webhook_id [Integer] Webhook Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.webhooks.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.webhooks.get  Enterprise API Documentation}
      def get_organization_webhook(organization_webhook_id)
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/webhooks/#{organization_webhook_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param organization_webhook_id [Integer] Webhook Identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.webhooks.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.webhooks.patch  Enterprise API Documentation}
      def edit_organization_webhook(organization_webhook_id, body = [])
        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/webhooks/#{organization_webhook_id}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
