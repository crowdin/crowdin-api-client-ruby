module Crowdin
  module Errors

    class Error < StandardError
      attr_reader :key
      attr_reader :error_code
      attr_reader :error_message

      def initialize(key, error_code, error_message)
        @key           = key
        @error_code    = error_code.to_i
        @error_message = error_message
        @message       = "#{key} => #{error_code}: #{error_message}"
      end

      def to_s
        @message
      end
    end

  end
end
