# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Languages
      def list_languages(query = {})
        request = Web::Request.new(
          self,
          :get,
          '/languages',
          query
        )

        request.perform
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
          self,
          :post,
          '/languages',
          query
        )

        request.perform
      end

      def get_language(language_id = nil)
        language_id || raise(ArgumentError, ':language_id is required')

        request = Web::Request.new(
          self,
          :get,
          "/languages/#{language_id}"
        )

        request.perform
      end

      def delete_custom_language(language_id = nil)
        language_id || raise(ArgumentError, ':language_id is required')

        request = Web::Request.new(
          self,
          :delete,
          "/languages/#{language_id}"
        )

        request.perform
      end

      def edit_custom_language(language_id = nil)
        language_id || raise(ArgumentError, ':language_id is required')

        request = Web::Request.new(
          self,
          :patch,
          "/languages/#{language_id}",
          query
        )

        request.perform
      end
    end
  end
end
