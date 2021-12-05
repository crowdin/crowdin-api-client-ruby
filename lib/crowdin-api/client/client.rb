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
    include ApiResources::Languages
    include ApiResources::Projects
    include ApiResources::SourceFiles
    include ApiResources::Storages
    include ApiResources::TranslationStatus
    include ApiResources::Translations

    attr_reader :config
    attr_reader :connection
    attr_writer :logger

    def initialize
      raise ArgumentError, 'block with configurations not given' unless block_given?

      @config = Crowdin::Configuration.new
      yield config

      check_logger

      set_rest_client_proxy!

      build_connection
    end

    def log!(message)
      return true unless config.logger_enabled?

      logger.debug(message)
    end

    def build_connection
      @connection ||= ::RestClient::Resource.new(config.base_url, build_options)
    end

    private

    def set_rest_client_proxy!
      ENV['http_proxy'] ? ::RestClient.proxy = ENV['http_proxy'] : false
    end

    def build_options
      config.options.merge(headers: config.headers)
    end

    def check_logger
      config.enable_logger ? logger : config.enable_logger = false
    end

    def logger
      @logger ||= Logger.new($stderr)
    end
  end
end
