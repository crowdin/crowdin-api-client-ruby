# frozen_string_literal: true

module Crowdin
  module ApiResources
    module TranslationStatus
      def get_branch_progress(branch_id = nil, query = {}, project_id = config.project_id)
        branch_id  || raise_parameter_is_required_error(:branch_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/branches/#{branch_id}/languages/progress",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def get_directory_progress(directory_id = nil, query = {}, project_id = config.project_id)
        directory_id || raise_parameter_is_required_error(:directory_id)
        project_id   || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/directories/#{directory_id}/languages/progress",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def get_file_progress(file_id = nil, query = {}, project_id = config.project_id)
        file_id    || raise_parameter_is_required_error(:file_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/files/#{file_id}/languages/progress",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def get_language_progress(language_id = nil, query = {}, project_id = config.project_id)
        language_id || raise_parameter_is_required_error(:language_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/languages/#{language_id}/progress",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def get_project_progress(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/languages/progress",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def get_qa_progress(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/qa-checks",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
