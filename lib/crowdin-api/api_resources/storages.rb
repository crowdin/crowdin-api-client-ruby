# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Storages
      def list_storages(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/storages",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

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

      def get_storage(storage_id = nil)
        storage_id || raise_parameter_is_required_error(:storage_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/storages/#{storage_id}"
        )
        Web::SendRequest.new(request).perform
      end

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
