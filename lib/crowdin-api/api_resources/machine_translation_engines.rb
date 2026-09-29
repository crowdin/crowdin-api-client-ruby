# frozen_string_literal: true

module Crowdin
  module ApiResources
    module MachineTranslationEngines
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.mts.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.mts.getMany  Enterprise API Documentation}
      def list_mts(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/mts",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param mt_id [Integer] Machine Translation engine identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.mts.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.mts.get  Enterprise API Documentation}
      def get_mt(mt_id = nil)
        mt_id || raise_parameter_is_required_error(:mt_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/mts/#{mt_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param mt_id [Integer] Machine Translation engine identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.mts.translations.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.mts.translations.post  Enterprise API Documentation}
      def translate_via_mt(mt_id = nil, query = {})
        mt_id || raise_parameter_is_required_error(:mt_id)

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/mts/#{mt_id}/translations",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # -- For Enterprise mode only --

      # @param mt_id [Integer] Machine Translation engine identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.mts.patch  Enterprise API Documentation}
      def edit_mt(mt_id = nil, query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error
        mt_id            || raise_parameter_is_required_error(:mt_id)

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/mts/#{mt_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.mts.post  Enterprise API Documentation}
      def add_mt(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/mts",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param mt_id [Integer] Machine Translation engine identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.mts.delete  Enterprise API Documentation}
      def delete_mt(mt_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        mt_id            || raise_parameter_is_required_error(:mt_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/mts/#{mt_id}"
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
