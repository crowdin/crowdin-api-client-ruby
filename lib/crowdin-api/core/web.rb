module Crowdin
  module Web

    class Query
      attr_reader :method, :query, :cleared_query

      def initialize(method, query)
        @method        = method
        @query         = query
        @cleared_query = get_cleared_query
      end

      def perform
        @method.eql?(:get) ? { params: @cleared_query } : JSON.generate(@cleared_query)
      end

      private

      def get_cleared_query
        @query.reject { |_, value| value.nil? }
      end
    end

    class Request < Client
      def initialize(connection, method, path, query)
        @connection = connection
        @method     = method
        @path       = path
        @payload    = Query.new(method, query).perform
        @output     = nil
      end

      def process_request!
        @connection[@path].send(@method, @payload) { |response, _, _| @response = response }
      end

      def process_response!
        log! "args: #{@response.request.args}"

        if @response.headers[:content_disposition]
          write_file!(@output, @response)
        else
          doc = JSON.load(@response.body)

          log! "body: #{doc}"

          doc.kind_of?(Hash) && doc['success'] == false ? raise_error!(doc) : doc
        end
      end

      private

      def raise_error!(doc)
        code    = doc['error']['code']
        message = doc['error']['message']
        error   = Errors::Error.new(code, message)

        raise(error)
      end

      def write_file!(output, response)
        filename = output || response.headers[:content_disposition][/attachment; filename="(.+?)"/, 1]
        body = response.body
        file = open(filename, 'wb')
        file.write(body)
        file.close
      end
    end

  end
end
