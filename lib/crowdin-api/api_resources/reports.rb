# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Reports
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.reports.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.reports.post  Enterprise API Documentation}
      def generate_report(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/reports",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param report_id [String] Report Identifier, consists of 36 characters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.reports.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.reports.get  Enterprise API Documentation}
      def check_report_generation_status(report_id = nil, project_id = config.project_id)
        report_id  || raise_parameter_is_required_error(:report_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/reports/#{report_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param report_id [String] Report Identifier, consists of 36 characters
      # @param destination [String] Destination of File
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.reports.download.download  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.reports.download.download  Enterprise API Documentation}
      def download_report(report_id = nil, destination = nil, project_id = config.project_id)
        report_id  || raise_parameter_is_required_error(:report_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/reports/#{report_id}/download"
        )
        Web::SendRequest.new(request, destination).perform
      end

      # @param query [Hash] Request Query Parameters
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.reports.archives.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.reports.archives.getMany  Enterprise API Documentation}
      def list_report_archives(query = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'reports/archives'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param archive_id [Integer] Report archive identifier
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.reports.archives.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.reports.archives.delete  Enterprise API Documentation}
      def delete_report_archive(archive_id, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "reports/archives/#{archive_id}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param archive_id [Integer] Report archive identifier
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.reports.archives.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.reports.archives.get  Enterprise API Documentation}
      def get_report_archive(archive_id, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "reports/archives/#{archive_id}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param archive_id [Integer] Report archive identifier
      # @param body [Hash] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.reports.archives.exports.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.reports.archives.exports.post  Enterprise API Documentation}
      def export_report_archive(archive_id, body = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "reports/archives/#{archive_id}/exports"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param archive_id [Integer] Report archive identifier
      # @param export_id [String] Export Identifier, consists of 36 characters
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.reports.archives.exports.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.reports.archives.exports.get  Enterprise API Documentation}
      def check_report_archive_export_status(archive_id, export_id, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "reports/archives/#{archive_id}/exports/#{export_id}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param archive_id [Integer] Report archive identifier
      # @param export_id [String] Export Identifier, consists of 36 characters
      # @param destination [String] Destination of File
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.reports.archives.exports.download.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.reports.archives.exports.download.get  Enterprise API Documentation}
      def download_report_archive(archive_id, export_id, destination = nil, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "reports/archives/#{archive_id}/exports/#{export_id}/download"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request, destination).perform
      end

      # @param user_id [Integer] User Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.reports.settings-templates.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.users.reports.settings-templates.getMany  Enterprise API Documentation}
      def list_user_report_settings_templates(user_id, query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/users/#{user_id}/reports/settings-templates",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param user_id [Integer] User Identifier
      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.reports.settings-templates.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.users.reports.settings-templates.post  Enterprise API Documentation}
      def add_user_report_settings_template(user_id, body = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/users/#{user_id}/reports/settings-templates",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param user_id [Integer] User Identifier
      # @param report_settings_template_id [Integer] Report Settings Template Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.reports.settings-templates.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.users.reports.settings-templates.delete  Enterprise API Documentation}
      def delete_user_report_settings_template(user_id, report_settings_template_id)
        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/users/#{user_id}/reports/settings-templates/#{report_settings_template_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param user_id [Integer] User Identifier
      # @param report_settings_template_id [Integer] Report Settings Template Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.reports.settings-templates.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.users.reports.settings-templates.get  Enterprise API Documentation}
      def get_user_report_settings_template(user_id, report_settings_template_id)
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/users/#{user_id}/reports/settings-templates/#{report_settings_template_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param user_id [Integer] User Identifier
      # @param report_settings_template_id [Integer] Report Settings Template Identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.reports.settings-templates.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.users.reports.settings-templates.patch  Enterprise API Documentation}
      def edit_user_report_settings_template(user_id, report_settings_template_id, body = [])
        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/users/#{user_id}/reports/settings-templates/#{report_settings_template_id}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.reports.settings-templates.getMany  API Documentation}
      def list_report_settings_templates(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/reports/settings-templates",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.reports.settings-templates.post  API Documentation}
      def add_report_settings_template(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error
        %i[name currency unit mode config].each do |param|
          query[param] || raise_parameter_is_required_error(param)
        end

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/reports/settings-templates",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param template_id [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.reports.settings-templates.get  API Documentation}
      def get_report_settings_template(template_id = nil, project_id = config.project_id)
        project_id || raise_project_id_is_required_error
        template_id || raise_parameter_is_required_error(:template_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/reports/settings-templates/#{template_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # @param template_id [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.reports.settings-templates.patch  API Documentation}
      def edit_report_settings_template(query = {}, template_id = nil, project_id = config.project_id)
        project_id || raise_project_id_is_required_error
        template_id || raise_parameter_is_required_error(:template_id)

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/reports/settings-templates/#{template_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param template_id [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.reports.settings-templates.delete  API Documentation}
      def delete_report_settings_template(template_id = nil, project_id = config.project_id)
        project_id || raise_project_id_is_required_error
        template_id || raise_parameter_is_required_error(:template_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/reports/settings-templates/#{template_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # -- For Enterprise mode only --

      # @param group_id [Integer] Group Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.groups.reports.post  Enterprise API Documentation}
      def generate_group_report(group_id = nil, query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error
        group_id         || raise_parameter_is_required_error(:group_id)

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/groups/#{group_id}/reports",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param group_id [Integer] Group Identifier
      # @param report_id [String] Report Identifier, consists of 36 characters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.groups.reports.get  Enterprise API Documentation}
      def check_group_report_generation_status(group_id = nil, report_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        group_id         || raise_parameter_is_required_error(:group_id)
        report_id        || raise_parameter_is_required_error(:report_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/groups/#{group_id}/reports/#{report_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param group_id [Integer] Group Identifier
      # @param report_id [String] Report Identifier, consists of 36 characters
      # @param destination [String] Destination of File
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.groups.reports.download.download  Enterprise API Documentation}
      def download_group_report(group_id = nil, report_id = nil, destination = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        group_id         || raise_parameter_is_required_error(:group_id)
        report_id        || raise_parameter_is_required_error(:report_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/groups/#{group_id}/reports/#{report_id}/download"
        )
        Web::SendRequest.new(request, destination).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.reports.post  Enterprise API Documentation}
      def generate_organization_report(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/reports",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param report_id [String] Report Identifier, consists of 36 characters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.reports.get  Enterprise API Documentation}
      def check_organization_report_generation_status(report_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        report_id        || raise_parameter_is_required_error(:report_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/reports/#{report_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param report_id [String] Report Identifier, consists of 36 characters
      # @param destination [String] Destination of File
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.reports.download.download  Enterprise API Documentation}
      def download_organization_report(report_id = nil, destination = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        report_id        || raise_parameter_is_required_error(:report_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/reports/#{report_id}/download"
        )
        Web::SendRequest.new(request, destination).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.reports.settings-templates.getMany  Enterprise API Documentation}
      def list_organization_report_settings_templates(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/reports/settings-templates",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.reports.settings-templates.post  Enterprise API Documentation}
      def add_organization_report_settings_template(body = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/reports/settings-templates",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param report_settings_template_id [Integer] Report Settings Template Identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.reports.settings-templates.delete  Enterprise API Documentation}
      def delete_organization_report_settings_template(report_settings_template_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/reports/settings-templates/#{report_settings_template_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param report_settings_template_id [Integer] Report Settings Template Identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.reports.settings-templates.get  Enterprise API Documentation}
      def get_organization_report_settings_template(report_settings_template_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/reports/settings-templates/#{report_settings_template_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param report_settings_template_id [Integer] Report Settings Template Identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.reports.settings-templates.patch  Enterprise API Documentation}
      def edit_organization_report_settings_template(report_settings_template_id, body = [])
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/reports/settings-templates/#{report_settings_template_id}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
