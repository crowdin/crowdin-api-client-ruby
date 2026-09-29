# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Projects
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.getMany  Enterprise API Documentation}
      def list_projects(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.post  Enterprise API Documentation}
      def add_project(query = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.get  Enterprise API Documentation}
      def get_project(project_id = nil)
        project_id || raise_parameter_is_required_error(:project_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.delete  Enterprise API Documentation}
      def delete_project(project_id = nil)
        project_id || raise_parameter_is_required_error(:project_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.patch  Enterprise API Documentation}
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

      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.strings-exporter-settings.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.strings-exporter-settings.getMany  Enterprise API Documentation}
      def list_project_strings_exporter_settings(project_id = nil)
        project_id || raise_parameter_is_required_error(:project_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/strings-exporter-settings"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.strings-exporter-settings.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.strings-exporter-settings.post  Enterprise API Documentation}
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

      # @param system_strings_exporter_settings_id [Integer] System strings exporter Settings Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.strings-exporter-settings.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.strings-exporter-settings.get  Enterprise API Documentation}
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

      # @param system_strings_exporter_settings_id [Integer] System strings exporter Settings Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.strings-exporter-settings.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.strings-exporter-settings.delete  Enterprise API Documentation}
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

      # @param system_strings_exporter_settings_id [Integer] System strings exporter Settings Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.strings-exporter-settings.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.strings-exporter-settings.patch  Enterprise API Documentation}
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

      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.file-format-settings.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.file-format-settings.getMany  Enterprise API Documentation}
      def list_project_file_format_settings(project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/file-format-settings"
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.file-format-settings.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.file-format-settings.post  Enterprise API Documentation}
      def add_project_file_format_settings(body = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/file-format-settings",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param file_format_settings_id [Integer] File Format Settings Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.file-format-settings.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.file-format-settings.delete  Enterprise API Documentation}
      def delete_project_file_format_settings(file_format_settings_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/file-format-settings/#{file_format_settings_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param file_format_settings_id [Integer] File Format Settings Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.file-format-settings.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.file-format-settings.get  Enterprise API Documentation}
      def get_project_file_format_settings(file_format_settings_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/file-format-settings/#{file_format_settings_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param file_format_settings_id [Integer] File Format Settings Identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.file-format-settings.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.file-format-settings.patch  Enterprise API Documentation}
      def edit_project_file_format_settings(file_format_settings_id, body = [], project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/file-format-settings/#{file_format_settings_id}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param file_format_settings_id [Integer] File Format Settings Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.file-format-settings.custom-segmentations.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.file-format-settings.custom-segmentations.delete  Enterprise API Documentation}
      def reset_project_file_format_settings_custom_segmentation(file_format_settings_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        endpoint = "projects/#{project_id}/file-format-settings/#{file_format_settings_id}/custom-segmentations"
        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param file_format_settings_id [Integer] File Format Settings Identifier
      # @param destination [String] Destination of File
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.file-format-settings.custom-segmentations.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.file-format-settings.custom-segmentations.get  Enterprise API Documentation}
      def download_project_file_format_settings_custom_segmentation(file_format_settings_id, destination = nil,
                                                                    project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        endpoint = "projects/#{project_id}/file-format-settings/#{file_format_settings_id}/custom-segmentations"
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request, destination).perform
      end

      # -- For Enterprise mode only --

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.groups.getMany  Enterprise API Documentation}
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
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.groups.post  Enterprise API Documentation}
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

      # @param group_id [Integer] Group Identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.groups.get  Enterprise API Documentation}
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

      # @param group_id [Integer] Group Identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.groups.delete  Enterprise API Documentation}
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

      # @param group_id [Integer] Group Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.groups.patch  Enterprise API Documentation}
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
