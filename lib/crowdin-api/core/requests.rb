module Crowdin
  module Requests

    def get_request(params)
      @connection[params[:path]]
        .get(params: params[:query] || {}) { |response, _, _| process_response! response }
    end

    def post_request(params)
      @connection[params[:path]]
        .post(prepare_payload(params[:query])) { |response, _, _| process_response! response }
    end

    def put_request(params)
      @connection[params[:path]]
        .put(prepare_payload(params[:query])) { |response, _, _| process_response! response }
    end

    def patch_request(params)
      @connection[params[:path]]
        .patch([prepare_payload(params[:query])]) { |response, _, _| process_response! response }
    end

    def delete_request(params)
      @connection[params[:path]]
        .delete(prepare_payload(params[:query])) { |response, _, _| process_response! response }
    end

    def clear_query(query)
      query.reject { |_, value| value.nil? }
    end

    def prepare_payload(query)
      cleared_query = clear_query(query)

      cleared_query.any? ? JSON.generate(cleared_query) : {}
    end

    def process_response!(response)
      log! "args: #{response.request.args}"

      if response.headers[:content_disposition]
        filename = params[:output] || @esponse.headers[:content_disposition][/attachment; filename="(.+?)"/, 1]
        body = response.body
        file = open(filename, 'wb')
        file.write(body)
        file.close
      else
        doc = JSON.load(response.body)

        log! "body: #{doc}"

        if doc.kind_of?(Hash) && doc['success'] == false
          code    = doc['error']['code']
          message = doc['error']['message']
          error   = Crowdin::Errors::Error.new(code, message)

          raise(error)
        else
          return doc
        end
      end
    end

  end
end
