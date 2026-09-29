# frozen_string_literal: true

module Crowdin
  module ApiResources
    module StringComments
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.comments.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.comments.getMany  Enterprise API Documentation}
      def list_string_comments(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/comments",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.comments.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.comments.post  Enterprise API Documentation}
      def add_string_comment(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/comments",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param string_comment_id [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.comments.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.comments.get  Enterprise API Documentation}
      def get_string_comment(string_comment_id = nil, project_id = config.project_id)
        string_comment_id || raise_parameter_is_required_error(:string_comment_id)
        project_id        || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/comments/#{string_comment_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param string_comment_id [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.comments.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.comments.delete  Enterprise API Documentation}
      def delete_string_comment(string_comment_id = nil, project_id = config.project_id)
        string_comment_id || raise_parameter_is_required_error(:string_comment_id)
        project_id        || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/comments/#{string_comment_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param string_comment_id [Hash] Request Body
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.comments.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.comments.patch  Enterprise API Documentation}
      def edit_string_comment(string_comment_id = nil, query = {}, project_id = config.project_id)
        string_comment_id || raise_parameter_is_required_error(:string_comment_id)
        project_id        || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/comments/#{string_comment_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.comments.batchPatch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.comments.batchPatch  Enterprise API Documentation}
      def string_asset_comment_batch_operations(body = [], project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/comments",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param comment_id [Integer] String Comment Identifier
      # @param attachment_id [Integer] Attachment Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.comments.attachments.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.comments.attachments.delete  Enterprise API Documentation}
      def delete_attachment_from_string_asset_comment(comment_id, attachment_id, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/comments/#{comment_id}/attachments/#{attachment_id}"
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
