# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Labels
      def list_lables(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/labels",
          query
        )

        request.perform
      end

      def add_label(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/labels",
          query
        )

        request.perform
      end

      def get_label(label_id = nil, project_id = config.project_id)
        label_id   || raise_parameter_is_required_error(:label_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/labels/#{label_id}"
        )

        request.perform
      end

      def delete_label(label_id = nil, project_id = config.project_id)
        label_id   || raise_parameter_is_required_error(:label_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}/labels/#{label_id}"
        )

        request.perform
      end

      def edit_label(label_id = nil, query = {}, project_id = config.project_id)
        label_id   || raise_parameter_is_required_error(:label_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :patch,
          "/projects/#{project_id}/labels/#{label_id}",
          query
        )

        request.perform
      end

      def assign_label_to_strings(label_id = nil, query = {}, project_id = config.project_id)
        label_id   || raise_parameter_is_required_error(:label_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/labels/#{label_id}/strings",
          query
        )

        request.perform
      end

      # For now Rest Client Resource aren't support payload for DELETE requests.
      # So we have workaround through Rest Client Execute for this case
      def unassign_label_from_strings(label_id = nil, query = {}, project_id = config.project_id)
        # label_id   || raise_parameter_is_required_error(:label_id)
        # project_id || raise_project_id_is_required_error
        #
        # request = Web::Request.new(
        #   self,
        #   :delete,
        #   "/projects/#{project_id}/labels/#{label_id}",
        #   query
        # )
        #
        # request.perform

        response = ::RestClient::Request.execute(
          {
            method: :delete,
            url: config.base_url + config.target_api_url + "/projects/#{project_id}/labels/#{label_id}",
            payload: query.to_json
          }.merge(@options)
        )

        begin
          JSON.parse(response)
        rescue
          {}
        end
      end
    end
  end
end
