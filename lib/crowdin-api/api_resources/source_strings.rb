# frozen_string_literal: true

module Crowdin
  module ApiResources
    module SourceStrings
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
    end
  end
end
