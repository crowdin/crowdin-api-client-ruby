# frozen_string_literal: true

module Crowdin
  module ApiResources
    module StyleGuides
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.style-guides.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.style-guides.getMany  Enterprise API Documentation}
      def list_style_guides(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/style-guides",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.style-guides.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.style-guides.post  Enterprise API Documentation}
      def create_style_guide(body = {})
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/style-guides",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param style_guide_id [Integer] Style Guide Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.style-guides.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.style-guides.delete  Enterprise API Documentation}
      def delete_style_guide(style_guide_id)
        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/style-guides/#{style_guide_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param style_guide_id [Integer] Style Guide Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.style-guides.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.style-guides.get  Enterprise API Documentation}
      def get_style_guide(style_guide_id)
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/style-guides/#{style_guide_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param style_guide_id [Integer] Style Guide Identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.style-guides.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.style-guides.patch  Enterprise API Documentation}
      def edit_style_guide(style_guide_id, body = [])
        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/style-guides/#{style_guide_id}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
