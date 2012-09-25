require 'logger'
require 'rexml/document'
require 'rest-client'

require "crowdin-api/errors"
require "crowdin-api/methods"
require "crowdin-api/version"

#log = Logger.new(STDOUT)
#RestClient.log = log
#log.level = Logger::DEBUG

module Crowdin
  class API

    def initialize(options = {})
      @api_key     = options.delete(:api_key)
      @project_id  = options.delete(:project_id)
      @account_key = options.delete(:account_key)
      @base_url    = options.delete(:base_url) || 'http://api.crowdin.net'

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

      @connection = RestClient::Resource.new(@base_url, options)
    end

    def request(params, &block)
      case params[:method]
      when :post
        query = @connection.options.merge(params[:query] || {})
        @connection[params[:path]].post(query) { |response, _, _|
          @response = response
        }
      when :get
        query = @connection.options[:params].merge(params[:query] || {})
        @connection[params[:path]].get(:params => query) { |response, _, _|
          @response = response
        }
      end

      if @response.headers[:content_disposition]
        filename = params[:output] || @response.headers[:content_disposition][/attachment; filename="(.+?)"/, 1]
        body = @response.body
        file = open(filename, 'wb')
        file.write(body)
        file.close
        return true
      else
        doc = REXML::Document.new @response.body
        if doc.elements['error']
          code    = doc.elements['error'].elements['code'].text
          message = doc.elements['error'].elements['message'].text
          error   = Crowdin::API::Errors::Error.new(code, message)
          raise(error)
        else
          # leave body as is
          return @response
        end
      end

    end

    private

  end
end
