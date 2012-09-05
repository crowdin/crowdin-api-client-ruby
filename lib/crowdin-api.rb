require 'logger'
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

      url = 'http://api.crowdin.net'

      options = {
        :headers => {},
        :params  => {},
        :key     => @api_key,
      }.merge(options)

      options[:headers] = {
        'Accept'                => 'application/xml',
        'User-Agent'            => "crowdin-rb/#{Crowdin::API::VERSION}",
        'X-Ruby-Version'        => RUBY_VERSION,
        'X-Ruby-Platform'       => RUBY_PLATFORM
      }.merge(options[:headers])

      options[:params] = {
        :key                    => @api_key
      }.merge(options[:params])

      @options = options
      @connection = RestClient::Resource.new(url, options)
    end

    def request(params, &block)
      case params[:method]
      when :post
        @connection[params[:path]].post(@options.merge(params[:query] || {})) { |response, request, result, &block|
          return response
        }
      when :get
        @connection[params[:path]].get(:params => @options[:params].merge(params[:query] || {})) { |response, request, result, &block|
          return response
        }
      end
    end

    private

  end
end
