# frozen_string_literal: true

module Crowdin
  module Web
    class Request
      attr_reader :client

      def initialize(client, method, path, query = {}, headers = {}, destination = nil)
        @client      = client
        @method      = method
        @full_path   = client.config.target_api_url + path
        @payload     = Payload.new(method, query).perform
        @headers     = headers
        @destination = destination
        @errors      = []
      end

      def perform
        process_request!
        process_response!
      end

      def process_request!
        return @response = client.connection[@full_path].delete        if delete_request?
        return @response = client.connection[@full_path].get(@payload) if get_request?

        client.connection[@full_path].send(@method, @payload, @headers) { |response, _, _| @response = response }
      rescue StandardError => error
        client.log! error.class

        @errors << "Something went wrong while proccessing request. Details - #{error.class}"
      end

      def process_response!
        return fetch_errors if @errors.any?

        begin
          if @response
            doc = JSON.parse(@response.body)

            client.log! "args: #{@response.request.args}"
            client.log! "body: #{doc}"

            data = fetch_response_data(doc)

            @errors.any? ? fetch_errors : data
          end
        rescue StandardError => error
          client.log! error

          @errors << "Something went wrong while proccessing response. Details - #{error.class}"

          fetch_errors
        end
      end

      private

      def fetch_errors
        @errors.join(';')
      end

      def download_file(url)
        download = URI.parse(url).open
        IO.copy_stream(download, @destination)

        @destination
      rescue StandardError => error
        client.log! error

        @errors << "Something went wrong while downloading file. Details - #{error.class}"
      end

      def fetch_response_data(doc)
        if doc['data'].is_a?(Hash) && doc['data']['url'] && doc['data']['url'].scan(/response-content-disposition/)
          download_file(doc['data']['url'])
        else
          doc
        end
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
