# frozen_string_literal: true

module Crowdin
  module ApiResources
    module MachineTranslationEngines
      def list_mts(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/mts",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def get_mt(mt_id = nil)
        mt_id || raise_parameter_is_required_error(:mt_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/mts/#{mt_id}"
        )
        Web::SendRequest.new(request).perform
      end

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
