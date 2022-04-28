# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Projects
      def list_projects(query = {})
        request = Web::Request.new(
          self,
          :get,
          '/projects',
          query
        )

        request.perform
      end

      def add_project(query = {})
        request = Web::Request.new(
          self,
          :post,
          '/projects',
          query
        )

        request.perform
      end

      def get_project(project_id = nil)
        project_id || raise_parameter_is_required_error(:project_id)

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}"
        )

        request.perform
      end

      def delete_project(project_id = nil)
        project_id || raise_parameter_is_required_error(:project_id)

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}"
        )

        request.perform
      end

      #
      # Edit project.
      #
      # === Parameters
      #
      # * +:projectId+ [Integer] - Project Identifier. Get via list_projects. Can be initialized with the Crowdin Client
      # * +:value+ [String] - String or Array of strings.
      # * +:op+ [String] - Path operation to perform.
      # * +:projectId+ [String <json-pointer>] - Enum, for instance '/name'. Full list you can see on the developers site.
      #
      # === Example
      #
      #  crowdin.edit_project(project_id, [{ op: 'replace', path: '/name', value: 'your_new_project_name' }])
      #
      def edit_project(project_id = nil, query = {})
        project_id || raise_parameter_is_required_error(:project_id)

        request = Web::Request.new(
          self,
          :patch,
          "/projects/#{project_id}",
          query
        )

        request.perform
      end

      # -- For Enterprise mode only --

      def list_groups(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          self,
          :get,
          '/groups',
          query
        )

        request.perform
      end

      def add_group(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          self,
          :post,
          '/groups',
          query
        )

        request.perform
      end

      def get_group(group_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        group_id                || raise_parameter_is_required_error(:group_id)

        request = Web::Request.new(
          self,
          :get,
          "/groups/#{group_id}"
        )

        request.perform
      end

      def delete_group(group_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        group_id                || raise_parameter_is_required_error(:group_id)

        request = Web::Request.new(
          self,
          :delete,
          "/groups/#{group_id}"
        )

        request.perform
      end

      def edit_group(group_id = nil, query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error
        group_id                || raise_parameter_is_required_error(:group_id)

        request = Web::Request.new(
          self,
          :patch,
          "/groups/#{group_id}",
          query
        )

        request.perform
      end
    end
  end
end
