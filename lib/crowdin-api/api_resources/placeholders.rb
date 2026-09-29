# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Placeholders
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.system-placeholders.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.system-placeholders.getMany  Enterprise API Documentation}
      def list_project_system_placeholders(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/system-placeholders",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.system-placeholders.batchPatch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.system-placeholders.batchPatch  Enterprise API Documentation}
      def project_system_placeholder_batch_operations(body = [], project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/system-placeholders",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # -- For Enterprise mode only --

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.custom-placeholders.getMany  Enterprise API Documentation}
      def list_custom_placeholders(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/custom-placeholders",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.custom-placeholders.post  Enterprise API Documentation}
      def add_custom_placeholder(body = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/custom-placeholders",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param custom_placeholder_id [Integer] Custom Placeholder identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.custom-placeholders.delete  Enterprise API Documentation}
      def delete_custom_placeholder(custom_placeholder_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/custom-placeholders/#{custom_placeholder_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param custom_placeholder_id [Integer] Custom Placeholder identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.custom-placeholders.get  Enterprise API Documentation}
      def get_custom_placeholder(custom_placeholder_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/custom-placeholders/#{custom_placeholder_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param custom_placeholder_id [Integer] Custom Placeholder identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.custom-placeholders.patch  Enterprise API Documentation}
      def edit_custom_placeholder(custom_placeholder_id, body = [])
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/custom-placeholders/#{custom_placeholder_id}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.placeholders.getMany  Enterprise API Documentation}
      def list_project_placeholders(query = {}, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/placeholders",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.placeholders.post  Enterprise API Documentation}
      def add_project_placeholder(body = {}, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/placeholders",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param project_placeholder_id [Integer] Project Placeholder identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.placeholders.delete  Enterprise API Documentation}
      def delete_project_placeholder(project_placeholder_id, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/placeholders/#{project_placeholder_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param project_placeholder_id [Integer] Project Placeholder identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.placeholders.get  Enterprise API Documentation}
      def get_project_placeholder(project_placeholder_id, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/placeholders/#{project_placeholder_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param project_placeholder_id [Integer] Project Placeholder identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.placeholders.patch  Enterprise API Documentation}
      def edit_project_placeholder(project_placeholder_id, body = [], project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/placeholders/#{project_placeholder_id}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
