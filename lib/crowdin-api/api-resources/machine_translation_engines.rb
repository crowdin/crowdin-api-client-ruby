# frozen_string_literal: true

module Crowdin
  module ApiResources
    # -- For Enterprise mode only --
    module MachineTranslationEngines
      def list_mts(query = {})
        config.enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          self,
          :get,
          '/mts',
          query
        )

        request.perform
      end

      def add_mt(query = {})
        config.enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          self,
          :post,
          '/mts',
          query
        )

        request.perform
      end

      def get_mt(mt_id = nil)
        config.enterprise_mode? || raise_only_for_enterprise_mode_error
        mt_id                   || raise_parameter_is_required_error(:mt_id)

        request = Web::Request.new(
          self,
          :get,
          "/mts/#{mt_id}"
        )

        request.perform
      end

      def delete_mt(mt_id = nil)
        config.enterprise_mode? || raise_only_for_enterprise_mode_error
        mt_id                   || raise_parameter_is_required_error(:mt_id)

        request = Web::Request.new(
          self,
          :delete,
          "/mts/#{mt_id}"
        )

        request.perform
      end

      def edit_mt(mt_id = nil, query = {})
        config.enterprise_mode? || raise_only_for_enterprise_mode_error
        mt_id                   || raise_parameter_is_required_error(:mt_id)

        request = Web::Request.new(
          self,
          :patch,
          "/mts/#{mt_id}",
          query
        )

        request.perform
      end
    end
  end
end
