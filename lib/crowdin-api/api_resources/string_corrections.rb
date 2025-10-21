# frozen_string_literal: true

module Crowdin
  module ApiResources
    module StringCorrections
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/String-Corrections/operation/api.projects.corrections.getMany Enterprise API Documentation}
      def list_corrections(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/corrections",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/String-Corrections/operation/api.projects.corrections.post Enterprise API Documentation}
      def add_correction(body = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/corrections",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/String-Corrections/operation/api.projects.corrections.get Enterprise API Documentation}
      def get_correction(correction_id = nil, query = {}, project_id = config.project_id)
        correction_id || raise_parameter_is_required_error(:correction_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/corrections/#{correction_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/String-Corrections/operation/api.projects.corrections.deleteMany Enterprise API Documentation}
      def delete_corrections(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/corrections",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/String-Corrections/operation/api.projects.corrections.delete Enterprise API Documentation}
      def delete_correction(correction_id = nil, project_id = config.project_id)
        correction_id || raise_parameter_is_required_error(:correction_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/corrections/#{correction_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/String-Corrections/operation/api.projects.corrections.put Enterprise API Documentation}
      def restore_correction(correction_id = nil, project_id = config.project_id)
        correction_id || raise_parameter_is_required_error(:correction_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :put,
          "#{config.target_api_url}/projects/#{project_id}/corrections/#{correction_id}"
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
