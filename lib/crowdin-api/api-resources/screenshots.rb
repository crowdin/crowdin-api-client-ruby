# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Screenshots
      def list_screenshots(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/screenshots",
          query
        )

        request.perform
      end

      def add_screenshot(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/screenshots",
          query
        )

        request.perform
      end

      def get_screenshot(screenshot_id = nil, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/screenshots/#{screenshot_id}"
        )

        request.perform
      end

      def update_screenshot(screenshot_id = nil, query = {}, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :put,
          "/projects/#{project_id}/screenshots/#{screenshot_id}",
          query
        )

        request.perform
      end

      def delete_screenshot(screenshot_id = nil, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}/screenshots/#{screenshot_id}"
        )

        request.perform
      end

      def edit_screenshot(screenshot_id = nil, query = {}, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :patch,
          "/projects/#{project_id}/screenshots/#{screenshot_id}",
          query
        )

        request.perform
      end

      def list_tags(screenshot_id = nil, query = {}, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/screenshots/#{screenshot_id}/tags",
          query
        )

        request.perform
      end

      # Auto tag
      def replace_tags(screenshot_id = nil, query = {}, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :put,
          "/projects/#{project_id}/screenshots/#{screenshot_id}/tags",
          query
        )

        request.perform
      end

      def add_tag(screenshot_id = nil, query = {}, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/screenshots/#{screenshot_id}/tags",
          query
        )

        request.perform
      end

      def clear_tags(screenshot_id = nil, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}/screenshots/#{screenshot_id}/tags"
        )

        request.perform
      end

      def get_tag(screenshot_id = nil, tag_id = nil, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        tag_id        || raise_parameter_is_required_error(:tag_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/screenshots/#{screenshot_id}/tags/#{tag_id}"
        )

        request.perform
      end

      def delete_tag(screenshot_id = nil, tag_id = nil, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        tag_id        || raise_parameter_is_required_error(:tag_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}/screenshots/#{screenshot_id}/tags/#{tag_id}"
        )

        request.perform
      end

      def edit_tag(screenshot_id = nil, tag_id = nil, query = {}, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        tag_id        || raise_parameter_is_required_error(:tag_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :patch,
          "/projects/#{project_id}/screenshots/#{screenshot_id}/tags/#{tag_id}",
          query
        )

        request.perform
      end
    end
  end
end
