# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Notifications
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
    end
  end
end
