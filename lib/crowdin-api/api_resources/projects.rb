# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Projects
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.getMany  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.getMany  Enterprise API Documentation}
      # @param query [Hash] Request Body
      def list_projects(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.post  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.post  Enterprise API Documentation}
      # @param query [Hash] Request Body
      def add_project(query = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.get  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.get  Enterprise API Documentation}
      # @param project_id [Integer] Project ID
      def get_project(project_id = nil)
        project_id || raise_parameter_is_required_error(:project_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.delete  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.delete  Enterprise API Documentation}
      # @param project_id [Integer] Project ID
      def delete_project(project_id = nil)
        project_id || raise_parameter_is_required_error(:project_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param project_id [Integer] Project ID
      # @param query [Hash] Request Body
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.patch  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.patch  Enterprise API Documentation}
      def edit_project(project_id = nil, query = {})
        project_id || raise_parameter_is_required_error(:project_id)

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param project_id [Integer] Project ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.strings-exporter-settings.getMany  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.strings-exporter-settings.getMany  Enterprise API Documentation}
      def list_project_strings_exporter_settings(project_id = nil)
        project_id || raise_parameter_is_required_error(:project_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/strings-exporter-settings"
        )
        Web::SendRequest.new(request).perform
      end

      # @param project_id [Integer] Project ID
      # @param query [Hash] Request Body
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.strings-exporter-settings.post  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.strings-exporter-settings.post  Enterprise API Documentation}
      def add_project_strings_exporter_settings(project_id = nil, query = {})
        project_id || raise_parameter_is_required_error(:project_id)

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/strings-exporter-settings",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param project_id [Integer] Project ID
      # @param system_strings_exporter_settings_id [Integer] Request Body
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.strings-exporter-settings.get  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.strings-exporter-settings.get  Enterprise API Documentation}
      def get_project_strings_exporter_settings(project_id = nil, system_strings_exporter_settings_id = nil)
        project_id || raise_parameter_is_required_error(:project_id)
        system_strings_exporter_settings_id || raise_parameter_is_required_error(:system_strings_exporter_settings_id)

        path = "projects/#{project_id}/strings-exporter-settings/#{system_strings_exporter_settings_id}"
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{path}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param project_id [Integer] Project ID
      # @param system_strings_exporter_settings_id [Integer] Request Body
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.strings-exporter-settings.delete  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.strings-exporter-settings.delete  Enterprise API Documentation}
      def delete_project_strings_exporter_settings(project_id = nil, system_strings_exporter_settings_id = nil)
        project_id || raise_parameter_is_required_error(:project_id)
        system_strings_exporter_settings_id || raise_parameter_is_required_error(:system_strings_exporter_settings_id)

        path = "projects/#{project_id}/strings-exporter-settings/#{system_strings_exporter_settings_id}"
        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/#{path}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param project_id [Integer] Project ID
      # @param system_strings_exporter_settings_id [Integer] Request Body
      # @param query [Hash] Request Body
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.strings-exporter-settings.patch  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.strings-exporter-settings.patch  Enterprise API Documentation}
      def edit_project_strings_exporter_settings(project_id = nil, system_strings_exporter_settings_id = nil, query = {})
        project_id || raise_parameter_is_required_error(:project_id)
        system_strings_exporter_settings_id || raise_parameter_is_required_error(:system_strings_exporter_settings_id)

        path = "projects/#{project_id}/strings-exporter-settings/#{system_strings_exporter_settings_id}"
        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/#{path}",
          params: query
        )
        Web::SendRequest.new(request).perform
      end

      # -- For Enterprise mode only --

      # @param query [Hash] Request Body
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.groups.getMany  Enterprise API Documentation}
      def list_groups(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/groups",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.groups.post  Enterprise API Documentation}
      def add_group(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/groups",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param group_id [Integer] Group ID
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.groups.get  Enterprise API Documentation}
      def get_group(group_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        group_id         || raise_parameter_is_required_error(:group_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/groups/#{group_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param group_id [Integer] Group ID
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.groups.delete  Enterprise API Documentation}
      def delete_group(group_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        group_id         || raise_parameter_is_required_error(:group_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/groups/#{group_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param group_id [Integer] Group ID
      # @param query [Hash] Request Body
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.groups.patch  Enterprise API Documentation}
      def edit_group(group_id = nil, query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error
        group_id         || raise_parameter_is_required_error(:group_id)

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/groups/#{group_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
