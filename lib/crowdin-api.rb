require 'logger'
require 'rexml/document'
require 'rest_client'

require "crowdin-api/errors"
require "crowdin-api/methods"
require "crowdin-api/version"

#log = Logger.new(STDOUT)
#RestClient.log = log
#log.level = Logger::DEBUG

module Crowdin
  class API

    def initialize(options = {})
      @api_key            = options.delete(:api_key)
      @project_identifier = options.delete(:project_identifier)
      @account_key        = options.delete(:account_key)

      url = 'http://api.crowdin.net'

      options = {
        :headers                => {},
        :params                 => {},
        :key                    => @api_key,
        :'account-key'          => @account_key,
      }.merge(options)

      options[:headers] = {
        'Accept'                => 'application/xml',
        'User-Agent'            => "crowdin-rb/#{Crowdin::API::VERSION}",
        'X-Ruby-Version'        => RUBY_VERSION,
        'X-Ruby-Platform'       => RUBY_PLATFORM
      }.merge(options[:headers])

      options[:params] = {
        :key                    => @api_key,
        :'account-key'          => @account_key,
      }.merge(options[:params])

      @options = options
      @connection = RestClient::Resource.new(url, options)
    end

    def request(params, &block)
      case params[:method]
      when :post
        query = @options.merge(params[:query] || {})
        @connection[params[:path]].post(query) { |response, request, result, &block|
          @response = response
        }
      when :get
        query = @options[:params].merge(params[:query] || {})
        @connection[params[:path]].get(:params => query) { |response, request, result, &block|
          @response = response
        }
      end

      if @response.headers[:content_disposition]
        filename = params[:output] || @response.headers[:content_disposition][/attachment; filename="(.+?)"/, 1]
        body = @response.body
        file = open(filename, 'wb')
        file.write(body)
        return true
      else
        doc = REXML::Document.new @response.body
        if doc.elements['error']
          code    = doc.elements['error'].elements['code'].text
          message = doc.elements['error'].elements['message'].text
          error = Crowdin::API::Errors::Error.new(code, message)
          raise(error)
        else
          # leave non-JSON body as is
          return @response
        end
      end

    end

    private

  end
end
