require 'rest_client'

require "crowdin-api/errors"
require "crowdin-api/methods"
require "crowdin-api/version"

module Crowdin
  class API

    def initialize(options = {})
      @api_key            = options.delete(:api_key)
      @project_identifier = options.delete(:project_identifier)

      options = {
        :headers => {},
        :params  => {},
        :host    => 'api.crowdin.net',
        :scheme  => 'http',
        :key     => @api_key,
        :params  => {:key => @api_key}
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
      @connection = RestClient::Resource.new("#{options[:scheme]}://#{options[:host]}", options)
    end

    def request(params, &block)
      puts params
      @connection[params[:path]].send(params[:method], @options.merge(params[:query])){ |response, request, result, &block|
        puts request.headers
        return response
      }
    end

    private

  end
end
