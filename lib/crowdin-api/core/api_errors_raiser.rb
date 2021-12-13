# frozen_string_literal: true

module Crowdin
  module Errors
    module ApiErrorsRaiser
      def raise_only_for_enterprise_mode_error
        raise(OnlyForEnterpriseMode, 'This method can be called only for Enterprise mode')
      end

      def raise_project_id_is_required_error
        raise(ArgumentError, ':project_id is required in parameters or while Client initialization')
      end

      def raise_parameter_is_required_error(parameter)
        raise(ArgumentError, ":#{parameter} is required")
      end

      # crowdin-console errors

      def raise_api_token_is_required_error
        raise(ArgumentError, '--api-token option is required')
      end

      def raise_organization_domain_is_required_error
        raise(ArgumentError, '--organization-domain option is required for Enterprise mode')
      end
    end
  end
end
