# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Tasks
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

      def list_user_tasks(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/user/tasks",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

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
    end
  end
end
