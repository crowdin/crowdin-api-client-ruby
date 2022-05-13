# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Glossaries
      def list_glossaries(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/glossaries",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def add_glossary(query = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/glossaries",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def get_glossary(glossary_id = nil, query = {})
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/glossaries/#{glossary_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def delete_glossary(glossary_id = nil)
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/glossaries/#{glossary_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def edit_glossary(glossary_id = nil, query = {})
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/glossaries/#{glossary_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def export_glossary(query = {}, glossary_id = nil, destination = nil)
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/glossaries/#{glossary_id}/exports",
          { params: query }
        )
        Web::SendRequest.new(request, destination).perform
      end

      def check_glossary_export_status(glossary_id = nil, export_id = nil)
        glossary_id || raise_parameter_is_required_error(:glossary_id)
        export_id   || raise_parameter_is_required_error(:export_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/glossaries/#{glossary_id}/exports/#{export_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def download_glossary(glossary_id = nil, export_id = nil, destination = nil)
        glossary_id || raise_parameter_is_required_error(:glossary_id)
        export_id   || raise_parameter_is_required_error(:export_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/glossaries/#{glossary_id}/exports/#{export_id}/download"
        )
        Web::SendRequest.new(request, destination).perform
      end

      def import_glossary(glossary_id = nil, query = {})
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/glossaries/#{glossary_id}/imports",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def check_glossary_import_status(glossary_id = nil, import_id = nil)
        glossary_id || raise_parameter_is_required_error(:glossary_id)
        import_id   || raise_parameter_is_required_error(:import_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/glossaries/#{glossary_id}/imports/#{import_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def list_terms(glossary_id = nil, query = {})
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/glossaries/#{glossary_id}/terms",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def add_term(glossary_id = nil, query = {})
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/glossaries/#{glossary_id}/terms",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def clear_glossary(glossary_id = nil, query = {})
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        response = ::RestClient::Request.execute(
          {
            method: :delete,
            url: config.base_url + config.target_api_url + "/glossaries/#{glossary_id}/terms",
            payload: query.to_json
          }.merge(@options)
        )

        response.body.empty? ? response.code : JSON.parse(response.body)
      rescue StandardError => e
        e.message
      end

      def get_term(glossary_id = nil, term_id = nil)
        glossary_id || raise_parameter_is_required_error(:glossary_id)
        term_id     || raise_parameter_is_required_error(:term_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/glossaries/#{glossary_id}/terms/#{term_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def delete_term(glossary_id = nil, term_id = nil)
        glossary_id || raise_parameter_is_required_error(:glossary_id)
        term_id     || raise_parameter_is_required_error(:term_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/glossaries/#{glossary_id}/terms/#{term_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def edit_term(glossary_id = nil, term_id = nil, query = {})
        glossary_id || raise_parameter_is_required_error(:glossary_id)
        term_id     || raise_parameter_is_required_error(:term_id)

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/glossaries/#{glossary_id}/terms/#{term_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
