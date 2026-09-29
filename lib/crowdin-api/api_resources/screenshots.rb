# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Screenshots
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.screenshots.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.screenshots.getMany  Enterprise API Documentation}
      def list_screenshots(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/screenshots",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.screenshots.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.screenshots.post  Enterprise API Documentation}
      def add_screenshot(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/screenshots",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param screenshot_id [Integer] Screenshot Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.screenshots.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.screenshots.get  Enterprise API Documentation}
      def get_screenshot(screenshot_id = nil, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param screenshot_id [Integer] Screenshot Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.screenshots.put  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.screenshots.put  Enterprise API Documentation}
      def update_screenshot(screenshot_id = nil, query = {}, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :put,
          "#{config.target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param screenshot_id [Integer] Screenshot Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.screenshots.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.screenshots.delete  Enterprise API Documentation}
      def delete_screenshot(screenshot_id = nil, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param screenshot_id [Integer] Screenshot Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.screenshots.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.screenshots.patch  Enterprise API Documentation}
      def edit_screenshot(screenshot_id = nil, query = {}, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param screenshot_id [Integer] Screenshot Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.screenshots.tags.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.screenshots.tags.getMany  Enterprise API Documentation}
      def list_tags(screenshot_id = nil, query = {}, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}/tags",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param screenshot_id [Integer] Screenshot Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.screenshots.tags.putMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.screenshots.tags.putMany  Enterprise API Documentation}
      def replace_tags(screenshot_id = nil, query = {}, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :put,
          "#{config.target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}/tags",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param screenshot_id [Integer] Screenshot Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.screenshots.tags.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.screenshots.tags.post  Enterprise API Documentation}
      def add_tag(screenshot_id = nil, query = {}, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}/tags",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param screenshot_id [Integer] Screenshot Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.screenshots.tags.deleteMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.screenshots.tags.deleteMany  Enterprise API Documentation}
      def clear_tags(screenshot_id = nil, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}/tags"
        )
        Web::SendRequest.new(request).perform
      end

      # @param screenshot_id [Integer] Screenshot Identifier
      # @param tag_id [Integer] Tag Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.screenshots.tags.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.screenshots.tags.get  Enterprise API Documentation}
      def get_tag(screenshot_id = nil, tag_id = nil, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        tag_id        || raise_parameter_is_required_error(:tag_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}/tags/#{tag_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param screenshot_id [Integer] Screenshot Identifier
      # @param tag_id [Integer] Tag Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.screenshots.tags.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.screenshots.tags.delete  Enterprise API Documentation}
      def delete_tag(screenshot_id = nil, tag_id = nil, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        tag_id        || raise_parameter_is_required_error(:tag_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}/tags/#{tag_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param screenshot_id [Integer] Screenshot Identifier
      # @param tag_id [Integer] Tag Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.screenshots.tags.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.screenshots.tags.patch  Enterprise API Documentation}
      def edit_tag(screenshot_id = nil, tag_id = nil, query = {}, project_id = config.project_id)
        screenshot_id || raise_parameter_is_required_error(:screenshot_id)
        tag_id        || raise_parameter_is_required_error(:tag_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/screenshots/#{screenshot_id}/tags/#{tag_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
