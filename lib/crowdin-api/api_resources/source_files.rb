# frozen_string_literal: true

module Crowdin
  module ApiResources
    module SourceFiles
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.branches.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.branches.getMany  Enterprise API Documentation}
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
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.branches.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.branches.post  Enterprise API Documentation}
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

      # @param branch_id [Integer] Branch Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.branches.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.branches.get  Enterprise API Documentation}
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

      # @param branch_id [Integer] Branch Identifier
      # @param async [Boolean] Delete asynchronously; poll #check_delete_branch_job_status for the result
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.branches.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.branches.delete  Enterprise API Documentation}
      def delete_branch(branch_id = nil, project_id = config.project_id, async: false)
        branch_id  || raise_parameter_is_required_error(:branch_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/branches/#{branch_id}",
          { headers: async ? { Prefer: 'respond-async' } : {} }
        )
        Web::SendRequest.new(request).perform
      end

      # @param branch_id [Integer] Branch Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.branches.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.branches.patch  Enterprise API Documentation}
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

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.directories.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.directories.getMany  Enterprise API Documentation}
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
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.directories.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.directories.post  Enterprise API Documentation}
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

      # @param directory_id [Integer] Directory Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.directories.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.directories.get  Enterprise API Documentation}
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

      # @param directory_id [Integer] Directory Identifier
      # @param async [Boolean] Delete asynchronously; poll #check_delete_directory_job_status for the result
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.directories.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.directories.delete  Enterprise API Documentation}
      def delete_directory(directory_id = nil, project_id = config.project_id, async: false)
        directory_id || raise_parameter_is_required_error(:directory_id)
        project_id   || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/directories/#{directory_id}",
          { headers: async ? { Prefer: 'respond-async' } : {} }
        )
        Web::SendRequest.new(request).perform
      end

      # @param directory_id [Integer] Directory Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.directories.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.directories.patch  Enterprise API Documentation}
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

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.files.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.files.getMany  Enterprise API Documentation}
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
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.files.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.files.post  Enterprise API Documentation}
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

      # @param file_id [Integer] File Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.files.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.files.get  Enterprise API Documentation}
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

      # @param file_id [Integer] File Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.files.put  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.files.put  Enterprise API Documentation}
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

      # @param file_id [Integer] File Identifier
      # @param async [Boolean] Delete asynchronously; poll #check_delete_file_job_status for the result
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.files.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.files.delete  Enterprise API Documentation}
      def delete_file(file_id = nil, project_id = config.project_id, async: false)
        file_id    || raise_parameter_is_required_error(:file_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/files/#{file_id}",
          { headers: async ? { Prefer: 'respond-async' } : {} }
        )
        Web::SendRequest.new(request).perform
      end

      # @param file_id [Integer] File Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.files.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.files.patch  Enterprise API Documentation}
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

      # @param file_id [Integer] File Identifier
      # @param destination [String] Destination of File
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.files.download.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.files.download.get  Enterprise API Documentation}
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

      # @param file_id [Integer] File Identifier
      # @param destination [String] Destination of File
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.files.preview.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.files.preview.get  Enterprise API Documentation}
      def download_file_preview(file_id = nil, destination = nil, project_id = config.project_id)
        file_id     || raise_parameter_is_required_error(:file_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/files/#{file_id}/preview"
        )
        Web::SendRequest.new(request, destination).perform
      end

      # @param file_id [Integer] File Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.files.revisions.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.files.revisions.getMany  Enterprise API Documentation}
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

      # @param file_id [Integer] File Identifier
      # @param revision_id [Integer] Revision Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.files.revisions.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.files.revisions.get  Enterprise API Documentation}
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

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.branches.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.branches.getMany  Enterprise API Documentation}
      def search_branches(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/branches",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.directories.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.directories.getMany  Enterprise API Documentation}
      def search_directories(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/directories",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.files.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.files.getMany  Enterprise API Documentation}
      def search_files(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/files",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param branch_id [Integer] Source Branch Identifier
      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/string-based/#operation/api.projects.branches.clones.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/string-based/#operation/api.projects.branches.clones.post  Enterprise API Documentation}
      def clone_branch(branch_id, body = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/branches/#{branch_id}/clones",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param branch_id [Integer] Source Branch Identifier
      # @param clone_id [String] Clone Branch Identifier, consists of 36 characters
      # * {https://support.crowdin.com/developer/api/v2/string-based/#operation/api.projects.branches.clones.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/string-based/#operation/api.projects.branches.clones.get  Enterprise API Documentation}
      def check_branch_clone_status(branch_id, clone_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/branches/#{branch_id}/clones/#{clone_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param branch_id [Integer] Source Branch Identifier
      # @param clone_id [String] Clone Branch Identifier, consists of 36 characters
      # * {https://support.crowdin.com/developer/api/v2/string-based/#operation/api.projects.branches.clones.branch.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/string-based/#operation/api.projects.branches.clones.branch.get  Enterprise API Documentation}
      def get_cloned_branch(branch_id, clone_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/branches/#{branch_id}/clones/#{clone_id}/branch"
        )
        Web::SendRequest.new(request).perform
      end

      # @param branch_id [Integer] Branch Identifier
      # @param job_identifier [String] jobIdentifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.branches.jobs.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.branches.jobs.get  Enterprise API Documentation}
      def check_delete_branch_job_status(branch_id, job_identifier, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/branches/#{branch_id}/jobs/#{job_identifier}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param branch_id [Integer] Branch Identifier
      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/string-based/#operation/api.projects.branches.merges.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/string-based/#operation/api.projects.branches.merges.post  Enterprise API Documentation}
      def merge_branch(branch_id, body = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/branches/#{branch_id}/merges",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param branch_id [Integer] Branch Identifier
      # @param merge_id [String] Merge Branch Identifier, consists of 36 characters
      # * {https://support.crowdin.com/developer/api/v2/string-based/#operation/api.projects.branches.merges.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/string-based/#operation/api.projects.branches.merges.get  Enterprise API Documentation}
      def check_branch_merge_status(branch_id, merge_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/branches/#{branch_id}/merges/#{merge_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param branch_id [Integer] Branch Identifier
      # @param merge_id [String] Merge Branch Identifier, consists of 36 characters
      # * {https://support.crowdin.com/developer/api/v2/string-based/#operation/api.projects.branches.merges.summary.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/string-based/#operation/api.projects.branches.merges.summary.get  Enterprise API Documentation}
      def get_branch_merge_summary(branch_id, merge_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/branches/#{branch_id}/merges/#{merge_id}/summary"
        )
        Web::SendRequest.new(request).perform
      end

      # @param directory_id [Integer] Directory Identifier
      # @param job_identifier [String] jobIdentifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.directories.jobs.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.directories.jobs.get  Enterprise API Documentation}
      def check_delete_directory_job_status(directory_id, job_identifier, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/directories/#{directory_id}/jobs/#{job_identifier}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param file_id [Integer] File Identifier
      # @param job_identifier [String] jobIdentifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.files.jobs.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.files.jobs.get  Enterprise API Documentation}
      def check_delete_file_job_status(file_id, job_identifier, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/files/#{file_id}/jobs/#{job_identifier}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param file_id [Integer] File Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.files.references.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.files.references.getMany  Enterprise API Documentation}
      def list_asset_references(file_id, query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/files/#{file_id}/references",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param file_id [Integer] File Identifier
      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.files.references.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.files.references.post  Enterprise API Documentation}
      def add_asset_reference(file_id, body = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/files/#{file_id}/references",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param file_id [Integer] File Identifier
      # @param reference_id [Integer] Reference Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.files.references.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.files.references.delete  Enterprise API Documentation}
      def delete_asset_reference(file_id, reference_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/files/#{file_id}/references/#{reference_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param file_id [Integer] File Identifier
      # @param reference_id [Integer] Reference Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.files.references.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.files.references.get  Enterprise API Documentation}
      def get_asset_reference(file_id, reference_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/files/#{file_id}/references/#{reference_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # -- For Enterprise mode only --

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.strings.reviewed-builds.getMany  Enterprise API Documentation}
      def list_reviewed_source_files_builds(query = {}, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/strings/reviewed-builds",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.strings.reviewed-builds.post  Enterprise API Documentation}
      def build_reviewed_source_files(body = {}, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/strings/reviewed-builds",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param build_id [Integer] Project Reviewed Source Files Build Identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.strings.reviewed-builds.get  Enterprise API Documentation}
      def check_reviewed_source_files_build_status(build_id, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/strings/reviewed-builds/#{build_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param build_id [Integer] Project Reviewed Source Files Build Identifier
      # @param destination [String] Destination of File
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.strings.reviewed-builds.download.download  Enterprise API Documentation}
      def download_reviewed_source_files(build_id, destination = nil, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/strings/reviewed-builds/#{build_id}/download"
        )
        Web::SendRequest.new(request, destination).perform
      end
    end
  end
end
