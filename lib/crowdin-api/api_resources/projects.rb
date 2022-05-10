# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Projects
      def list_projects(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def add_project(query = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def get_project(project_id = nil)
        project_id || raise_parameter_is_required_error(:project_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def delete_project(project_id = nil)
        project_id || raise_parameter_is_required_error(:project_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}"
        )
        Web::SendRequest.new(request).perform
      end

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

      # -- For Enterprise mode only --

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
