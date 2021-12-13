# frozen_string_literal: true

module Crowdin
  module ApiResources
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
          self,
          :get,
          '/storages',
          query
        )

        request.perform
      end

      # Add storage.
      #
      # === Parameters
      #
      # * +File+ - File class object or path to file
      #
      # === Example
      #
      #  crowdin.add_storage(File.open('your_filename.extension', 'r'))
      # or
      #  crowdin.add_storage('your_filename.extension')
      #
      def add_storage(file = nil)
        file || raise_parameter_is_required_error(:file)

        file = file.is_a?(File) ? file : File.open(file, 'r')

        request = Web::Request.new(
          self,
          :post,
          '/storages',
          file,
          { 'Content-Type' => 'application/octet-stream', 'Crowdin-API-FileName' => File.basename(file) }
        )

        request.perform
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
        storage_id || raise_parameter_is_required_error(:storage_id)

        request = Web::Request.new(
          self,
          :get,
          "/storages/#{storage_id}"
        )

        request.perform
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
        storage_id || raise_parameter_is_required_error(:storage_id)

        request = Web::Request.new(
          self,
          :delete,
          "/storages/#{storage_id}"
        )

        request.perform
      end
    end
  end
end
