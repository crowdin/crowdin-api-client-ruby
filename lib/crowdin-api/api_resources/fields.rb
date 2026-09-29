# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Fields
      # -- For Enterprise mode only --

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.fields.getMany  Enterprise API Documentation}
      def list_fields(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/fields",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.fields.post  Enterprise API Documentation}
      def add_field(body = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/fields",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param field_id [Integer] Field Identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.fields.delete  Enterprise API Documentation}
      def delete_field(field_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/fields/#{field_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param field_id [Integer] Field Identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.fields.get  Enterprise API Documentation}
      def get_field(field_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/fields/#{field_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param field_id [Integer] Field Identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.fields.patch  Enterprise API Documentation}
      def edit_field(field_id, body = [])
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/fields/#{field_id}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
