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

    class Request < Client
      def initialize(connection, method, path, query = {}, headers = {}, destination = nil)
        @connection  = connection
        @method      = method
        @path        = path
        @payload     = Payload.new(method, query).perform
        @headers     = headers
        @destination = destination
        @errors      = []
      end

      def process_request!
        return @response = @connection[@path].send(@method)           if delete_request?
        return @response = @connection[@path].send(@method, @payload) if get_request?

        @connection[@path].send(@method, @payload, @headers) { |response, _, _| @response = response }
      rescue StandardError
        log! $!.class

        @errors << "Something went wrong while proccessing request. Details - #{$!.class}"
      end

      def process_response!
        return fetch_errors! if @errors.any?

        begin
          if @response
            log! "args: #{@response.request.args}"

            doc = JSON.parse(@response.body)

            log! "body: #{doc}"

            data =
              if doc['data'].is_a?(Hash) && doc['data']['url'] && doc['data']['url'].scan(/response-content-disposition/)
                downlaod_file!(doc['data']['url'])
              else
                doc
              end

            @errors.any? ? fetch_errors! : data
          end
        rescue StandardError
          log! $!

          @errors << "Something went wrong while proccessing response. Details - #{$!.class}"

          fetch_errors!
        end
      end

      private

      def parse_errors!(errors); end

      def fetch_errors!
        @errors.join(';')
      end

      def downlaod_file!(url)
        download = URI.parse(url).open
        IO.copy_stream(download, @destination)

        @destination
      rescue StandardError
        log! $!

        @errors << "Something went wrong while downloading file. Details - #{$!.class}"
      end

      def get_request?
        @method.eql?(:get)
      end

      def delete_request?
        @method.eql?(:delete)
      end
    end
  end
end
