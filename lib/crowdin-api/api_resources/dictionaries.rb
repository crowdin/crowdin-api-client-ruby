# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Dictionaries
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#tag/Dictionaries/operation/api.projects.dictionaries.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Dictionaries/operation/api.projects.dictionaries.getMany  Enterprise API Documentation}
      def list_dictionaries(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/dictionaries",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param language_id [String] Language Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#tag/Dictionaries/operation/api.projects.dictionaries.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Dictionaries/operation/api.projects.dictionaries.patch  Enterprise API Documentation}
      def edit_dictionary(language_id = nil, query = {}, project_id = config.project_id)
        language_id || raise_parameter_is_required_error(:language_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/dictionaries/#{language_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
