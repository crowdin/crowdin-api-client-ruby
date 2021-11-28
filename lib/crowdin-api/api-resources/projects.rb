# frozen_string_literal: true

module Crowdin
  module API
    module Projects
      def list_projects(query = {})
        request = Web::Request.new(
          self,
          :get,
          '/projects',
          query
        )

        request.process_request!
        request.process_response!
      end

      def add_project(query = {})
        request = Web::Request.new(
          self,
          :post,
          '/projects',
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_project(project_id = nil)
        project_id || raise(ArgumentError, ':project_id is required')

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}"
        )

        request.process_request!
        request.process_response!
      end

      def delete_project(project_id = nil)
        project_id || raise(ArgumentError, ':project_id is required')

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}"
        )

        request.process_request!
        request.process_response!
      end

      def edit_project(project_id = nil, query = {})
        project_id || raise(ArgumentError, ':project_id is required')

        request = Web::Request.new(
          self,
          :patch,
          "/projects/#{project_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

      # For Enterprise API only

      def list_groups(query = {})
        request = Web::Request.new(
          self,
          :get,
          '/groups',
          query
        )

        request.process_request!
        request.process_response!
      end

      def add_group(query = {})
        request = Web::Request.new(
          self,
          :post,
          '/groups',
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_group(group_id = nil)
        group_id || raise(ArgumentError, ':group_id is required')

        request = Web::Request.new(
          self,
          :get,
          "/groups/#{group_id}"
        )

        request.process_request!
        request.process_response!
      end

      def delete_group(group_id = nil)
        group_id || raise(ArgumentError, ':group_id is required')

        request = Web::Request.new(
          self,
          :delete,
          "/groups/#{group_id}"
        )

        request.process_request!
        request.process_response!
      end

      def edit_group(group_id = nil, query = {})
        group_id || raise(ArgumentError, ':group_id is required')

        request = Web::Request.new(
          self,
          :patch,
          "/groups/#{group_id}",
          query
        )

        request.process_request!
        request.process_response!
      end
    end
  end
end
