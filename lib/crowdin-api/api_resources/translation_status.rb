# frozen_string_literal: true

module Crowdin
  module ApiResources
    module TranslationStatus
      # @param branch_id [Integer] Branch Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.branches.languages.progress.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.branches.languages.progress.getMany  Enterprise API Documentation}
      def get_branch_progress(branch_id = nil, query = {}, project_id = config.project_id)
        branch_id  || raise_parameter_is_required_error(:branch_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/branches/#{branch_id}/languages/progress",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param directory_id [Integer] Directory Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.directories.languages.progress.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.directories.languages.progress.getMany  Enterprise API Documentation}
      def get_directory_progress(directory_id = nil, query = {}, project_id = config.project_id)
        directory_id || raise_parameter_is_required_error(:directory_id)
        project_id   || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/directories/#{directory_id}/languages/progress",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param file_id [Integer] File Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.files.languages.progress.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.files.languages.progress.getMany  Enterprise API Documentation}
      def get_file_progress(file_id = nil, query = {}, project_id = config.project_id)
        file_id    || raise_parameter_is_required_error(:file_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/files/#{file_id}/languages/progress",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param language_id [String] Language Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.languages.files.progress.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.languages.files.progress.getMany  Enterprise API Documentation}
      def get_language_progress(language_id = nil, query = {}, project_id = config.project_id)
        language_id || raise_parameter_is_required_error(:language_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/languages/#{language_id}/progress",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.languages.progress.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.languages.progress.getMany  Enterprise API Documentation}
      def get_project_progress(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/languages/progress",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.qa-checks.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.qa-checks.getMany  Enterprise API Documentation}
      def get_qa_progress(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/qa-checks",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.qa-checks.revalidate.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.qa-checks.revalidate.post  Enterprise API Documentation}
      def revalidate_qa_checks(body = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/qa-checks/revalidate",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param revalidation_id [String] QA Checks Revalidation Identifier, consists of 36 characters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.qa-checks.revalidate.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.qa-checks.revalidate.delete  Enterprise API Documentation}
      def cancel_qa_checks_revalidation(revalidation_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/qa-checks/revalidate/#{revalidation_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param revalidation_id [String] QA Checks Revalidation Identifier, consists of 36 characters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.qa-checks.revalidate.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.qa-checks.revalidate.get  Enterprise API Documentation}
      def qa_checks_revalidation_status(revalidation_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/qa-checks/revalidate/#{revalidation_id}"
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
