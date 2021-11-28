# frozen_string_literal: true

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
    # A wrapper and interface to the Crowdin api. Please visit the Crowdin developers
    # site for a full explanation of what each of the Crowdin api methods
    # expect and perform.
    #
    # https://support.crowdin.com/api/v2/
    #
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
    # * *api_token* [String] - the authentication API token can be found on the account settings page
    # * *project_id* [Integer] - the project identifier, default - nil
    # * *organization_domain* [String] - the name of your organization, only for enterprise
    #
    def initialize(options = {})
      @api_token  = options.delete(:api_token)
      @project_id = options.delete(:project_id) || nil
      @base_url   = if options[:organization_domain]
                      "https://#{options.delete(:organization_domain)}.api.crowdin.com"
                    else
                      'https://api.crowdin.com'
                    end

      @target_api_url = '/api/v2'

      options = {
        headers: {},
        timeout: nil,
        json: true
      }

      options[:headers] = {
        'Accept' => 'application/json',
        'Authorization' => "Bearer #{@api_token}",
        'Content-Type' => 'application/json',
        'User-Agent' => "crowdin-rb/#{Crowdin::Client::VERSION}/#{RUBY_VERSION}/#{RUBY_PLATFORM}"
      }

      set_rest_client_proxy!
      @connection = ::RestClient::Resource.new(@base_url, options)
    end

    def log!(message)
      log.debug(message)
    end

    def log=(logger)
      @log = logger
    end

    private

    def set_rest_client_proxy!
      ENV['http_proxy'] ? ::RestClient.proxy = ENV['http_proxy'] : false
    end

    def log
      @log ||= Logger.new($stderr)
    end
  end
end