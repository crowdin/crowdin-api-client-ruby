module Crowdin
  module API
    module Translations

      def pre_translation_status(project_id=@project_id, pre_translation_id)
        project_id         || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        pre_translation_id || raise(ArgumentError, ':pre_translation_id is required')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/pre-translations/#{pre_translation_id}"
        )

        request.process_request!
        request.process_response!
      end

      def apply_pre_translation(project_id=@project_id, query={})
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :post,
          "#{@target_api_url}/projects/#{project_id}/pre-translations",
          query
        )

        request.process_request!
        request.process_response!
      end

      def build_project_directory_translation(project_id=@project_id, directory_id, query={})
        project_id   || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        directory_id || raise(ArgumentError, ':directory_id is required')

        request = Web::Request.new(
          @connection,
          :post,
          "#{@target_api_url}/projects/#{project_id}/translations/builds/directories/#{directory_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

      def build_project_file_translation(project_id=@project_id, file_id, query={})
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        file_id    || raise(ArgumentError, ':file_id is required')

        headers = params['eTag'] ? { 'If-None-Match' => query['eTag'] } : {}

        request = Web::Request.new(
          @connection,
          :post,
          "#{@target_api_url}/projects/#{project_id}/translations/builds/files/#{file_id}",
          query,
          headers
        )

        request.process_request!
        request.process_response!
      end

      def list_project_builds(project_id=@project_id, query={})
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/translations/builds",
          query
        )

        request.process_request!
        request.process_response!
      end

      def build_project_translation(project_id=@project_id, query={})
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :post,
          "#{@target_api_url}/projects/#{project_id}/translations/builds",
          query
        )

        request.process_request!
        request.process_response!
      end

      def upload_translations(project_id=@project_id, language_id, query={})
        project_id  || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        language_id || raise(ArgumentError, ':language_id is required')

        request = Web::Request.new(
          @connection,
          :post,
          "#{@target_api_url}/projects/#{project_id}/translations/#{language_id}",
          query
        )

        request.process_request!
        request.process_response!
      end

      def download_project_translations(project_id=@project_id, build_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        build_id   || raise(ArgumentError, ':build_id is required')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/translations/builds/#{build_id}/download"
        )

        request.process_request!
        request.process_response!
      end

      def check_project_build_status(project_id=@project_id, build_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        build_id   || raise(ArgumentError, ':build_id is required')

        request = Web::Request.new(
          @connection,
          :get,
          "#{@target_api_url}/projects/#{project_id}/translations/builds/#{build_id}"
        )

        request.process_request!
        request.process_response!
      end

      def cancel_build(project_id=@project_id, build_id)
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')
        build_id   || raise(ArgumentError, ':build_id is required')

        request = Web::Request.new(
          @connection,
          :delete,
          "#{@target_api_url}/projects/#{project_id}/translations/builds/#{build_id}"
        )

        request.process_request!
        request.process_response!
      end

      def export_project_translation(project_id=@project_id, query={})
        project_id || raise(ArgumentError, ':project_id is required in parameters or when initialize Client')

        request = Web::Request.new(
          @connection,
          :post,
          "#{@target_api_url}/projects/#{project_id}/translations/exports",
          query
        )

        request.process_request!
        request.process_response!
      end

    end
  end
end
