# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Languages
      def list_languages(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/languages",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def add_custom_language(query = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/languages",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def get_language(language_id = nil)
        language_id || raise_parameter_is_required_error(:language_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/languages/#{language_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def delete_custom_language(language_id = nil)
        language_id || raise_parameter_is_required_error(:language_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/languages/#{language_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def edit_custom_language(language_id = nil, query = {})
        language_id || raise_parameter_is_required_error(:language_id)

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/languages/#{language_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
