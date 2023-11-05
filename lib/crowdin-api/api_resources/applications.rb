# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Applications
      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.applications.api.get  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.applications.api.get  API Documentation}
      def get_application_data(application_identifier = nil, path = nil)
        application_identifier || raise_parameter_is_required_error(:application_identifier)
        application_identifier || raise_parameter_is_required_error(:path)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/applications/#{application_identifier}/api/#{path}"
        )
        Web::SendRequest.new(request).perform
      end

      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.applications.api.put  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.applications.api.put  API Documentation}
      def update_or_restore_application_data(query = {}, application_identifier = nil, path = nil)
        application_identifier || raise_parameter_is_required_error(:application_identifier)
        application_identifier || raise_parameter_is_required_error(:path)

        request = Web::Request.new(
          connection,
          :put,
          "#{config.target_api_url}/applications/#{application_identifier}/api/#{path}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.applications.api.put  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.applications.api.put  API Documentation}
      def add_application_data(query = {}, application_identifier = nil, path = nil)
        application_identifier || raise_parameter_is_required_error(:application_identifier)
        application_identifier || raise_parameter_is_required_error(:path)

        request = Web::Request.new(
          connection,
          :put,
          "#{config.target_api_url}/applications/#{application_identifier}/api/#{path}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.applications.api.delete  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.applications.api.delete  API Documentation}
      def delete_application_data(query = {}, application_identifier = nil, path = nil)
        application_identifier || raise_parameter_is_required_error(:application_identifier)
        application_identifier || raise_parameter_is_required_error(:path)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/applications/#{application_identifier}/api/#{path}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # * {https://developer.crowdin.com/api/v2/#operation/api.projects.applications.api.patch  API Documentation}
      # * {https://developer.crowdin.com/enterprise/api/v2/#operation/api.projects.applications.api.patch  API Documentation}
      def edit_application_data(query = {}, application_identifier = nil, path = nil)
        application_identifier || raise_parameter_is_required_error(:application_identifier)
        application_identifier || raise_parameter_is_required_error(:path)

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/applications/#{application_identifier}/api/#{path}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
