# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Distributions
      def list_distributions(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/distributions",
          query
        )

        request.perform
      end

      def add_distribution(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/distributions",
          query
        )

        request.perform
      end

      def get_distribution(hash = nil, project_id = config.project_id)
        hash       || raise_parameter_is_required_error(:hash)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/distributions/#{hash}"
        )

        request.perform
      end

      def delete_distribution(hash = nil, project_id = config.project_id)
        hash       || raise_parameter_is_required_error(:hash)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}/distributions/#{hash}"
        )

        request.perform
      end

      def edit_distribution(hash = nil, query = {}, project_id = config.project_id)
        hash       || raise_parameter_is_required_error(:hash)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :patch,
          "/projects/#{project_id}/distributions/#{hash}",
          query
        )

        request.perform
      end

      def get_destribution_release(hash = nil, project_id = config.project_id)
        hash       || raise_parameter_is_required_error(:hash)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/distributions/#{hash}/release"
        )

        request.perform
      end

      def release_distribution(hash = nil, project_id = config.project_id)
        hash       || raise_parameter_is_required_error(:hash)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/distributions/#{hash}/release"
        )

        request.perform
      end
    end
  end
end
