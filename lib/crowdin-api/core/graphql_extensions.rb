# frozen_string_literal: true

module Crowdin
  module Web
    module GraphqlExtensions
      def graphql(query = nil, **request_options)
        url = request_options.delete(:url)
        graphql_query = query || request_options

        response = ::RestClient::Request.execute(
          {
            method: :post,
            url: url || "#{config.base_url}/api/graphql",
            payload: graphql_query.to_json
          }.merge(options)
        ) { |res, _, _| res }

        response.body.empty? ? response.code : JSON.parse(response.body)
      end
    end
  end
end
