# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Translations
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

      def build_project_file_translation(file_id = nil, query = {}, destination = nil, project_id = config.project_id)
        file_id    || raise_parameter_is_required_error(:file_id)
        project_id || raise_project_id_is_required_error

        headers = query[:eTag] ? { 'If-None-Match' => query[:eTag] } : {}

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/translations/builds/files/#{file_id}",
          { params: query, headers: headers }
        )
        Web::SendRequest.new(request, destination).perform
      end

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

      def add_translation_alignment(project_id = nil, query = {})
        project_id || raise_parameter_is_required_error(:project_id)

        %i[source_language_id target_language_id text].each do |param|
          query[param] || raise_parameter_is_required_error(param)
        end

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/translations/alignment",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
