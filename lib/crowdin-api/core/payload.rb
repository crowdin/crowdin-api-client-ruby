# frozen_string_literal: true

module Crowdin
  module Web
    class Payload
      attr_reader :method, :query

      def initialize(method, query)
        @method = method
        @query  = query
      end

      def perform
        return @query if @query.is_a?(File)

        @method.eql?(:get) ? { params: fetch_cleared_query } : fetch_cleared_query.to_json
      end

      private

      def fetch_cleared_query
        @query.reject { |_, value| value.nil? }
      end
    end
  end
end
