require 'pp'
require 'logger'
require 'json'
require 'rest-client'

require "crowdin-api/errors"
require "crowdin-api/methods"
require "crowdin-api/version"

#log = Logger.new(STDOUT)
#RestClient.log = log
#log.level = Logger::DEBUG

module Crowdin
  class API

    # Create a new API object using the given parameters.
    #
    # @param [String] api_key the authentication API key can be found on the project settings page
    # @param [String] project_id the project identifier.
    # @param [String] account_key the account API Key
    # @param [String] base_url the url of the Crowdin API
    #
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
        :json                   => true
      }.merge(options)

      options[:headers] = {
        'Accept'                => 'application/json',
        'User-Agent'            => "crowdin-rb/#{Crowdin::API::VERSION}",
        'X-Ruby-Version'        => RUBY_VERSION,
        'X-Ruby-Platform'       => RUBY_PLATFORM
      }.merge(options[:headers])

      options[:params] = {
        :key                    => @api_key,
        :'account-key'          => @account_key,
        :json                   => true
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
        doc = JSON.parse(@response.body)
        if doc.kind_of?(Hash) && doc['code']
          code    = doc['code']
          message = doc['message']
          error   = Crowdin::API::Errors::Error.new(code, message)
          raise(error)
        else
          return doc
        end
      end

    end

    private

  end
end
