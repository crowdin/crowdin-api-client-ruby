# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Bundles
      def list_bundles(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/bundles",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def add_bundle(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/bundles",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def get_bundle(bundle_id, project_id = config.project_id)
        bundle_id  || raise_parameter_is_required_error(:bundle_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/bundles/#{bundle_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def delete_bundle(bundle_id, project_id = config.project_id)
        bundle_id  || raise_parameter_is_required_error(:bundle_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/bundles/#{bundle_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def edit_bundle(bundle_id, query = {}, project_id = config.project_id)
        bundle_id  || raise_parameter_is_required_error(:bundle_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/bundles/#{bundle_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def bundle_list_files(bundle_id, query = {}, project_id = config.project_id)
        bundle_id  || raise_parameter_is_required_error(:bundle_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/bundles/#{bundle_id}/files",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
