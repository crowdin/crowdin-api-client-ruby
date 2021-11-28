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
        project_id || raise(ArgumentError, ':project_id is required')

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}"
        )

        request.perform
      end

      def delete_project(project_id = nil)
        project_id || raise(ArgumentError, ':project_id is required')

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}"
        )

        request.perform
      end

      def edit_project(project_id = nil, query = {})
        project_id || raise(ArgumentError, ':project_id is required')

        request = Web::Request.new(
          self,
          :patch,
          "/projects/#{project_id}",
          query
        )

        request.perform
      end

      # For Enterprise API only

      def list_groups(query = {})
        request = Web::Request.new(
          self,
          :get,
          '/groups',
          query
        )

        request.perform
      end

      def add_group(query = {})
        request = Web::Request.new(
          self,
          :post,
          '/groups',
          query
        )

        request.perform
      end

      def get_group(group_id = nil)
        group_id || raise(ArgumentError, ':group_id is required')

        request = Web::Request.new(
          self,
          :get,
          "/groups/#{group_id}"
        )

        request.perform
      end

      def delete_group(group_id = nil)
        group_id || raise(ArgumentError, ':group_id is required')

        request = Web::Request.new(
          self,
          :delete,
          "/groups/#{group_id}"
        )

        request.perform
      end

      def edit_group(group_id = nil, query = {})
        group_id || raise(ArgumentError, ':group_id is required')

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
