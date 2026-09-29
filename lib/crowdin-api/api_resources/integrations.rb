# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Integrations
      # @param application_identifier [String] Identifier of the application
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.integrations.job.list  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.integrations.job.list  Enterprise API Documentation}
      def list_jobs(application_identifier, query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/applications/#{application_identifier}/api/all-jobs",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.integrations.crowdin.files  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.integrations.crowdin.files  Enterprise API Documentation}
      def list_crowdin_files(application_identifier, query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/applications/#{application_identifier}/api/crowdin-files",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.integrations.crowdin.update  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.integrations.crowdin.update  Enterprise API Documentation}
      def update_crowdin_files(application_identifier, body = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/applications/#{application_identifier}/api/crowdin-update",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.integrations.file.progress  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.integrations.file.progress  Enterprise API Documentation}
      def get_integration_file_progress(application_identifier, query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/applications/#{application_identifier}/api/file-progress",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.integrations.integration.files  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.integrations.integration.files  Enterprise API Documentation}
      def list_integration_files(application_identifier, query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/applications/#{application_identifier}/api/integration-files",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.integrations.integration.update  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.integrations.integration.update  Enterprise API Documentation}
      def update_integration_files(application_identifier, body = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/applications/#{application_identifier}/api/integration-update",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.integrations.job.info  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.integrations.job.info  Enterprise API Documentation}
      def get_job_info(application_identifier, query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/applications/#{application_identifier}/api/job-info",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.integrations.job.cancel  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.integrations.job.cancel  Enterprise API Documentation}
      def cancel_job(application_identifier, query = {})
        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/applications/#{application_identifier}/api/jobs",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.integrations.integration.login  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.integrations.integration.login  Enterprise API Documentation}
      def integration_login(application_identifier, body = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/applications/#{application_identifier}/api/login",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.integrations.integration.fields  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.integrations.integration.fields  Enterprise API Documentation}
      def integration_login_form_fields(application_identifier)
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/applications/#{application_identifier}/api/login-fields"
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.integrations.settings.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.integrations.settings.get  Enterprise API Documentation}
      def get_application_settings(application_identifier, query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/applications/#{application_identifier}/api/settings",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.integrations.settings.update  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.integrations.settings.update  Enterprise API Documentation}
      def update_application_settings(application_identifier, body = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/applications/#{application_identifier}/api/settings",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.integrations.sync.settings.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.integrations.sync.settings.get  Enterprise API Documentation}
      def get_sync_settings(application_identifier, query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/applications/#{application_identifier}/api/sync-settings",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.integrations.sync.settings.update  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.integrations.sync.settings.update  Enterprise API Documentation}
      def update_sync_settings(application_identifier, body = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/applications/#{application_identifier}/api/sync-settings",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
