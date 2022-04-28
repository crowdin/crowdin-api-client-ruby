# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Reports
      def generate_report(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/reports",
          query
        )

        request.perform
      end

      def check_report_generation_status(report_id = nil, project_id = config.project_id)
        report_id  || raise_parameter_is_required_error(:report_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/reports/#{report_id}"
        )

        request.perform
      end

      def download_report(report_id = nil, destination = nil, project_id = config.project_id)
        report_id  || raise_parameter_is_required_error(:report_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/reports/#{report_id}/download",
          {},
          {},
          destination
        )

        request.perform
      end

      # -- For Enterprise mode only --

      def generate_group_report(group_id = nil, query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error
        group_id                || raise_parameter_is_required_error(:group_id)

        request = Web::Request.new(
          self,
          :post,
          "/groups/#{group_id}/reports",
          query
        )

        request.perform
      end

      def check_group_report_generation_status(group_id = nil, report_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        group_id                || raise_parameter_is_required_error(:group_id)
        report_id               || raise_parameter_is_required_error(:report_id)

        request = Web::Request.new(
          self,
          :get,
          "/groups/#{group_id}/reports/#{report_id}"
        )

        request.perform
      end

      def download_group_report(group_id = nil, report_id = nil, destination = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        group_id                || raise_parameter_is_required_error(:group_id)
        report_id               || raise_parameter_is_required_error(:report_id)

        request = Web::Request.new(
          self,
          :get,
          "/groups/#{group_id}/reports/#{report_id}/download",
          {},
          {},
          destination
        )

        request.perform
      end

      def generate_organization_report(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          self,
          :post,
          '/reports',
          query
        )

        request.perform
      end

      def check_organization_report_generation_status(report_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        report_id               || raise_parameter_is_required_error(:report_id)

        request = Web::Request.new(
          self,
          :get,
          "/reports/#{report_id}"
        )

        request.perform
      end

      def download_organization_report(report_id = nil, destination = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        report_id               || raise_parameter_is_required_error(:report_id)

        request = Web::Request.new(
          self,
          :get,
          "/reports/#{report_id}/download",
          {},
          {},
          destination
        )

        request.perform
      end
    end
  end
end
