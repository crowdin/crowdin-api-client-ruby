module Crowdin
  module Web

    class Query
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
      def initialize(connection, method, path, query={}, headers={})
        @connection = connection
        @method     = method
        @path       = path
        @payload    = Query.new(method, query).perform
        @headers    = headers
        @output     = nil
      end

      def process_request!
        if @method.eql?(:delete)
          @response = @connection[@path].send(@method)
        elsif @method.eql?(:get)
          @response = @connection[@path].send(@method, @payload)
        else
          @connection[@path].send(@method, @payload, @headers) { |response, _, _| @response = response }
        end
      end

      def process_response!
        log! "args: #{@response.request.args}"

        doc = JSON.load(@response.body)

        log! "body: #{doc}"

        doc
      end

      private

      def parse_error!(errors)
        #TODO
      end

      def write_file!(output, response)
        #TODO
      end
    end

  end
end
