# frozen_string_literal: true

module Crowdin
  module Errors
    module ApiErrorsRaiser
      def raise_only_for_enterprise_mode_error
        raise(OnlyForEnterpriseModeError, 'This method can be called only for Enterprise mode')
      end

      def raise_project_id_is_required_error
        raise(ArgumentError, ':project_id is required in parameters or while Client initialization')
      end

      def raise_parameter_is_required_error(parameter)
        raise(ArgumentError, ":#{parameter} is required")
      end
    end
  end
end
