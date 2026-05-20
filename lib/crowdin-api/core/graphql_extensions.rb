# frozen_string_literal: true

module Crowdin
  module Web
    module GraphqlExtensions
      def graphql(query = {}, url: nil)
        response = ::RestClient::Request.execute(
          {
            method: :post,
            url: url || "#{config.base_url}/api/graphql",
            payload: query.to_json
          }.merge(options)
        )

        response.body.empty? ? response.code : JSON.parse(response.body)
      rescue StandardError => e
        e.message
      end
    end
  end
end
