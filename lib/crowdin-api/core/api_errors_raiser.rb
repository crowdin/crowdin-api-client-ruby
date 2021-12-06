# frozen_string_literal: true

module Crowdin
  module Errors
    module ApiErrorsRaiser
      def raise_only_for_enterprise_mode_error
        raise(NoMethodError, 'This method can be called only for Enterprise mode')
      end
    end
  end
end
