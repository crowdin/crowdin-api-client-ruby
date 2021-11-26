# The Crowdin::Client library is used for interactions with a crowdin.com website.
#
# == Example
#
#   require 'crowdin-api'
#
#   crowdin = Crowdin::Client.new(api_key: API_KEY)
#
module Crowdin
  class Client

    # TODO
    # handle status codes after request
    # handle and parse validation erorrs after request
    # cover comments to all methods

    include API::Languages
    include API::Projects
    include API::SourceFiles
    include API::Storages
    include API::TranslationStatus
    include API::Translations

    attr_accessor :project_id

    # Create a new Client object using the given settings.
    #
    # == Settings
    #
    # * *api_key* [String] - the authentication API key can be found on the account settings page
    # * *project_id* [String] - the project identifier, default - nil
    # * *organization_domain* [String] - the name of your organization, only for enterprise
    #
    def initialize(options = {})
      @api_key    = options.delete(:api_key)
      @project_id = options.delete(:project_id) || nil
      @base_url   = options[:organization_domain] ?
                      "https://#{options.delete(:organization_domain)}.api.crowdin.com" : 'https://api.crowdin.com'

      @target_api_url = '/api/v2'

      options = {
        :headers          => {},
        :timeout          => nil,
        :json             => true
      }

      options[:headers] = {
        'Accept'          => 'application/json',
        'Authorization'   => "Bearer #{@api_key}",
        'Content-Type'    => 'application/json',
        'User-Agent'      => "crowdin-rb/#{Crowdin::Client::VERSION}",
        'X-Ruby-Version'  => RUBY_VERSION,
        'X-Ruby-Platform' => RUBY_PLATFORM
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
