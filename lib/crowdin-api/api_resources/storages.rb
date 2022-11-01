# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Storages

      # @param query [Hash] Request Body
      # * {https://developer.crowdin.com/api/v2/#operation/api.storages.getMany  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.storages.getMany  Enterprise API Documentation}
      def list_storages(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/storages",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param file [string] File path
      # * {https://developer.crowdin.com/api/v2/#operation/api.storages.post  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.storages.post  Enterprise API Documentation}
      def add_storage(file = nil)
        file || raise_parameter_is_required_error(:file)

        file    = file.is_a?(File) ? file : File.open(file, 'r')
        headers = { 'Content-Type' => 'application/octet-stream', 'Crowdin-API-FileName' => File.basename(file) }

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/storages",
          { params: file, headers: headers }
        )
        Web::SendRequest.new(request).perform
      end

      # @param storage_id [Integer] Storage ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.storages.get  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.storages.get  Enterprise API Documentation}
      def get_storage(storage_id = nil)
        storage_id || raise_parameter_is_required_error(:storage_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/storages/#{storage_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param storage_id [Integer] Storage ID
      # * {https://developer.crowdin.com/api/v2/#operation/api.storages.delete  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.storages.delete  Enterprise API Documentation}
      def delete_storage(storage_id = nil)
        storage_id || raise_parameter_is_required_error(:storage_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/storages/#{storage_id}"
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
