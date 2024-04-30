# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Labels
      def list_labels(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/labels",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def add_label(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/labels",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def get_label(label_id = nil, project_id = config.project_id)
        label_id   || raise_parameter_is_required_error(:label_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/labels/#{label_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def delete_label(label_id = nil, project_id = config.project_id)
        label_id   || raise_parameter_is_required_error(:label_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/labels/#{label_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def edit_label(label_id = nil, query = {}, project_id = config.project_id)
        label_id   || raise_parameter_is_required_error(:label_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/labels/#{label_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def assign_label_to_strings(label_id = nil, query = {}, project_id = config.project_id)
        label_id   || raise_parameter_is_required_error(:label_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/labels/#{label_id}/strings",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def unassign_label_from_strings(label_id = nil, query = {}, project_id = config.project_id)
        label_id   || raise_parameter_is_required_error(:label_id)
        project_id || raise_project_id_is_required_error

        response = ::RestClient::Request.execute(
          {
            method: :delete,
            url: config.base_url + config.target_api_url + "/projects/#{project_id}/labels/#{label_id}/strings",
            payload: query.to_json
          }.merge(@options)
        )

        response.body.empty? ? response.code : JSON.parse(response.body)
      rescue StandardError => e
        e.message
      end

      def assign_label_to_screenshots(label_id = nil, query = {}, project_id = config.project_id)
        label_id   || raise_parameter_is_required_error(:label_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/labels/#{label_id}/screenshots",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def unassign_label_from_screenshots(label_id = nil, query = {}, project_id = config.project_id)
        label_id   || raise_parameter_is_required_error(:label_id)
        project_id || raise_project_id_is_required_error

        response = ::RestClient::Request.execute(
          {
            method: :delete,
            url: config.base_url + config.target_api_url + "/projects/#{project_id}/labels/#{label_id}/screenshots",
            payload: query.to_json
          }.merge(@options)
        )

        response.body.empty? ? response.code : JSON.parse(response.body)
      rescue StandardError => e
        e.message
      end
    end
  end
end
