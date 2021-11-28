# frozen_string_literal: true

# The Crowdin::Client library is used for interactions with a crowdin.com website.
#
# == Example
#
#   require 'crowdin-api'
#
#   crowdin = Crowdin::Client.new do |config|
#     config.api_token = 'YOUR_API_TOKEN'
#   end
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

    attr_reader :config
    attr_reader :options
    attr_reader :connection

    def initialize
      raise ArgumentError, 'block with configurations not given' unless block_given?

      @config = Crowdin::Configuration.new
      yield config

      check_logger!
      set_rest_client_proxy!

      build_options
      build_connection
    end

    def log!(message)
      return true unless config.logger

      log.debug(message)
    end

    def log=(logger)
      @log = logger
      config.logger = true
    end

    protected

    def build_options
      @options = config.options
      options[:headers] = config.headers
    end

    def build_connection
      @connection = ::RestClient::Resource.new(config.base_url, options)
    end

    private

    def set_rest_client_proxy!
      ENV['http_proxy'] ? ::RestClient.proxy = ENV['http_proxy'] : false
    end

    def check_logger!
      config.logger ||= false
    end

    def log
      @log ||= Logger.new($stderr)
    end
  end
end
