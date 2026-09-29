# frozen_string_literal: true

module Crowdin
  module ApiResources
    module SecurityLogs
      # @param user_id [Integer] User Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.security-logs.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.users.security-logs.getMany  Enterprise API Documentation}
      def list_user_security_logs(user_id, query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/users/#{user_id}/security-logs",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param user_id [Integer] User Identifier
      # @param security_log_id [Integer] User Security Log Id
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.security-logs.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.users.security-logs.get  Enterprise API Documentation}
      def get_user_security_log(user_id, security_log_id)
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/users/#{user_id}/security-logs/#{security_log_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # -- For Enterprise mode only --

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.security-logs.getMany  Enterprise API Documentation}
      def list_organization_security_logs(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/security-logs",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param security_log_id [Integer] Organization Security Log
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.security-logs.get  Enterprise API Documentation}
      def get_organization_security_log(security_log_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/security-logs/#{security_log_id}"
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
