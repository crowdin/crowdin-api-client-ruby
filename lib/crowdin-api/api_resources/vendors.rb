# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Vendors
      # -- For Enterprise mode only --

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.vendors.getMany  Enterprise API Documentation}
      def list_vendors(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/vendors",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
