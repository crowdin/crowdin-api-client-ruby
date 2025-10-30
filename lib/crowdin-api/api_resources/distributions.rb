# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Distributions
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#tag/Distributions/operation/api.projects.distributions.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Distributions/operation/api.projects.distributions.getMany  Enterprise API Documentation}
      def list_distributions(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/distributions",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#tag/Distributions/operation/api.projects.distributions.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Distributions/operation/api.projects.distributions.post  Enterprise API Documentation}
      def add_distribution(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/distributions",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param hash [String] Hash
      # * {https://support.crowdin.com/developer/api/v2/#tag/Distributions/operation/api.projects.distributions.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Distributions/operation/api.projects.distributions.get  Enterprise API Documentation}
      def get_distribution(hash = nil, project_id = config.project_id)
        hash       || raise_parameter_is_required_error(:hash)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/distributions/#{hash}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param hash [String] Hash
      # * {https://support.crowdin.com/developer/api/v2/#tag/Distributions/operation/api.projects.distributions.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Distributions/operation/api.projects.distributions.delete  Enterprise API Documentation}
      def delete_distribution(hash = nil, project_id = config.project_id)
        hash       || raise_parameter_is_required_error(:hash)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/distributions/#{hash}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param hash [String] Hash
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#tag/Distributions/operation/api.projects.distributions.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Distributions/operation/api.projects.distributions.patch  Enterprise API Documentation}
      def edit_distribution(hash = nil, query = {}, project_id = config.project_id)
        hash       || raise_parameter_is_required_error(:hash)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/distributions/#{hash}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param hash [String] Hash
      # * {https://support.crowdin.com/developer/api/v2/#tag/Distributions/operation/api.projects.distributions.release.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Distributions/operation/api.projects.distributions.release.get  Enterprise API Documentation}
      def get_distribution_release(hash = nil, project_id = config.project_id)
        hash       || raise_parameter_is_required_error(:hash)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/distributions/#{hash}/release"
        )
        Web::SendRequest.new(request).perform
      end

      # @param hash [String] Hash
      # * {https://support.crowdin.com/developer/api/v2/#tag/Distributions/operation/api.projects.distributions.release.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#tag/Distributions/operation/api.projects.distributions.release.post  Enterprise API Documentation}
      def release_distribution(hash = nil, project_id = config.project_id)
        hash       || raise_parameter_is_required_error(:hash)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/distributions/#{hash}/release"
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
