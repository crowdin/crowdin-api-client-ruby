# frozen_string_literal: true

module Crowdin
  module ApiResources
    module TranslationMemory
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.getMany  Enterprise API Documentation}
      def list_tms(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/tms",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.post  Enterprise API Documentation}
      def add_tm(query = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/tms",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param tm_id [Integer] TM Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.get  Enterprise API Documentation}
      def get_tm(tm_id = nil)
        tm_id || raise_parameter_is_required_error(:tm_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/tms/#{tm_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param tm_id [Integer] TM Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.delete  Enterprise API Documentation}
      def delete_tm(tm_id = nil)
        tm_id || raise_parameter_is_required_error(:tm_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/tms/#{tm_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param tm_id [Integer] TM Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.patch  Enterprise API Documentation}
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

      # @param tm_id [Integer] TM Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.segments.clear  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.segments.clear  Enterprise API Documentation}
      def clear_tm(tm_id = nil)
        tm_id || raise_parameter_is_required_error(:tm_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/tms/#{tm_id}/segments"
        )
        Web::SendRequest.new(request).perform
      end

      # @param tm_id [Integer] TM Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.exports.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.exports.post  Enterprise API Documentation}
      def export_tm(tm_id = nil)
        tm_id || raise_parameter_is_required_error(:tm_id)

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/tms/#{tm_id}/exports"
        )
        Web::SendRequest.new(request).perform
      end

      # @param tm_id [Integer] TM Identifier
      # @param export_id [String] Export Identifier, consists of 36 characters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.exports.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.exports.get  Enterprise API Documentation}
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

      # @param tm_id [Integer] TM Identifier
      # @param export_id [String] Export Identifier, consists of 36 characters
      # @param destination [String] Destination of File
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.exports.download.download  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.exports.download.download  Enterprise API Documentation}
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

      # @param tm_id [Integer] TM Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.imports.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.imports.post  Enterprise API Documentation}
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

      # @param tm_id [Integer] TM Identifier
      # @param import_id [String] Import Identifier, consists of 36 characters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.imports.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.imports.get  Enterprise API Documentation}
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

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.tms.concordance.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.tms.concordance.post  Enterprise API Documentation}
      def search_tms_concordance(project_id = nil, query = {})
        project_id || raise_project_id_is_required_error

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

      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.concordance.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.concordance.post  Enterprise API Documentation}
      def concordance_search_in_tms(body = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/tms/concordance",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param tm_id [Integer] TM Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.segments.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.segments.getMany  Enterprise API Documentation}
      def list_tm_segments(tm_id, query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/tms/#{tm_id}/segments",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param tm_id [Integer] TM Identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.segments.patchBatch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.segments.patchBatch  Enterprise API Documentation}
      def tm_segment_batch_operations(tm_id, body = [])
        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/tms/#{tm_id}/segments",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param tm_id [Integer] TM Identifier
      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.segments.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.segments.post  Enterprise API Documentation}
      def create_tm_segment(tm_id, body = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/tms/#{tm_id}/segments",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param tm_id [Integer] TM Identifier
      # @param segment_id [Integer] TM Segment Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.segments.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.segments.delete  Enterprise API Documentation}
      def delete_tm_segment(tm_id, segment_id)
        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/tms/#{tm_id}/segments/#{segment_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param tm_id [Integer] TM Identifier
      # @param segment_id [Integer] TM Segment Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.segments.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.segments.get  Enterprise API Documentation}
      def get_tm_segment(tm_id, segment_id)
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/tms/#{tm_id}/segments/#{segment_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param tm_id [Integer] TM Identifier
      # @param segment_id [Integer] TM Segment Identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.tms.segments.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.tms.segments.patch  Enterprise API Documentation}
      def edit_tm_segment(tm_id, segment_id, body = [])
        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/tms/#{tm_id}/segments/#{segment_id}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
