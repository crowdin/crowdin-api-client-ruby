# The Crowdin::Client library is used for interactions with a crowdin.com website.
#
# == Example
#
#   require 'crowdin-api'
#
#   crowdin = Crowdin::Client.new(:api_key => API_KEY, :project_id => PROJECT_ID)
#
module Crowdin
  class Client

    include Requests
    include API::Projects

    # Create a new API object using the given parameters.
    #
    # Params:
    #
    # *api_key* [String] - the authentication API key can be found on the project settings page
    #
    # *project_id* [String] - the project identifier
    #
    # *base_url* [String] - the url of the Crowdin API
    #
    def initialize(options = {})
      @api_key    = options.delete(:api_key)
      @project_id = options.delete(:project_id)
      @base_url   = options.delete(:base_url) || 'https://api.crowdin.com'

      @api_version_url = '/api/v2'

      options = {
        :headers                => {},
        :timeout                => nil,
        :json                   => true
      }

      options[:headers] = {
        'Accept'                => 'application/json',
        'Authorization'         => "Bearer #{@api_key}",
        'Content-Type'          => 'application/json',
        'User-Agent'            => "crowdin-rb/#{Crowdin::Client::VERSION}",
        'X-Ruby-Version'        => RUBY_VERSION,
        'X-Ruby-Platform'       => RUBY_PLATFORM
      }

      set_rest_client_proxy!
      @connection = RestClient::Resource.new(@base_url, options)
    end

    def log!(message)
      log.debug(message)
    end

    def log=(logger)
      @log = logger
    end

    private

    def set_rest_client_proxy!
      ENV['http_proxy'] ? RestClient.proxy = ENV['http_proxy'] : false
    end

    def log
      @log ||= Logger.new($stderr)
    end

  end
end
