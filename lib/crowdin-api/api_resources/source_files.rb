# frozen_string_literal: true

module Crowdin
  module ApiResources
    module SourceFiles

      # @param query [Hash] Request Body
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.branches.getMany  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.branches.getMany  Enterprise API Documentation}
      def list_branches(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/branches",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.branches.post  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.branches.post  Enterprise API Documentation}
      def add_branch(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/branches",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param branch_id [Integer] Branch ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.branches.get  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.branches.get  Enterprise API Documentation}
      def get_branch(branch_id = nil, project_id = config.project_id)
        branch_id  || raise_parameter_is_required_error(:branch_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/branches/#{branch_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param branch_id [Hash] Branch ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.branches.delete  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.branches.delete  Enterprise API Documentation}
      def delete_branch(branch_id = nil, project_id = config.project_id)
        branch_id  || raise_parameter_is_required_error(:branch_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/branches/#{branch_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # @param branch_id [Integer] Branch ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.branches.patch  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.branches.patch  Enterprise API Documentation}
      def edit_branch(branch_id = nil, query = {}, project_id = config.project_id)
        branch_id  || raise_parameter_is_required_error(:branch_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/branches/#{branch_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.directories.getMany  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.directories.getMany  Enterprise API Documentation}
      def list_directories(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/directories",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.directories.post  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.directories.post  Enterprise API Documentation}
      def add_directory(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/directories",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param directory_id [Integer] Directory ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.directories.get API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.directories.get  Enterprise API Documentation}
      def get_directory(directory_id = nil, project_id = config.project_id)
        directory_id || raise_parameter_is_required_error(:directory_id)
        project_id   || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/directories/#{directory_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param directory_id [Integer] Directory ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.directories.delete  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.directories.delete  Enterprise API Documentation}
      def delete_directory(directory_id = nil, project_id = config.project_id)
        directory_id || raise_parameter_is_required_error(:directory_id)
        project_id   || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/directories/#{directory_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # @param directory_id [Integer] Directory ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.directories.patch  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.directories.patch  Enterprise API Documentation}
      def edit_directory(directory_id = nil, query = {}, project_id = config.project_id)
        directory_id || raise_parameter_is_required_error(:directory_id)
        project_id   || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/directories/#{directory_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.files.getMany  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.files.getMany  Enterprise API Documentation}
      def list_files(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/files",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.files.post  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.files.post  Enterprise API Documentation}
      def add_file(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/files",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param file_id [Integer] File ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.files.get  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.files.get  Enterprise API Documentation}
      def get_file(file_id = nil, project_id = config.project_id)
        file_id    || raise_parameter_is_required_error(:file_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/files/#{file_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # @param file_id [Integer] File ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.files.put  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.files.put  Enterprise API Documentation}
      def update_or_restore_file(file_id = nil, query = {}, project_id = config.project_id)
        file_id    || raise_parameter_is_required_error(:file_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :put,
          "#{config.target_api_url}/projects/#{project_id}/files/#{file_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param file_id [Integer] File ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.files.delete  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.files.delete Enterprise API Documentation}
      def delete_file(file_id = nil, project_id = config.project_id)
        file_id    || raise_parameter_is_required_error(:file_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/files/#{file_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # @param file_id [Integer] File ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.files.patch  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.files.patch Enterprise API Documentation}
      def edit_file(file_id = nil, query = {}, project_id = config.project_id)
        file_id    || raise_parameter_is_required_error(:file_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/files/#{file_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param file_id [Integer] File ID
      # @param destination [String] Destination of File
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.files.download.get API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.files.download.get Enterprise API Documentation}
      def download_file(file_id = nil, destination = nil, project_id = config.project_id)
        file_id     || raise_parameter_is_required_error(:file_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/files/#{file_id}/download"
        )
        Web::SendRequest.new(request, destination).perform
      end

      # @param query [Hash] Request Body
      # @param file_id [Integer] File ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.files.revisions.getMany API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.files.revisions.getMany Enterprise API Documentation}
      def list_file_revisions(file_id = nil, query = {}, project_id = config.project_id)
        file_id    || raise_parameter_is_required_error(:file_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/files/#{file_id}/revisions",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param revision_id [Integer] Revision ID
      # @param file_id [Integer] File ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.files.revisions.get API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.files.revisions.get Enterprise API Documentation}
      def get_file_revision(file_id = nil, revision_id = nil, project_id = config.project_id)
        file_id     || raise_parameter_is_required_error(:file_id)
        revision_id || raise_parameter_is_required_error(:revision_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/files/#{file_id}/revisions/#{revision_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def download_file_preview(file_id = nil, project_id = config.project_id)
        file_id     || raise_parameter_is_required_error(:file_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/files/#{file_id}/preview"
        )
        Web::SendRequest.new(request).perform
      end

    end
  end
end
