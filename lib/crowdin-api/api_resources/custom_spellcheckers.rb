# frozen_string_literal: true

module Crowdin
  module ApiResources
    module CustomSpellcheckers
      # -- For Enterprise mode only --

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.custom-spellcheckers.getMany  Enterprise API Documentation}
      def list_custom_spellcheckers(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/custom-spellcheckers",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param custom_spellchecker_id [Integer] Custom Spellchecker Identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.custom-spellcheckers.get  Enterprise API Documentation}
      def get_custom_spellchecker(custom_spellchecker_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/custom-spellcheckers/#{custom_spellchecker_id}"
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
