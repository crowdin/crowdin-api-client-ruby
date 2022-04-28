# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Glossaries
      def list_glossaries(query = {})
        request = Web::Request.new(
          self,
          :get,
          '/glossaries',
          query
        )

        request.perform
      end

      def add_glossary(query = {})
        request = Web::Request.new(
          self,
          :post,
          '/glossaries',
          query
        )

        request.perform
      end

      def get_glossary(glossary_id = nil, query = {})
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        request = Web::Request.new(
          self,
          :get,
          "/glossaries/#{glossary_id}",
          query
        )

        request.perform
      end

      def delete_glossary(glossary_id = nil, query = {})
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        request = Web::Request.new(
          self,
          :delete,
          "/glossaries/#{glossary_id}",
          query
        )

        request.perform
      end

      def edit_glossary(glossary_id = nil, query = {})
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        request = Web::Request.new(
          self,
          :patch,
          "/glossaries/#{glossary_id}",
          query
        )

        request.perform
      end

      def export_glossary(query = {}, glossary_id = nil, destination = nil)
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        request = Web::Request.new(
          self,
          :post,
          "/glossaries/#{glossary_id}/exports",
          query,
          {},
          destination
        )

        request.perform
      end

      def check_glossary_export_status(glossary_id = nil, export_id = nil)
        glossary_id || raise_parameter_is_required_error(:glossary_id)
        export_id   || raise_parameter_is_required_error(:export_id)

        request = Web::Request.new(
          self,
          :get,
          "/glossaries/#{glossary_id}/exports/#{export_id}"
        )

        request.perform
      end

      def download_glossary(glossary_id = nil, export_id = nil, destination = nil)
        glossary_id || raise_parameter_is_required_error(:glossary_id)
        export_id   || raise_parameter_is_required_error(:export_id)

        request = Web::Request.new(
          self,
          :get,
          "/glossaries/#{glossary_id}/exports/#{export_id}/download",
          {},
          {},
          destination
        )

        request.perform
      end

      def import_glossary(glossary_id = nil, query = {})
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        request = Web::Request.new(
          self,
          :post,
          "/glossaries/#{glossary_id}/imports",
          query
        )

        request.perform
      end

      def check_glossary_import_status(glossary_id = nil, import_id = nil)
        glossary_id || raise_parameter_is_required_error(:glossary_id)
        import_id   || raise_parameter_is_required_error(:import_id)

        request = Web::Request.new(
          self,
          :get,
          "/glossaries/#{glossary_id}/imports/#{import_id}"
        )

        request.perform
      end

      def list_terms(glossary_id = nil, query = {})
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        request = Web::Request.new(
          self,
          :get,
          "/glossaries/#{glossary_id}/terms",
          query
        )

        request.perform
      end

      def add_term(glossary_id = nil, query = {})
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        request = Web::Request.new(
          self,
          :post,
          "/glossaries/#{glossary_id}/terms",
          query
        )

        request.perform
      end

      def clear_glossary(glossary_id = nil, query = {})
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        request = Web::Request.new(
          self,
          :delete,
          "/glossaries/#{glossary_id}/terms",
          query
        )

        request.perform
      end

      def get_term(glossary_id = nil, term_id = nil)
        glossary_id || raise_parameter_is_required_error(:glossary_id)
        term_id     || raise_parameter_is_required_error(:term_id)

        request = Web::Request.new(
          self,
          :get,
          "/glossaries/#{glossary_id}/terms/#{term_id}"
        )

        request.perform
      end

      def delete_term(glossary_id = nil, term_id = nil)
        glossary_id || raise_parameter_is_required_error(:glossary_id)
        term_id     || raise_parameter_is_required_error(:term_id)

        request = Web::Request.new(
          self,
          :delete,
          "/glossaries/#{glossary_id}/terms/#{term_id}"
        )

        request.perform
      end

      def edit_term(glossary_id = nil, term_id = nil, query = {})
        glossary_id || raise_parameter_is_required_error(:glossary_id)
        term_id     || raise_parameter_is_required_error(:term_id)

        request = Web::Request.new(
          self,
          :patch,
          "/glossaries/#{glossary_id}/terms/#{term_id}",
          query
        )

        request.perform
      end
    end
  end
end
