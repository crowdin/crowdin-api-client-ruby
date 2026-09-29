# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Translations
      # @param pre_translation_id [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.pre-translations.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.pre-translations.get  Enterprise API Documentation}
      def pre_translation_status(pre_translation_id = nil, project_id = config.project_id)
        pre_translation_id || raise_parameter_is_required_error(:pre_translation_id)
        project_id         || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/pre-translations/#{pre_translation_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.pre-translations.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.pre-translations.post  Enterprise API Documentation}
      def apply_pre_translation(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/pre-translations",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.pre-translations.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.pre-translations.getMany  Enterprise API Documentation}
      def list_pre_translations(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/pre-translations",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param pre_translation_id [Hash] Request Body
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.pre-translations.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.pre-translations.patch  Enterprise API Documentation}
      def edit_pre_translations(pre_translation_id = nil, query = {}, project_id = config.project_id)
        pre_translation_id || raise_parameter_is_required_error(:pre_translation_id)
        project_id         || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/pre-translations/#{pre_translation_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param pre_translation_id [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.pre-translations.report.getReport  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.pre-translations.report.getReport  Enterprise API Documentation}
      def pre_translation_report(pre_translation_id = nil, project_id = config.project_id)
        pre_translation_id || raise_parameter_is_required_error(:pre_translation_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/pre-translations/#{pre_translation_id}/report"
        )
        Web::SendRequest.new(request).perform
      end

      # @param directory_id [Integer] Directory Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.builds.directories.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.builds.directories.post  Enterprise API Documentation}
      def build_project_directory_translation(directory_id = nil, query = {}, project_id = config.project_id)
        directory_id || raise_parameter_is_required_error(:directory_id)
        project_id   || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/translations/builds/directories/#{directory_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param file_id [Integer] File Identifier
      # @param query [Hash] Request Body
      # @param destination [String] Destination of File
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.builds.files.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.builds.files.post  Enterprise API Documentation}
      def build_project_file_translation(file_id = nil, query = {}, destination = nil, project_id = config.project_id)
        file_id    || raise_parameter_is_required_error(:file_id)
        project_id || raise_project_id_is_required_error

        etag = query.delete(:eTag)
        headers = etag ? { 'If-None-Match' => etag } : {}

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/translations/builds/files/#{file_id}",
          { params: query, headers: headers }
        )
        Web::SendRequest.new(request, destination).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.builds.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.builds.getMany  Enterprise API Documentation}
      def list_project_builds(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/translations/builds",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.builds.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.builds.post  Enterprise API Documentation}
      def build_project_translation(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/translations/builds",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param language_id [String] Language Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.postOnLanguage  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.postOnLanguage  Enterprise API Documentation}
      def upload_translations(language_id = nil, query = {}, project_id = config.project_id)
        language_id || raise_parameter_is_required_error(:language_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/translations/#{language_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param build_id [Integer] Project Build Identifier
      # @param destination [String] Destination of File
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.builds.download.download  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.builds.download.download  Enterprise API Documentation}
      def download_project_translations(build_id = nil, destination = nil, project_id = config.project_id)
        build_id    || raise_parameter_is_required_error(:build_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/translations/builds/#{build_id}/download"
        )
        Web::SendRequest.new(request, destination).perform
      end

      # @param build_id [Integer] Project Build Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.builds.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.builds.get  Enterprise API Documentation}
      def check_project_build_status(build_id = nil, project_id = config.project_id)
        build_id   || raise_parameter_is_required_error(:build_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/translations/builds/#{build_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param build_id [Integer] Project Build Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.builds.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.builds.delete  Enterprise API Documentation}
      def cancel_build(build_id = nil, project_id = config.project_id)
        build_id   || raise_parameter_is_required_error(:build_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/translations/builds/#{build_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # @param destination [String] Destination of File
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.exports.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.exports.post  Enterprise API Documentation}
      def export_project_translation(query = {}, destination = nil, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/translations/exports",
          { params: query }
        )
        Web::SendRequest.new(request, destination).perform
      end

      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.pre-translations.patchBatch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.pre-translations.patchBatch  Enterprise API Documentation}
      def auto_translation_batch_operations(body = [], project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/pre-translations",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.imports  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.enterprise.imports  Enterprise API Documentation}
      def import_translations(body = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/translations/imports",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param import_translation_id [String] Import Translation Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.imports.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.enterprise.imports.get  Enterprise API Documentation}
      def import_translations_status(import_translation_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/translations/imports/#{import_translation_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param import_translation_id [String] Import Translation Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.imports.report.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.imports.report.get  Enterprise API Documentation}
      def import_translations_report(import_translation_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/translations/imports/#{import_translation_id}/report"
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.validate-qa-checks.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.validate-qa-checks.post  Enterprise API Documentation}
      def validate_text_by_qa_checks(body = [], project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/translations/validate-qa-checks",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
