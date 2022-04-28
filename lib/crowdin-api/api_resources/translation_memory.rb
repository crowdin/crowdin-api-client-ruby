# frozen_string_literal: true

module Crowdin
  module ApiResources
    module TranslationMemory
      def list_tms(query = {})
        request = Web::Request.new(
          self,
          :get,
          '/tms',
          query
        )

        request.perform
      end

      def add_tm(query = {})
        request = Web::Request.new(
          self,
          :post,
          '/tms',
          query
        )

        request.perform
      end

      def get_tm(tm_id = nil)
        tm_id || raise_parameter_is_required_error(:tm_id)

        request = Web::Request.new(
          self,
          :get,
          "/tms/#{tm_id}"
        )

        request.perform
      end

      def delete_tm(tm_id = nil)
        tm_id || raise_parameter_is_required_error(:tm_id)

        request = Web::Request.new(
          self,
          :delete,
          "/tms/#{tm_id}"
        )

        request.perform
      end

      def edit_tm(tm_id = nil, query = {})
        tm_id || raise_parameter_is_required_error(:tm_id)

        request = Web::Request.new(
          self,
          :delete,
          "/tms/#{tm_id}",
          query
        )

        request.perform
      end

      def clear_tm(tm_id = nil)
        tm_id || raise_parameter_is_required_error(:tm_id)

        request = Web::Request.new(
          self,
          :delete,
          "/tms/#{tm_id}/segments"
        )

        request.perform
      end

      def export_tm(tm_id = nil)
        tm_id || raise_parameter_is_required_error(:tm_id)

        request = Web::Request.new(
          self,
          :post,
          "/tms/#{tm_id}/exports"
        )

        request.perform
      end

      def check_tm_export_status(tm_id = nil, export_id = nil)
        tm_id     || raise_parameter_is_required_error(:tm_id)
        export_id || raise_parameter_is_required_error(:export_id)

        request = Web::Request.new(
          self,
          :get,
          "/tms/#{tm_id}/exports/#{export_id}"
        )

        request.perform
      end

      def download_tm(tm_id = nil, export_id = nil, destination = nil)
        tm_id     || raise_parameter_is_required_error(:tm_id)
        export_id || raise_parameter_is_required_error(:export_id)

        request = Web::Request.new(
          self,
          :get,
          "/tms/#{tm_id}/exports/#{export_id}/download",
          {},
          {},
          destination
        )

        request.perform
      end

      def import_tm(tm_id = nil, query = {})
        tm_id || raise_parameter_is_required_error(:tm_id)

        request = Web::Request.new(
          self,
          :post,
          "/tms/#{tm_id}/imports",
          query
        )

        request.perform
      end

      def check_tm_import_status(tm_id = nil, import_id = nil)
        tm_id     || raise_parameter_is_required_error(:tm_id)
        import_id || raise_parameter_is_required_error(:import_id)

        request = Web::Request.new(
          self,
          :get,
          "/tms/#{tm_id}/imports/#{import_id}"
        )

        request.perform
      end
    end
  end
end
