# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Ai
      # AI Translate Strings
      # @param user_id [Integer] User ID
      # @param query [Hash] Request Body
      # @see https://support.crowdin.com/developer/api/v2/#tag/AI/operation/api.users.ai.translate.strings.post 
      def ai_translate_strings(user_id = nil, query = {})
        user_id || raise_parameter_is_required_error(:user_id)

        path = enterprise_mode? ? "/ai/translations/translate-strings" : "/users/#{user_id}/ai/translations/translate-strings"

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}#{path}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end