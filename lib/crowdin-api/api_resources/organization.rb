# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Organization
      # -- For Enterprise mode only --

      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.organization.get  Enterprise API Documentation}
      def get_organization_info
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/organization"
        )
        Web::SendRequest.new(request).perform
      end

      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.organization.auth-settings.get  Enterprise API Documentation}
      def get_organization_authentication_settings
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/organization/auth-settings"
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
