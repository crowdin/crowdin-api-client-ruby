# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Dictionaries
      def list_dictionaries(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/dictionaries",
          query
        )

        request.perform
      end

      def edit_dictionary(language_id = nil, query = {}, project_id = config.project_id)
        language_id || raise_parameter_is_required_error(:language_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :patch,
          "/projects/#{project_id}/dictionaries/#{language_id}",
          query
        )

        request.perform
      end
    end
  end
end
