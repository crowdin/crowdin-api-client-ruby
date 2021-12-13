# frozen_string_literal: true

module Crowdin
  module ApiResources
    module TranslationStatus
      def get_branch_progress(branch_id = nil, query = {})
        project_id = query[:project_id] || config.project_id

        branch_id   || raise(ArgumentError, ':file_id is required')
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/branches/#{branch_id}/languages/progress",
          query
        )

        request.perform
      end

      def get_directory_progress(directory_id = nil, query = {})
        project_id = query[:project_id] || config.project_id

        directory_id || raise(ArgumentError, ':directory_id is required')
        project_id   || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/directories/#{directory_id}/languages/progress",
          query
        )

        request.perform
      end

      def get_file_progress(file_id = nil, query = {})
        project_id = query[:project_id] || config.project_id

        file_id    || raise(ArgumentError, ':file_id is required')
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/files/#{file_id}/languages/progress",
          query
        )

        request.perform
      end

      def get_language_progress(language_id = nil, query = {})
        project_id = query[:project_id] || config.project_id

        language_id || raise(ArgumentError, ':language_id is required')
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/languages/#{language_id}/progress",
          query
        )

        request.perform
      end

      def get_project_progress(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/languages/progress",
          query
        )

        request.perform
      end

      def get_qa_progress(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/qa-checks",
          query
        )

        request.perform
      end
    end
  end
end
