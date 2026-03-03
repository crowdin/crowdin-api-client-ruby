# frozen_string_literal: true

module Crowdin
  module ApiResources
    module AI
      # https://support.crowdin.com/developer/api/v2/#tag/AI/operation/api.users.ai.translate.strings.post
      def ai_translate_strings(user_id = nil, query = {})
        user_id || raise_parameter_is_required_error(:user_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/users/#{user_id}/ai/translations/translate-strings",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
