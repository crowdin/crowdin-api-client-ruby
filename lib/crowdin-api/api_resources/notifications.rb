# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Notifications
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.notify.post  API Documentation}
      def send_notification_to_authenticated_user(query = {})
        %i[message].each do |param|
          query[param] || raise_parameter_is_required_error(param)
        end

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/notify",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.notify.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.notify.post  Enterprise API Documentation}
      def send_notifications_to_project_members(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        %i[message].each do |param|
          query[param] || raise_parameter_is_required_error(param)
        end

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/notify",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # -- For Enterprise mode only --

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.notify.post  Enterprise API Documentation}
      def send_notification_to_organization_members(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        %i[message].each do |param|
          query[param] || raise_parameter_is_required_error(param)
        end

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/notify",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
