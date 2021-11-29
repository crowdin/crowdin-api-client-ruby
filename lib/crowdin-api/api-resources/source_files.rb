# frozen_string_literal: true

module Crowdin
  module ApiResources
    module SourceFiles
      def list_branches(query = {}, project_id = config.project_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/branches",
          query
        )

        request.perform
      end

      def add_branch(query = {}, project_id = config.project_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/branches",
          query
        )

        request.perform
      end

      def get_branch(branch_id = nil, project_id = config.project_id)
        branch_id  || raise(ArgumentError, ':branch_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/branches/#{branch_id}"
        )

        request.perform
      end

      def delete_branch(branch_id = nil, project_id = config.project_id)
        branch_id  || raise(ArgumentError, ':branch_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}/branches/#{branch_id}"
        )

        request.perform
      end

      def edit_branch(branch_id = nil, query = {})
        project_id = query[:project_id] || config.project_id

        branch_id  || raise(ArgumentError, ':branch_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :patch,
          "/projects/#{project_id}/branches/#{branch_id}",
          query
        )

        request.perform
      end

      def list_directories(query = {}, project_id = config.project_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/directories",
          query
        )

        request.perform
      end

      def add_directory(query = {}, project_id = config.project_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/directories",
          query
        )

        request.perform
      end

      def get_directory(directory_id = nil, project_id = config.project_id)
        directory_id || raise(ArgumentError, ':directory_id is required')
        project_id   || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/directories/#{directory_id}"
        )

        request.perform
      end

      def delete_directory(directory_id = nil, project_id = config.project_id)
        directory_id || raise(ArgumentError, ':directory_id is required')
        project_id   || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}/directories/#{directory_id}"
        )

        request.perform
      end

      def edit_directory(directory_id = nil, query = {})
        project_id = query[:project_id] || config.project_id

        directory_id || raise(ArgumentError, ':directory_id is required')
        project_id   || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :patch,
          "/projects/#{project_id}/directories/#{directory_id}",
          query
        )

        request.perform
      end

      def list_files(query = {}, project_id = config.project_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/files",
          query
        )

        request.perform
      end

      # Add custom language.
      #
      # === Parameters
      #
      # * +:projectId+ [Integer] - Project Identifier. Get via list_projects. Can be initialized with the Crowdin Client
      # * +:storageId+ [Integer] - Storage Identifier. Get via list_storages
      # * +:name+ [String] - File name. Note: Can't contain \ / : * ? " < > | symbols. ZIP files are not allowed.
      #
      # === Example
      #
      # when you're initialized Crowdin Client with a project_id
      #
      #  crowdin.add_file(storage_id: your_storage_id, name: 'your_filename')
      #
      # or you can use the specified project_id
      #
      #  crowdin.add_file({}, your_project_id)
      #
      def add_file(query = {}, project_id = config.project_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/files",
          query
        )

        request.perform
      end

      def get_file(file_id = nil, project_id = config.project_id)
        file_id    || raise(ArgumentError, ':file_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/files/#{file_id}"
        )

        request.perform
      end

      def update_or_restore_file(file_id = nil, query = {})
        project_id = query[:project_id] || config.project_id

        file_id    || raise(ArgumentError, ':file_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :put,
          "/projects/#{project_id}/files/#{file_id}",
          query
        )

        request.perform
      end

      def delete_file(file_id = nil, project_id = config.project_id)
        file_id    || raise(ArgumentError, ':file_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}/files/#{file_id}"
        )

        request.perform
      end

      def edit_file(file_id = nil, query = {})
        project_id = query[:project_id] || config.project_id

        file_id    || raise(ArgumentError, ':file_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :patch,
          "/projects/#{project_id}/files/#{file_id}",
          query
        )

        request.perform
      end

      def download_file(destination = nil, file_id = nil, project_id = config.project_id)
        destination || raise(ArgumentError, ':destination is required for downlaods')
        file_id     || raise(ArgumentError, ':file_id is required')
        project_id  || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/files/#{file_id}/download",
          {},
          {},
          destination
        )

        request.perform
      end

      # List file revisions.
      #
      # === Parameters
      #
      # * +:projectId+ [Integer] - Project Identifier. Get via list_projects. Can be initialized with the Crowdin Client
      # * +:fileId+ [Integer] - File Identifier. Get via list_files
      #
      # Optional:
      # * +:limit+ [Integer 1..500] - A maximum number of items to retrieve, default - 25
      # * +:offset+ [Integer >= 0] - A starting offset in the collection, default - 0
      #
      # === Example
      #
      # when you're initialized Crowdin Client with a project_id
      #
      #  crowdin.list_file_revisions(your_file_id, { limit: your_value })
      #
      # or you can use the specified project_id
      #
      #  crowdin.list_file_revisions(your_file_id, { project_id: your_project_id ..})
      #
      def list_file_revisions(file_id = nil, query = {})
        project_id = query[:project_id] || config.project_id

        file_id    || raise(ArgumentError, ':file_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/files/#{file_id}/revisions",
          query
        )

        request.perform
      end

      def get_file_revision(file_id = nil, revision_id = nil, project_id = config.project_id)
        file_id     || raise(ArgumentError, ':file_id is required')
        revision_id || raise(ArgumentError, ':revision_id is required')
        project_id  || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/files/#{file_id}/revisions/#{revision_id}"
        )

        request.perform
      end
    end
  end
end
