# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Translations
      def pre_translation_status(pre_translation_id = nil, project_id = config.project_id)
        pre_translation_id || raise_parameter_is_required_error(:pre_translation_id)
        project_id         || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/pre-translations/#{pre_translation_id}"
        )

        request.perform
      end

      def apply_pre_translation(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/pre-translations",
          query
        )

        request.perform
      end

      def build_project_directory_translation(directory_id = nil, query = {}, project_id = config.project_id)
        directory_id || raise_parameter_is_required_error(:directory_id)
        project_id   || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/translations/builds/directories/#{directory_id}",
          query
        )

        request.perform
      end

      def build_project_file_translation(file_id = nil, query = {}, project_id = config.project_id)
        file_id    || raise_parameter_is_required_error(:file_id)
        project_id || raise_project_id_is_required_error

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
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/translations/builds",
          query
        )

        request.perform
      end

      def build_project_translation(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/translations/builds",
          query
        )

        request.perform
      end

      def upload_translations(language_id = nil, query = {}, project_id = config.project_id)
        language_id || raise_parameter_is_required_error(:language_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/translations/#{language_id}",
          query
        )

        request.perform
      end

      def download_project_translations(destination = nil, build_id = nil, project_id = config.project_id)
        destination || raise_parameter_is_required_error(:destination)
        build_id    || raise_parameter_is_required_error(:build_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/translations/builds/#{build_id}/download",
          {},
          {},
          destination
        )

        request.perform
      end

      def check_project_build_status(build_id = nil, project_id = config.project_id)
        build_id   || raise_parameter_is_required_error(:build_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/translations/builds/#{build_id}"
        )

        request.perform
      end

      def cancel_build(build_id = nil, project_id = config.project_id)
        build_id   || raise_parameter_is_required_error(:build_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}/translations/builds/#{build_id}"
        )

        request.perform
      end

      def export_project_translation(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

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
