# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Labels
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.labels.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.labels.getMany  Enterprise API Documentation}
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

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.labels.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.labels.post  Enterprise API Documentation}
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

      # @param label_id [Integer] Label Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.labels.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.labels.get  Enterprise API Documentation}
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

      # @param label_id [Integer] Label Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.labels.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.labels.delete  Enterprise API Documentation}
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

      # @param label_id [Integer] Label Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.labels.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.labels.patch  Enterprise API Documentation}
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

      # @param label_id [Integer] Label Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.labels.strings.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.labels.strings.post  Enterprise API Documentation}
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

      # @param label_id [Integer] Label Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.labels.strings.deleteMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.labels.strings.deleteMany  Enterprise API Documentation}
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

      # @param label_id [Integer] Label Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.labels.screenshots.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.labels.screenshots.post  Enterprise API Documentation}
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

      # @param label_id [Integer] Label Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.labels.screenshots.deleteMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.labels.screenshots.deleteMany  Enterprise API Documentation}
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
