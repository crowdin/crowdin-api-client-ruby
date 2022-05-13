# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Dictionaries
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
