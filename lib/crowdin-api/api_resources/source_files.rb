# frozen_string_literal: true

module Crowdin
  module ApiResources
    module SourceFiles
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
    end
  end
end
