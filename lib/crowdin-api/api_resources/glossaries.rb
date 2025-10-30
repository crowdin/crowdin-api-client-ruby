# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Glossaries
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.getMany  Enterprise API Documentation}
      def list_glossaries(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/glossaries",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.post  Enterprise API Documentation}
      def add_glossary(query = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/glossaries",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param glossary_id [Integer] Glossary Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.get  Enterprise API Documentation}
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

      # @param glossary_id [Integer] Glossary Identifier
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.delete  Enterprise API Documentation}
      def delete_glossary(glossary_id = nil)
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/glossaries/#{glossary_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param glossary_id [Integer] Glossary Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.patch  Enterprise API Documentation}
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

      # @param query [Hash] Request Body
      # @param glossary_id [Integer] Glossary Identifier
      # @param destination [String] File destination
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.exports.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.exports.post  Enterprise API Documentation}
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

      # @param glossary_id [Integer] Glossary Identifier
      # @param export_id [String] Export Identifier, consists of 36 characters
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.exports.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.exports.get  Enterprise API Documentation}
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

      # @param glossary_id [Integer] Glossary Identifier
      # @param export_id [String] Export Identifier, consists of 36 characters
      # @param destination [String] File destination
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.exports.download.download  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.exports.download.download  Enterprise API Documentation}
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

      # @param glossary_id [Integer] Glossary Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.imports.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.imports.post  Enterprise API Documentation}
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

      # @param glossary_id [Integer] Glossary Identifier
      # @param import_id [String] Import Identifier, consists of 36 characters
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.imports.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.imports.get  Enterprise API Documentation}
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

      # @param glossary_id [Integer] Glossary Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.terms.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.terms.getMany  Enterprise API Documentation}
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

      # @param glossary_id [Integer] Glossary Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.terms.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.terms.post  Enterprise API Documentation}
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

      # @param glossary_id [Integer] Glossary Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.terms.deleteMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.terms.deleteMany  Enterprise API Documentation}
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

      # @param glossary_id [Integer] Glossary Identifier
      # @param term_id [Integer] Term Identifier
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.terms.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.terms.get  Enterprise API Documentation}
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

      # @param glossary_id [Integer] Glossary Identifier
      # @param term_id [Integer] Term Identifier
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.terms.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.terms.delete  Enterprise API Documentation}
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

      # @param glossary_id [Integer] Glossary Identifier
      # @param term_id [Integer] Term Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.terms.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.terms.patch  Enterprise API Documentation}
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

      # @param glossary_id [Integer] Glossary Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.concepts.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.concepts.getMany  Enterprise API Documentation}
      def list_concepts(glossary_id = nil, query = {})
        glossary_id || raise_parameter_is_required_error(:glossary_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/glossaries/#{glossary_id}/concepts",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param glossary_id [Integer] Glossary Identifier
      # @param concept_id [Integer] Concept Identifier
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.concepts.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.concepts.get  Enterprise API Documentation}
      def get_concept(glossary_id = nil, concept_id = nil)
        glossary_id || raise_parameter_is_required_error(:glossary_id)
        concept_id || raise_parameter_is_required_error(:concept_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/glossaries/#{glossary_id}/concepts/#{concept_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param glossary_id [Integer] Glossary Identifier
      # @param concept_id [Integer] Concept Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.concepts.put  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.concepts.put  Enterprise API Documentation}
      def update_concept(glossary_id = nil, concept_id = nil, query = {})
        glossary_id || raise_parameter_is_required_error(:glossary_id)
        concept_id || raise_parameter_is_required_error(:concept_id)

        request = Web::Request.new(
          connection,
          :put,
          "#{config.target_api_url}/glossaries/#{glossary_id}/concepts/#{concept_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param glossary_id [Integer] Glossary Identifier
      # @param concept_id [Integer] Concept Identifier
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.glossaries.concepts.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.glossaries.concepts.delete  Enterprise API Documentation}
      def delete_concept(glossary_id = nil, concept_id = nil)
        glossary_id || raise_parameter_is_required_error(:glossary_id)
        concept_id || raise_parameter_is_required_error(:concept_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/glossaries/#{glossary_id}/concepts/#{concept_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param project_id [Integer] Project Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#tag/Glossaries/operation/api.projects.glossaries.concordance.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Glossaries/operation/api.projects.glossaries.concordance.post  Enterprise API Documentation}
      def search_glossaries_concordance(project_id = nil, query = {})
        project_id || raise_project_id_is_required_error

        %i[source_language_id target_language_id expression].each do |param|
          query[param] || raise_parameter_is_required_error(param)
        end

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/glossaries/concordance",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
