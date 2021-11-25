module Crowdin
  module API
    module SourceFiles

      def list_branches(project_id=@project_id, query={})
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/branches",
          query
        )

        request.process_request!
        request.process_response!
      end

      def add_branch(project_id=@project_id, query={})
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :post,
          "#{@target_api_url}/projects/#{project_id}/branches",
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_branch(project_id=@project_id, branch_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        branch_id  || raise(ArgumentError, ':branch_id is required')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/branches/#{branch_id}"
        )

        request.process_request!
        request.process_response!
      end

      def delete_branch(project_id=@project_id, branch_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        branch_id  || raise(ArgumentError, ':branch_id is required')

        request = Web::Request.new(
          @connection,
          :delete,
          "#{@target_api_url}/projects/#{project_id}/branches/#{branch_id}"
        )

        request.process_request!
        request.process_response!
      end

      def edit_branch(project_id=@project_id, branch_id, query={})
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        branch_id  || raise(ArgumentError, ':branch_id is required')

        request = Web::Request.new(
          @connection,
          :patch,
          "#{@target_api_url}/projects/#{project_id}/branches/#{branch_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

      def list_directories(project_id=@project_id, query={})
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/directories",
          query
        )

        request.process_request!
        request.process_response!
      end

      def add_directory(project_id=@project_id, query={})
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :post,
          "#{@target_api_url}/projects/#{project_id}/directories",
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_directory(project_id=@project_id, directory_id)
        project_id   || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        directory_id || raise(ArgumentError, ':directory_id is required')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/directories/#{directory_id}"
        )

        request.process_request!
        request.process_response!
      end

      def delete_directory(project_id=@project_id, directory_id)
        project_id   || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        directory_id || raise(ArgumentError, ':directory_id is required')

        request = Web::Request.new(
          @connection,
          :delete,
          "#{@target_api_url}/projects/#{project_id}/directories/#{directory_id}"
        )

        request.process_request!
        request.process_response!
      end

      def edit_directory(project_id=@project_id, directory_id, query={})
        project_id   || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        directory_id || raise(ArgumentError, ':directory_id is required')

        request = Web::Request.new(
          @connection,
          :patch,
          "#{@target_api_url}/projects/#{project_id}/directories/#{directory_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

      def list_files(project_id=@project_id, query={})
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/files",
          query
        )

        request.process_request!
        request.process_response!
      end

      def add_file(project_id=@project_id, query={})
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :post,
          "#{@target_api_url}/projects/#{project_id}/files",
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_file(project_id=@project_id, file_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        file_id    || raise(ArgumentError, ':file_id is required')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/files/#{file_id}"
        )

        request.process_request!
        request.process_response!
      end

      def update_or_restore_file(project_id=@project_id, file_id, query={})
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        file_id    || raise(ArgumentError, ':file_id is required')

        request = Web::Request.new(
          @connection,
          :put,
          "#{@target_api_url}/projects/#{project_id}/files/#{file_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

      def delete_file(project_id=@project_id, file_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        file_id    || raise(ArgumentError, ':file_id is required')

        request = Web::Request.new(
          @connection,
          :delete,
          "#{@target_api_url}/projects/#{project_id}/files/#{file_id}"
        )

        request.process_request!
        request.process_response!
      end

      def edit_file(project_id=@project_id, file_id, query={})
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        file_id    || raise(ArgumentError, ':file_id is required')

        request = Web::Request.new(
          @connection,
          :patch,
          "#{@target_api_url}/projects/#{project_id}/files/#{file_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

      def download_file(project_id=@project_id, file_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        file_id    || raise(ArgumentError, ':file_id is required')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/files/#{file_id}/download"
        )

        request.process_request!
        request.process_response!
      end

      def list_file_revisions(project_id=@project_id, file_id, query={})
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        file_id    || raise(ArgumentError, ':file_id is required')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/files/#{file_id}/revisions",
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_file_revision(project_id=@project_id, file_id, revision_id)
        project_id  || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        file_id     || raise(ArgumentError, ':file_id is required')
        revision_id || raise(ArgumentError, ':revision_id is required')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/files/#{file_id}/revisions/#{revision_id}"
        )

        request.process_request!
        request.process_response!
      end

    end
  end
end
