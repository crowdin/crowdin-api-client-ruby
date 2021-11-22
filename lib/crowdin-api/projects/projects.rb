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

      def get_project(project_id)
        project_id || raise(ArgumentError, ":project_id is required")

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

      def delete_project(project_id)
        project_id || raise(ArgumentError, ":project_id is required")

        request = Web::Request.new(
          @connection,
          :delete,
          "#{@target_api_url}/projects/#{project_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

      def edit_project(project_id, query={})
        project_id || raise(ArgumentError, ":project_id is required")

        request = Web::Request.new(
          @connection,
          :patch,
          "#{@target_api_url}/projects/#{project_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

    end
  end
end
