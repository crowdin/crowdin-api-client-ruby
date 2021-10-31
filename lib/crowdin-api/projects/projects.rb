module Crowdin
  module API
    module Projects

      def list_projects(query={})
        get_request(
          path: "#{@api_version_url}/projects",
          query: query
        )
      end

      def add_project(query={})
        post_request(
          path: "#{@api_version_url}/projects",
          query: query
        )
      end

      def get_project(project_id, query={})
        get_request(
          path: "#{@api_version_url}/projects/#{project_id}",
          query: query
        )
      end

      def delete_project(project_id, query={})
        delete_request(
          path: "#{@api_version_url}/projects/#{project_id}",
          query: query
        )
      end

      def edit_project(project_id, query={})
        patch_request(
          path: "#{@api_version_url}/projects/#{project_id}",
          query: query
        )
      end

    end
  end
end
