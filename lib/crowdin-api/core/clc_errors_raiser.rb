# frozen_string_literal: true

module Crowdin
  module Errors
    module ClcErrorsRaiser
      def raise_api_token_is_required_error
        raise(ArgumentError, '--api-token option is required')
      end

      def raise_organization_domain_is_required_error
        raise(ArgumentError, '--organization-domain option is required for Enterprise mode')
      end
    end
  end
end
