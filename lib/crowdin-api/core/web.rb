module Crowdin
  module Web

    class Query
      attr_reader :method, :query

      def initialize(method, query, options={})
        @method     = method
        @query      = query
        @file_query = options.delete(:file_query)
      end

      def perform
        if @file_query
          @query
        elsif @method.eql?(:get)
          { params: get_cleared_query }
        else
          JSON.generate(get_cleared_query)
        end
      end

      private

      def get_cleared_query
        @query.reject { |_, value| value.nil? }
      end
    end

    class Request < Client
      def initialize(connection, method, path, query, file_query=false)
        @connection = connection
        @method     = method
        @path       = path
        @payload    = Query.new(method, query, file_query: file_query).perform
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

          # doc.kind_of?(Hash) && doc['errors'].any? => errors output
          doc
        end
      end

      private

      def parse_error!(doc)
        key     = doc['key']
        code    = doc['error']['code']
        message = doc['error']['message']
        error   = Errors::Error.new(key, code, message)

        error.to_s
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
