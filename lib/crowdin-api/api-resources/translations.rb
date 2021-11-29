# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Translations
      def pre_translation_status(pre_translation_id = nil, project_id = config.project_id)
        pre_translation_id || raise(ArgumentError, ':pre_translation_id is required')
        project_id         || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/pre-translations/#{pre_translation_id}"
        )

        request.perform
      end

      def apply_pre_translation(query = {}, project_id = config.project_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/pre-translations",
          query
        )

        request.perform
      end

      def build_project_directory_translation(directory_id = nil, query = {})
        project_id = query[:project_id] || config.project_id

        directory_id || raise(ArgumentError, ':directory_id is required')
        project_id   || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/translations/builds/directories/#{directory_id}",
          query
        )

        request.perform
      end

      def build_project_file_translation(file_id = nil, query = {})
        project_id = query[:project_id] || config.project_id

        file_id    || raise(ArgumentError, ':file_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        headers = query[:eTag] ? { 'If-None-Match' => query[:eTag] } : {}

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/translations/builds/files/#{file_id}",
          query,
          headers
        )

        request.perform
      end

      def list_project_builds(query = {}, project_id = config.project_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/translations/builds",
          query
        )

        request.perform
      end

      def build_project_translation(query = {}, project_id = config.project_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/translations/builds",
          query
        )

        request.perform
      end

      def upload_translations(language_id = nil, query = {})
        project_id = query[:project_id] || config.project_id

        language_id || raise(ArgumentError, ':language_id is required')
        project_id  || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/translations/#{language_id}",
          query
        )

        request.perform
      end

      def download_project_translations(destinaton = nil, build_id = nil, project_id = config.project_id)
        destinaton || raise(ArgumentError, ':destination is required for downlaods')
        build_id   || raise(ArgumentError, ':build_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/translations/builds/#{build_id}/download",
          {},
          {},
          destinaton
        )

        request.perform
      end

      def check_project_build_status(build_id = nil, project_id = config.project_id)
        build_id   || raise(ArgumentError, ':build_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/translations/builds/#{build_id}"
        )

        request.perform
      end

      def cancel_build(build_id = nil, project_id = config.project_id)
        build_id   || raise(ArgumentError, ':build_id is required')
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}/translations/builds/#{build_id}"
        )

        request.perform
      end

      def export_project_translation(query = {}, project_id = config.project_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/translations/exports",
          query
        )

        request.perform
      end
    end
  end
end
