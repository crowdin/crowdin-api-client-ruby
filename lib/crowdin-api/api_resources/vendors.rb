# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Vendors
      # -- For Enterprise mode only --

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
