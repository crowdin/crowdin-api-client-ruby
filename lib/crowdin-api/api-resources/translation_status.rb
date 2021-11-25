module Crowdin
  module API
    module TranslationStatus

      def get_branch_progress(project_id=@project_id, branch_id, query={})
        project_id  || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        branch_id   || raise(ArgumentError, ':file_id is required')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/branches/#{branch_id}/languages/progress",
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_directory_progress(project_id=@project_id, directory_id, query={})
        project_id   || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        directory_id || raise(ArgumentError, ':directory_id is required')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/directories/#{directory_id}/languages/progress",
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_file_progress(project_id=@project_id, file_id, query={})
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        file_id    || raise(ArgumentError, ':file_id is required')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/files/#{file_id}/languages/progress",
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_language_progress(project_id=@project_id, language_id, query={})
        project_id  || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        language_id || raise(ArgumentError, ':language_id is required')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/languages/#{language_id}/progress",
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_project_progress(project_id=@project_id, query={})
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

      def get_qa_progress(project_id=@project_id, query={})
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
