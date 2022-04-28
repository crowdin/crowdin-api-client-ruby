# frozen_string_literal: true

module Crowdin
  module ApiResources
    # -- For Enterprise mode only --
    module Vendors
      def list_vendors(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          self,
          :get,
          '/vendors',
          query
        )

        request.perform
      end
    end
  end
end
