# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Tasks
      def list_tasks(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/tasks",
          query
        )

        request.perform
      end

      def add_task(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/tasks",
          query
        )

        request.perform
      end

      def export_task_strings(task_id = nil, destination = nil, project_id = config.project_id)
        task_id    || raise_parameter_is_required_error(:task_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/tasks/#{task_id}/exports",
          {},
          {},
          destination
        )

        request.perform
      end

      def get_task(task_id = nil, project_id = config.project_id)
        task_id    || raise_parameter_is_required_error(:task_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/tasks/#{task_id}"
        )

        request.perform
      end

      def delete_task(task_id = nil, project_id = config.project_id)
        task_id    || raise_parameter_is_required_error(:task_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}/tasks/#{task_id}"
        )

        request.perform
      end

      def edit_task(task_id = nil, query = {}, project_id = config.project_id)
        task_id    || raise_parameter_is_required_error(:task_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :patch,
          "/projects/#{project_id}/tasks/#{task_id}",
          query
        )

        request.perform
      end

      def list_user_tasks(query = {})
        request = Web::Request.new(
          self,
          :get,
          '/user/tasks',
          query
        )

        request.perform
      end

      def edit_task_archived_status(task_id = nil, query = {})
        task_id || raise_parameter_is_required_error(:task_id)

        request = Web::Request.new(
          self,
          :get,
          "/user/tasks/#{task_id}",
          query
        )

        request.perform
      end
    end
  end
end
