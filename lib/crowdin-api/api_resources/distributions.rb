# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Distributions
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
