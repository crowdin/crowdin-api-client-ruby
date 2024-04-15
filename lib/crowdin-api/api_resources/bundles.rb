# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Bundles
      # @param query [Hash] Request Body
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.bundles.getMany  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.bundles.getMany  Enterprise API Documentation}
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

      # @param query [Hash] Request Body
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.bundles.post  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.bundles.post  Enterprise API Documentation}
      def add_bundle(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error
        %i[name format sourcePatterns exportPattern].each do |param|
          query[param] || raise_parameter_is_required_error(param)
        end

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/bundles",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param bundle_id [Integer] Bundle ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.bundles.exports.post  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.bundles.exports.post  Enterprise API Documentation}
      def export_bundle(bundle_id, project_id = config.project_id)
        bundle_id  || raise_parameter_is_required_error(:bundle_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/bundles/#{bundle_id}/exports"
        )
        Web::SendRequest.new(request).perform
      end

      # @param bundle_id [Integer] Bundle ID
      # @param export_id [String] Export ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.bundles.exports.get  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.bundles.exports.get  Enterprise API Documentation}
      def check_bundle_export_status(bundle_id, export_id, project_id = config.project_id)
        bundle_id || raise_parameter_is_required_error(:bundle_id)
        export_id || raise_parameter_is_required_error(:export_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/bundles/#{bundle_id}/exports/#{export_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param bundle_id [Integer] Bundle ID
      # @param export_id [String] Export ID
      # @param destination [String] Destination of File
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.bundles.exports.download.get  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.bundles.exports.download.get  Enterprise API Documentation}
      def download_bundle(bundle_id, export_id, destination = nil, project_id = config.project_id)
        bundle_id  || raise_parameter_is_required_error(:bundle_id)
        export_id  || raise_parameter_is_required_error(:export_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/bundles/#{bundle_id}/exports/#{export_id}/download"
        )
        Web::SendRequest.new(request, destination).perform
      end

      # @param bundle_id [Integer] Bundle ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.bundles.get  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.bundles.get  Enterprise API Documentation}
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

      # @param bundle_id [Integer] Bundle ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.bundles.delete  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.bundles.delete  Enterprise API Documentation}
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

      # @param bundle_id [Integer] Bundle ID
      # @param query [Hash] Request Body
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.bundles.patch  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.bundles.patch  Enterprise API Documentation}
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

      # @param bundle_id [Integer] Bundle ID
      # @param query [Hash] Request Body
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.bundles.files.getMany  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.bundles.files.getMany  Enterprise API Documentation}
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
