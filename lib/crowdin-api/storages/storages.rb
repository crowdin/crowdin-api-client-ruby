module Crowdin
  module API
    module Storages

      def list_storages(query={})
        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/storages",
          query
        )

        request.process_request!
        request.process_response!
      end

      def add_storage(file)
        @connection.headers['Content-Type']         = 'application/octet-stream'
        @connection.headers['Crowdin-API-FileName'] = File.basename(file)

        request = Web::Request.new(
          @connection,
          :post,
          "#{@target_api_url}/storages",
          file,
          true
        )

        request.process_request!
        request.process_response!
      end

      def get_storage(storage_id, query={})
        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/storages/#{storage_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

      def delete_storage(storage_id, query={})
        request = Web::Request.new(
          @connection,
          :delete,
          "#{@target_api_url}/storages/#{storage_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

    end
  end
end
