# frozen_string_literal: true

module Crowdin
  module Web
    class Request
      attr_reader :connection
      attr_reader :method
      attr_reader :payload

      def initialize(connection, method, url, payload = {})
        @connection = connection[url]
        @method     = method
        @payload    = build_payload(payload)
      end

      def get?
        method.eql?(:get)
      end

      def get
        connection.get(prepare_payload(payload[:params]))
      end

      def delete?
        method.eql?(:delete)
      end

      def delete
        connection.delete
      end

      def patch?
        method.eql?(:patch)
      end

      def patch
        connection.patch(prepare_payload(payload[:params]), payload[:headers]) { |response, _, _| response }
      end

      def post?
        method.eql?(:post)
      end

      def post
        connection.post(prepare_payload(payload[:params]), payload[:headers]) { |response, _, _| response }
      end

      def put?
        method.eql?(:put)
      end

      def put
        connection.put(prepare_payload(payload[:params]), payload[:headers]) { |response, _, _| response }
      end

      private

        def build_payload(payload)
          %i[params headers].each do |key|
            payload[key] ||= {}
          end
          payload
        end

        def prepare_payload(params)
          return params if params.is_a?(File)

          get? ? { params: fetch_cleared_params(params) } : fetch_cleared_params(params).to_json
        end

        def fetch_cleared_params(params)
          case params
          when Array
            params.map { |el| el.reject { |_, value| value.nil? } }.reject(&:empty?)
          when Hash
            params.reject { |_, value| value.nil? }
          else
            params
          end
        end
    end
  end
end
