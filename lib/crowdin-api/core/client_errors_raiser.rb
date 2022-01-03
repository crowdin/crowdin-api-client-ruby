# frozen_string_literal: true

module Crowdin
  module Errors
    module ClientErrorsRaiser
      def raise_logger_are_not_enabled_error
        raise(LoggerAreNotEnabledError, 'Logger are not enabled in your Client configuration, enable it ' +
                                        'before setting your own logger')
      end
    end
  end
end
