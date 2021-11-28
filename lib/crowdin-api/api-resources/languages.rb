# frozen_string_literal: true

module Crowdin
  module API
    module Languages
      def list_languages(query = {})
        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/languages",
          query
        )

        request.process_request!
        request.process_response!
      end

      # Add custom language.
      #
      # === Parameters
      #
      # * +:name+ [String] - Language name
      # * +:code+ [String] - Custom language code
      # * +:localeCode+ [String] - Custom language locale code
      # * +:textDirection+ [String ltr/rtl] - Text direction in custom language
      # * +:pluralCategoryNames+ [String] - Array with category names
      # * +:threeLettersCode+ [String] - Custom language 3 letters code. Format: ISO 6393 code
      #
      # === Example
      #
      #  crowdin.add_custom_language(name: 'your_name', code: 'your_code' ..)
      #
      def add_custom_language(query = {})
        request = Web::Request.new(
          @connection,
          :post,
          "#{@target_api_url}/languages",
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_language(language_id = nil)
        language_id || raise(ArgumentError, ':language_id is required')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/languages/#{language_id}"
        )

        request.process_request!
        request.process_response!
      end

      def delete_custom_language(language_id = nil)
        language_id || raise(ArgumentError, ':language_id is required')

        request = Web::Request.new(
          @connection,
          :delete,
          "#{@target_api_url}/languages/#{language_id}"
        )

        request.process_request!
        request.process_response!
      end

      def edit_custom_language(language_id = nil)
        language_id || raise(ArgumentError, ':language_id is required')

        request = Web::Request.new(
          @connection,
          :patch,
          "#{@target_api_url}/languages/#{language_id}",
          query
        )

        request.process_request!
        request.process_response!
      end
    end
  end
end
