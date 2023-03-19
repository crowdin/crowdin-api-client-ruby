# frozen_string_literal: true

module Crowdin
  module ApiResources
    module TranslationMemory
      def list_tms(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/tms",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def add_tm(query = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/tms",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def get_tm(tm_id = nil)
        tm_id || raise_parameter_is_required_error(:tm_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/tms/#{tm_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def delete_tm(tm_id = nil)
        tm_id || raise_parameter_is_required_error(:tm_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/tms/#{tm_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def edit_tm(tm_id = nil, query = {})
        tm_id || raise_parameter_is_required_error(:tm_id)

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/tms/#{tm_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def clear_tm(tm_id = nil)
        tm_id || raise_parameter_is_required_error(:tm_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/tms/#{tm_id}/segments"
        )
        Web::SendRequest.new(request).perform
      end

      def export_tm(tm_id = nil)
        tm_id || raise_parameter_is_required_error(:tm_id)

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/tms/#{tm_id}/exports"
        )
        Web::SendRequest.new(request).perform
      end

      def check_tm_export_status(tm_id = nil, export_id = nil)
        tm_id     || raise_parameter_is_required_error(:tm_id)
        export_id || raise_parameter_is_required_error(:export_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/tms/#{tm_id}/exports/#{export_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def download_tm(tm_id = nil, export_id = nil, destination = nil)
        tm_id     || raise_parameter_is_required_error(:tm_id)
        export_id || raise_parameter_is_required_error(:export_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/tms/#{tm_id}/exports/#{export_id}/download"
        )
        Web::SendRequest.new(request, destination).perform
      end

      def import_tm(tm_id = nil, query = {})
        tm_id || raise_parameter_is_required_error(:tm_id)

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/tms/#{tm_id}/imports",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def check_tm_import_status(tm_id = nil, import_id = nil)
        tm_id     || raise_parameter_is_required_error(:tm_id)
        import_id || raise_parameter_is_required_error(:import_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/tms/#{tm_id}/imports/#{import_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def search_tms_concordance(project_id = nil, query = {})
        project_id || raise_parameter_is_required_error(:project_id)

        %i[source_language_id target_language_id expression auto_substitution min_relevant].each do |param|
          query[param] || raise_parameter_is_required_error(param)
        end

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/tms/concordance",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
