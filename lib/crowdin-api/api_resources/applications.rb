# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Applications
      # @param application_identifier [String] Identifier of the application
      # @param path [String] The path is implemented by the application
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.api.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.api.get  Enterprise API Documentation}
      def get_application_data(application_identifier = nil, path = nil)
        application_identifier || raise_parameter_is_required_error(:application_identifier)
        path || raise_parameter_is_required_error(:path)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/applications/#{application_identifier}/api/#{path}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # @param application_identifier [String] Identifier of the application
      # @param path [String] The path is implemented by the application
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.api.put  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.api.put  Enterprise API Documentation}
      def update_or_restore_application_data(query = {}, application_identifier = nil, path = nil)
        application_identifier || raise_parameter_is_required_error(:application_identifier)
        path || raise_parameter_is_required_error(:path)

        request = Web::Request.new(
          connection,
          :put,
          "#{config.target_api_url}/applications/#{application_identifier}/api/#{path}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # @param application_identifier [String] Identifier of the application
      # @param path [String] The path is implemented by the application
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.api.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.api.post  Enterprise API Documentation}
      def add_application_data(query = {}, application_identifier = nil, path = nil)
        application_identifier || raise_parameter_is_required_error(:application_identifier)
        path || raise_parameter_is_required_error(:path)

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/applications/#{application_identifier}/api/#{path}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # @param application_identifier [String] Identifier of the application
      # @param path [String] The path is implemented by the application
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.api.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.api.delete  Enterprise API Documentation}
      def delete_application_data(query = {}, application_identifier = nil, path = nil)
        application_identifier || raise_parameter_is_required_error(:application_identifier)
        path || raise_parameter_is_required_error(:path)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/applications/#{application_identifier}/api/#{path}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # @param application_identifier [String] Identifier of the application
      # @param path [String] The path is implemented by the application
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.api.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.api.patch  Enterprise API Documentation}
      def edit_application_data(query = {}, application_identifier = nil, path = nil)
        application_identifier || raise_parameter_is_required_error(:application_identifier)
        path || raise_parameter_is_required_error(:path)

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/applications/#{application_identifier}/api/#{path}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.consents.getMany  API Documentation}
      def list_application_consent_decisions(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/applications/consents",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.consents.post  API Documentation}
      def create_application_consent_decision(body = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/applications/consents",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param consent_id [Integer] Consent Decision Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.consents.delete  API Documentation}
      def delete_application_consent_decision(consent_id)
        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/applications/consents/#{consent_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param consent_id [Integer] Consent Decision Identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.consents.patch  API Documentation}
      def edit_application_consent_decision(consent_id, body = [])
        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/applications/consents/#{consent_id}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.installations.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.installations.getMany  Enterprise API Documentation}
      def list_application_installations(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/applications/installations",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.installations.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.installations.post  Enterprise API Documentation}
      def install_application(body = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/applications/installations",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param identifier [String] Application Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.installations.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.installations.delete  Enterprise API Documentation}
      def delete_application_installation(identifier, query = {})
        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/applications/installations/#{identifier}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param identifier [String] Application Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.installations.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.installations.get  Enterprise API Documentation}
      def get_application_installation(identifier)
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/applications/installations/#{identifier}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param identifier [String] Application Identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.installations.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.installations.patch  Enterprise API Documentation}
      def edit_application_installation(identifier, body = [])
        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/applications/installations/#{identifier}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param identifier [String] Application Identifier
      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.installations.bundles.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.installations.bundles.post  Enterprise API Documentation}
      def upload_application_bundle(identifier, body = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/applications/installations/#{identifier}/bundles",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param identifier [String] Application Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.installations.update.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.installations.update.get  Enterprise API Documentation}
      def get_application_installation_update(identifier)
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/applications/installations/#{identifier}/update"
        )
        Web::SendRequest.new(request).perform
      end

      # @param identifier [String] Application Identifier
      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.installations.update.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.installations.update.post  Enterprise API Documentation}
      def apply_application_installation_update(identifier, body = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/applications/installations/#{identifier}/update",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.storage.kv.records.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.storage.kv.records.getMany  Enterprise API Documentation}
      def list_application_kv_records(application_identifier, query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/applications/#{application_identifier}/storage/kv/records",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.storage.kv.records.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.storage.kv.records.post  Enterprise API Documentation}
      def add_application_kv_record(application_identifier, body = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/applications/#{application_identifier}/storage/kv/records",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # @param key [String] Key of the record
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.storage.kv.records.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.storage.kv.records.delete  Enterprise API Documentation}
      def delete_application_kv_record(application_identifier, key)
        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/applications/#{application_identifier}/storage/kv/records/#{key}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # @param key [String] Key of the record
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.storage.kv.records.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.storage.kv.records.get  Enterprise API Documentation}
      def get_application_kv_record(application_identifier, key)
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/applications/#{application_identifier}/storage/kv/records/#{key}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param application_identifier [String] Identifier of the application
      # @param key [String] Key of the record
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.applications.storage.kv.records.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.applications.storage.kv.records.patch  Enterprise API Documentation}
      def edit_application_kv_record(application_identifier, key, body = [])
        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/applications/#{application_identifier}/storage/kv/records/#{key}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
