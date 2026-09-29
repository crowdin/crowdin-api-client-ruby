# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Languages
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.languages.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.languages.getMany  Enterprise API Documentation}
      def list_languages(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/languages",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.languages.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.languages.post  Enterprise API Documentation}
      def add_custom_language(query = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/languages",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param language_id [String] Language Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.languages.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.languages.get  Enterprise API Documentation}
      def get_language(language_id = nil)
        language_id || raise_parameter_is_required_error(:language_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/languages/#{language_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param language_id [String] Language Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.languages.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.languages.delete  Enterprise API Documentation}
      def delete_custom_language(language_id = nil)
        language_id || raise_parameter_is_required_error(:language_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/languages/#{language_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param language_id [String] Language Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.languages.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.languages.patch  Enterprise API Documentation}
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
