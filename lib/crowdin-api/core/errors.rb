# frozen_string_literal: true

module Crowdin
  module Errors
    class OnlyForEnterpriseModeError < StandardError; end
    class LoggerAreNotEnabledError   < StandardError; end
    class FetchAllProcessingError    < StandardError; end
  end
end
