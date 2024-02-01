# frozen_string_literal: true

module Crowdin
  module Web
    class SendRequest
      attr_reader :request

      def initialize(request, file_destination = nil, download: false)
        @request          = request
        @file_destination = file_destination
        @download         = download
        @errors           = []
      end

      def perform
        parse_response(process_request)
      end

      private

        def process_request
          request.send(request.method)
        rescue StandardError => e
          @errors << "Something went wrong while request processing. Details - #{e.message}"
        end

        def parse_response(response)
          return @errors.join('; ') if @errors.any?

          begin
            if response
              if response.body.empty?
                response.code
              else
                parsed_body = JSON.parse(response.body)
                parsed_response = fetch_response_data(parsed_body)

                @errors.any? ? @errors.join('; ') : parsed_response
              end
            end
          rescue StandardError => e
            @errors << "Something went wrong while response processing. Details - #{e.message}"
            @errors.join('; ')
          end
        end

        def fetch_response_data(doc)
          if @download && doc['data'].is_a?(Hash) && doc.dig('data', 'url')&.include?('response-content-disposition')
            download_file(doc['data']['url'])
          else
            doc
          end
        end

        def download_file(url)
          download    = URI.parse(url).open
          destination = @file_destination || download.meta['content-disposition']
                                                     .match(/filename=("?)(.+)\1/)[2]

          IO.copy_stream(download, destination)

          destination
        rescue StandardError => e
          @errors << "Something went wrong while downloading file. Details - #{e.message}"
        end
    end
  end
end
