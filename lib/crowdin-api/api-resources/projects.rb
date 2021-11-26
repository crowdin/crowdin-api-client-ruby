module Crowdin
  module API
    module Projects

      def list_projects(query={})
        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects",
          query
        )

        request.process_request!
        request.process_response!
      end

      def add_project(query={})
        request = Web::Request.new(
          @connection,
          :post,
          "#{@target_api_url}/projects",
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_project(project_id=nil)
        project_id || raise(ArgumentError, ':project_id is required')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}"
        )

        request.process_request!
        request.process_response!
      end

      def delete_project(project_id=nil)
        project_id || raise(ArgumentError, ':project_id is required')

        request = Web::Request.new(
          @connection,
          :delete,
          "#{@target_api_url}/projects/#{project_id}"
        )

        request.process_request!
        request.process_response!
      end

      def edit_project(project_id=nil, query={})
        project_id || raise(ArgumentError, ':project_id is required')

        request = Web::Request.new(
          @connection,
          :patch,
          "#{@target_api_url}/projects/#{project_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

      # For Enterprise API only

      def list_groups(query={})
        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/groups",
          query
        )

        request.process_request!
        request.process_response!
      end

      def add_group(query={})
        request = Web::Request.new(
          @connection,
          :post,
          "#{@target_api_url}/groups",
          query
        )

        request.process_request!
        request.process_response!
      end

      def get_group(group_id=nil)
        group_id || raise(ArgumentError, ':group_id is required')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/groups/#{group_id}"
        )

        request.process_request!
        request.process_response!
      end

      def delete_group(group_id=nil)
        group_id || raise(ArgumentError, ':group_id is required')

        request = Web::Request.new(
          @connection,
          :delete,
          "#{@target_api_url}/groups/#{group_id}"
        )

        request.process_request!
        request.process_response!
      end

      def edit_group(group_id=nil, query={})
        group_id || raise(ArgumentError, ':group_id is required')

        request = Web::Request.new(
          @connection,
          :patch,
          "#{@target_api_url}/groups/#{group_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

    end
  end
end
