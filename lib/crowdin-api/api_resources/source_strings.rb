# frozen_string_literal: true

module Crowdin
  module ApiResources
    module SourceStrings
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.strings.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.strings.getMany  Enterprise API Documentation}
      def list_strings(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/strings",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.strings.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.strings.post  Enterprise API Documentation}
      def add_string(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/strings",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param string_id [Integer] String Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.strings.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.strings.get  Enterprise API Documentation}
      def get_string(string_id = nil, query = {}, project_id = config.project_id)
        string_id  || raise_parameter_is_required_error(:string_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/strings/#{string_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param string_id [Integer] String Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.strings.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.strings.delete  Enterprise API Documentation}
      def delete_string(string_id = nil, project_id = config.project_id)
        string_id  || raise_parameter_is_required_error(:string_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/strings/#{string_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param string_id [Integer] String Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.strings.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.strings.patch  Enterprise API Documentation}
      def edit_string(string_id = nil, query = {}, project_id = config.project_id)
        string_id  || raise_parameter_is_required_error(:string_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/strings/#{string_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.strings.batchPatch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.strings.batchPatch  Enterprise API Documentation}
      def string_batch_operations(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/strings",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/string-based/#operation/api.projects.strings.uploads.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/string-based/#operation/api.projects.strings.uploads.post  Enterprise API Documentation}
      def upload_strings(body = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/strings/uploads",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param upload_id [String] Upload Strings Identifier, consists of 36 characters
      # * {https://support.crowdin.com/developer/api/v2/string-based/#operation/api.projects.strings.uploads.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/string-based/#operation/api.projects.strings.uploads.get  Enterprise API Documentation}
      def upload_strings_status(upload_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/strings/uploads/#{upload_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.strings.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.strings.getMany  Enterprise API Documentation}
      def search_strings(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/strings",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
