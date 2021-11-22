module Crowdin
  module API
    module Storages

      # Get storages list.
      #
      # == Parameters
      #
      # Optional:
      # * *:limit* [Integer 1..500] - A maximum number of items to retrieve, default - 25
      # * *:offset* [Integer >= 0] - A starting offset in the collection, default - 0
      #
      # == Example
      #
      #  crowdin.list_projects(limit: 2)
      #
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

      # Add storage.
      #
      # == Parameters
      #
      # Required:
      # * *:file* [File] - File class object
      #
      # == Example
      #
      #  crowdin.add_storage(File.open('example.jpeg'))
      #
      def add_storage(file=nil)
        file && file.is_a?(File) || raise(ArgumentError, ':file as File class is required')

        request = Web::Request.new(
          @connection,
          :post,
          "#{@target_api_url}/storages",
          file,
          { 'Content-Type' => 'application/octet-stream', 'Crowdin-API-FileName' => File.basename(file) }
        )

        request.process_request!
        request.process_response!
      end

      # Get storage information.
      #
      # == Parameters
      #
      # Required:
      # * *:storage_id* [Integer] - Storage Identifier. Get via list_storages
      #
      # == Example
      #
      #  crowdin.get_storage(1)
      #
      def get_storage(storage_id=nil)
        storage_id || raise(ArgumentError, ":storage_id is required")

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/storages/#{storage_id}"
        )

        request.process_request!
        request.process_response!
      end

      # Delete storage.
      #
      # == Parameters
      #
      # Required:
      # * *:storage_id* [Integer] - Storage Identifier. Get via list_storages
      #
      # == Example
      #
      #  crowdin.delete_storage(1)
      #
      def delete_storage(storage_id)
        storage_id || raise(ArgumentError, ":storage_id is required")

        request = Web::Request.new(
          @connection,
          :delete,
          "#{@target_api_url}/storages/#{storage_id}"
        )

        request.process_request!
        request.process_response!
      end

    end
  end
end
