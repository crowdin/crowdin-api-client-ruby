# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Tasks
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.tasks.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.tasks.getMany  Enterprise API Documentation}
      def list_tasks(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/tasks",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.tasks.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.tasks.post  Enterprise API Documentation}
      def add_task(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/tasks",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param task_id [Integer] Task Identifier
      # @param destination [String] Destination of File
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.tasks.exports.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.tasks.exports.post  Enterprise API Documentation}
      def export_task_strings(task_id = nil, destination = nil, project_id = config.project_id)
        task_id    || raise_parameter_is_required_error(:task_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/tasks/#{task_id}/exports"
        )
        Web::SendRequest.new(request, destination).perform
      end

      # @param task_id [Integer] Task Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.tasks.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.tasks.get  Enterprise API Documentation}
      def get_task(task_id = nil, project_id = config.project_id)
        task_id    || raise_parameter_is_required_error(:task_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/tasks/#{task_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param task_id [Integer] Task Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.tasks.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.tasks.delete  Enterprise API Documentation}
      def delete_task(task_id = nil, project_id = config.project_id)
        task_id    || raise_parameter_is_required_error(:task_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/tasks/#{task_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param task_id [Integer] Task Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.tasks.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.tasks.patch  Enterprise API Documentation}
      def edit_task(task_id = nil, query = {}, project_id = config.project_id)
        task_id    || raise_parameter_is_required_error(:task_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/tasks/#{task_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.user.tasks.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.user.tasks.getMany  Enterprise API Documentation}
      def list_user_tasks(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/user/tasks",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param task_id [Integer] Task Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.user.tasks.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.user.tasks.patch  Enterprise API Documentation}
      def edit_task_archived_status(task_id = nil, query = {})
        task_id || raise_parameter_is_required_error(:task_id)

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/user/tasks/#{task_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param task_id [Integer] Task Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.tasks.comments.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.tasks.comments.getMany  Enterprise API Documentation}
      def list_task_comments(task_id = nil, query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error
        task_id    || raise_parameter_is_required_error(:task_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/tasks/#{task_id}/comments",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param task_id [Integer] Task Identifier
      # @param comment_id [Integer] Unique identifier for the task comment
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.tasks.comments.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.tasks.comments.get  Enterprise API Documentation}
      def get_task_comment(task_id = nil, comment_id = nil, project_id = config.project_id)
        project_id || raise_project_id_is_required_error
        task_id    || raise_parameter_is_required_error(:task_id)
        comment_id || raise_parameter_is_required_error(:comment_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/tasks/#{task_id}/comments/#{comment_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param task_id [Integer] Task Identifier
      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.tasks.comments.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.tasks.comments.post  Enterprise API Documentation}
      def add_task_comment(task_id = nil, body = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error
        task_id    || raise_parameter_is_required_error(:task_id)

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/tasks/#{task_id}/comments",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param task_id [Integer] Task Identifier
      # @param comment_id [Integer] Unique identifier for the task comment
      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.tasks.comments.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.tasks.comments.patch  Enterprise API Documentation}
      def edit_task_comment(task_id = nil, comment_id = nil, body = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error
        task_id    || raise_parameter_is_required_error(:task_id)
        comment_id || raise_parameter_is_required_error(:comment_id)

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/tasks/#{task_id}/comments/#{comment_id}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param task_id [Integer] Task Identifier
      # @param comment_id [Integer] Unique identifier for the task comment
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.tasks.comments.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.tasks.comments.delete  Enterprise API Documentation}
      def delete_task_comment(task_id = nil, comment_id = nil, project_id = config.project_id)
        project_id || raise_project_id_is_required_error
        task_id    || raise_parameter_is_required_error(:task_id)
        comment_id || raise_parameter_is_required_error(:comment_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/tasks/#{task_id}/comments/#{comment_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.tasks.settings-templates.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.tasks.settings-templates.getMany  Enterprise API Documentation}
      def list_project_task_settings_templates(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/tasks/settings-templates",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.tasks.settings-templates.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.tasks.settings-templates.post  Enterprise API Documentation}
      def add_project_task_settings_template(body = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/tasks/settings-templates",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param task_settings_template_id [Integer] Task Settings Template Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.tasks.settings-templates.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.tasks.settings-templates.delete  Enterprise API Documentation}
      def delete_project_task_settings_template(task_settings_template_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/tasks/settings-templates/#{task_settings_template_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param task_settings_template_id [Integer] Task Settings Template Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.tasks.settings-templates.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.tasks.settings-templates.get  Enterprise API Documentation}
      def get_project_task_settings_template(task_settings_template_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/tasks/settings-templates/#{task_settings_template_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param task_settings_template_id [Integer] Task Settings Template Identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.tasks.settings-templates.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.tasks.settings-templates.patch  Enterprise API Documentation}
      def edit_project_task_settings_template(task_settings_template_id, body = [], project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/tasks/settings-templates/#{task_settings_template_id}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.tasks.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tasks.getMany  Enterprise API Documentation}
      def list_specific_user_tasks(query = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'tasks'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
