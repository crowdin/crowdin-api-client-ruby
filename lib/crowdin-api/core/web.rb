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

        @method.eql?(:get) ? { params: get_cleared_query } : get_cleared_query.to_json
      end

      private

      def get_cleared_query
        @query.reject { |_, value| value.nil? }
      end
    end

    class Request < Client
      def initialize(connection, method, path, query={}, headers={}, destionation=nil)
        @connection  = connection
        @method      = method
        @path        = path
        @payload     = Payload.new(method, query).perform
        @headers     = headers
        @destination = destionation
      end

      def process_request!
        return @response = @connection[@path].send(@method)           if delete_request?
        return @response = @connection[@path].send(@method, @payload) if get_request?

        @connection[@path].send(@method, @payload, @headers) { |response, _, _| @response = response }
      end

      def process_response!
        log! "args: #{@response.request.args}"

        doc = JSON.load(@response.body)

        log! "body: #{doc}"

        doc['data']['url'] && doc['data']['url'].scan(/response-content-disposition/) ?
          downlaod_file!(doc['data']['url']) : doc
      end

      private

      def parse_error!(errors); end

      def downlaod_file!(url)
        download = URI.parse(url).open
        IO.copy_stream(download, @destination)
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
