# frozen_string_literal: true

module Crowdin
  module ApiResources
    module ExternalQaChecks
      # -- For Enterprise mode only --

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.external-qa-checks.getMany  Enterprise API Documentation}
      def list_external_qa_checks(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/external-qa-checks",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param external_qa_check_id [Integer] External QA check identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.external-qa-checks.get  Enterprise API Documentation}
      def get_external_qa_check(external_qa_check_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/external-qa-checks/#{external_qa_check_id}"
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
