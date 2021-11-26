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
        @errors = []
      end

      def process_request!
        begin
          return @response = @connection[@path].send(@method)           if delete_request?
          return @response = @connection[@path].send(@method, @payload) if get_request?

          @connection[@path].send(@method, @payload, @headers) { |response, _, _| @response = response }
        rescue
          log! $!.class

          @errors <<  "Something went wrong while proccessing request. Details - #{$!.class.to_s}"
        end
      end

      def process_response!
        return get_errors if @errors.any?

        begin
          if @response
            log! "args: #{@response.request.args}"

            doc = JSON.load(@response.body)

            log! "body: #{doc}"

            data = doc['data'].is_a?(Hash) && doc['data']['url'] && doc['data']['url'].scan(/response-content-disposition/) ?
              downlaod_file!(doc['data']['url']) : doc

            @errors.any? ? get_errors : data
          end
        rescue
          log! $!

          @errors << "Something went wrong while proccessing response. Details - #{$!.class.to_s}"

          get_errors
        end
      end

      private

      def parse_error!(errors); end

      def get_errors
        @errors.join(';')
      end

      def downlaod_file!(url)
        begin
          download = URI.parse(url).open
          IO.copy_stream(download, @destination)

          @destination
        rescue
          log! $!

          @errors << "Something went wrong while downloading file. Details - #{$!.class.to_s}"
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
