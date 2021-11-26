module Crowdin
  module API
    module SourceFiles

      def list_branches(query={}, project_id=@project_id)
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

      def add_branch(query={}, project_id=@project_id)
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

      def get_branch(branch_id=nil, project_id=@project_id)
        branch_id  || raise(ArgumentError, ':branch_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/branches/#{branch_id}"
        )

        request.process_request!
        request.process_response!
      end

      def delete_branch(branch_id=nil, project_id=@project_id)
        branch_id  || raise(ArgumentError, ':branch_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :delete,
          "#{@target_api_url}/projects/#{project_id}/branches/#{branch_id}"
        )

        request.process_request!
        request.process_response!
      end

      def edit_branch(branch_id=nil, query={})
        project_id = query[:project_id] || @project_id

        branch_id  || raise(ArgumentError, ':branch_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :patch,
          "#{@target_api_url}/projects/#{project_id}/branches/#{branch_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

      def list_directories(query={}, project_id=@project_id)
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

      def add_directory(query={}, project_id=@project_id)
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

      def get_directory(directory_id=nil, project_id=@project_id)
        directory_id || raise(ArgumentError, ':directory_id is required')
        project_id   || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/directories/#{directory_id}"
        )

        request.process_request!
        request.process_response!
      end

      def delete_directory(directory_id=nil, project_id=@project_id)
        directory_id || raise(ArgumentError, ':directory_id is required')
        project_id   || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :delete,
          "#{@target_api_url}/projects/#{project_id}/directories/#{directory_id}"
        )

        request.process_request!
        request.process_response!
      end

      def edit_directory(directory_id=nil, query={})
        project_id = query[:project_id] || @project_id

        directory_id || raise(ArgumentError, ':directory_id is required')
        project_id   || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :patch,
          "#{@target_api_url}/projects/#{project_id}/directories/#{directory_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

      def list_files(query={}, project_id=@project_id)
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

      def add_file(query={}, project_id=@project_id)
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

      def get_file(file_id=nil, project_id=@project_id)
        file_id    || raise(ArgumentError, ':file_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/files/#{file_id}"
        )

        request.process_request!
        request.process_response!
      end

      def update_or_restore_file(file_id=nil, query={})
        project_id = query[:project_id] || @project_id

        file_id    || raise(ArgumentError, ':file_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :put,
          "#{@target_api_url}/projects/#{project_id}/files/#{file_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

      def delete_file(file_id=nil, project_id=@project_id)
        file_id    || raise(ArgumentError, ':file_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :delete,
          "#{@target_api_url}/projects/#{project_id}/files/#{file_id}"
        )

        request.process_request!
        request.process_response!
      end

      def edit_file(file_id=nil, query={})
        project_id = query[:project_id] || @project_id

        file_id    || raise(ArgumentError, ':file_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :patch,
          "#{@target_api_url}/projects/#{project_id}/files/#{file_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

      def download_file(file_id=nil, project_id=@project_id)
        file_id    || raise(ArgumentError, ':file_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/files/#{file_id}/download"
        )

        request.process_request!
        request.process_response!
      end

      def list_file_revisions(file_id=nil, query={})
        project_id = query[:project_id] || @project_id

        file_id    || raise(ArgumentError, ':file_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/files/#{file_id}/revisions",
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_file_revision(file_id=nil, revision_id=nil, project_id=@project_id)
        file_id     || raise(ArgumentError, ':file_id is required')
        revision_id || raise(ArgumentError, ':revision_id is required')
        project_id  || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

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
