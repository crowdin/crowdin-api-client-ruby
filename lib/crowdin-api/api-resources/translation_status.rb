# frozen_string_literal: true

module Crowdin
  module API
    module TranslationStatus
      def get_branch_progress(branch_id = nil, query = {})
        project_id = query[:project_id] || @project_id

        branch_id   || raise(ArgumentError, ':file_id is required')
        project_id  || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/branches/#{branch_id}/languages/progress",
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_directory_progress(directory_id = nil, query = {})
        project_id = query[:project_id] || @project_id

        directory_id || raise(ArgumentError, ':directory_id is required')
        project_id   || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/directories/#{directory_id}/languages/progress",
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_file_progress(file_id = nil, query = {})
        project_id = query[:project_id] || @project_id

        file_id    || raise(ArgumentError, ':file_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/files/#{file_id}/languages/progress",
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_language_progress(language_id = nil, query = {})
        project_id = query[:project_id] || @project_id

        language_id || raise(ArgumentError, ':language_id is required')
        project_id  || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/languages/#{language_id}/progress",
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_project_progress(query = {}, project_id = @project_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/languages/progress",
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_qa_progress(query = {}, project_id = @project_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/qa-checks",
          query
        )

        request.process_request!
        request.process_response!
      end
    end
  end
end
