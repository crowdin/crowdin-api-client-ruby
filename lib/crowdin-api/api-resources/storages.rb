# frozen_string_literal: true

module Crowdin
  module API
    module Storages
      # Get storages list.
      #
      # === Parameters
      #
      # Optional:
      # * +:limit+ [Integer 1..500] - A maximum number of items to retrieve, default - 25
      # * +:offset+ [Integer >= 0] - A starting offset in the collection, default - 0
      #
      # === Example
      #
      #  crowdin.list_projects(limit: your_value)
      #
      def list_storages(query = {})
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
      # === Parameters
      #
      # * +File+ - File class object or path to file
      #
      # === Example
      #
      #  crowdin.add_storage(File.open('your_filename.extension'))
      # or
      #  crowdin.add_storage('your_filename.extension')
      #
      def add_storage(file = nil)
        file || raise(ArgumentError, ':file is required')

        file = file.is_a?(File) ? file : File.open(file)

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
      # === Parameters
      #
      # * +:storage_id+ [Integer] - Storage Identifier. Get via list_storages
      #
      # === Example
      #
      #  crowdin.get_storage(your_storage_id)
      #
      def get_storage(storage_id = nil)
        storage_id || raise(ArgumentError, ':storage_id is required')

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
      # === Parameters
      #
      # * +:storage_id+ [Integer] - Storage Identifier. Get via list_storages
      #
      # === Example
      #
      #  crowdin.delete_storage(your_storage_id)
      #
      def delete_storage(storage_id = nil)
        storage_id || raise(ArgumentError, ':storage_id is required')

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
