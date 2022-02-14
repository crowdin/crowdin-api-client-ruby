# frozen_string_literal: true

module Crowdin
  module ApiResources
    module StringComments
      def list_string_comments(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/comments",
          query
        )

        request.perform
      end

      def add_string_comment(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/comments",
          query
        )

        request.perform
      end

      def get_string_comment(string_comment_id = nil, project_id = config.project_id)
        string_comment_id || raise_parameter_is_required_error(:string_comment_id)
        project_id        || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/comments/#{string_comment_id}"
        )

        request.perform
      end

      def delete_string_comment(string_comment_id = nil, project_id = config.project_id)
        string_comment_id || raise_parameter_is_required_error(:string_comment_id)
        project_id        || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}/comments/#{string_comment_id}"
        )

        request.perform
      end

      def edit_string_comment(string_comment_id = nil, query = {}, project_id = config.project_id)
        string_comment_id || raise_parameter_is_required_error(:string_comment_id)
        project_id        || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :patch,
          "/projects/#{project_id}/comments/#{string_comment_id}",
          query
        )

        request.perform
      end
    end
  end
end
