# frozen_string_literal: true

#
# The Crowdin::Client library is used for interactions with a crowdin.com website.
#
# == Example
#
#  require 'crowdin-api'
#
#  crowdin = Crowdin::Client.new do |config|
#    config.api_token = 'YOUR_API_TOKEN'
#  end
#
#  crowdin.list_projects
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
    include ApiResources::Workflows
    include ApiResources::SourceStrings

    include Errors::ApiErrorsRaiser

    attr_accessor :logger

    attr_reader :config
    attr_reader :connection
    attr_reader :options

    def initialize(&block)
      build_configuration(&block)

      check_logger
      check_rest_client_proxy

      build_connection
    end

    def log!(message)
      !config.logger_enabled? || logger.debug(message)
    end

    private

    def build_configuration
      @config = Crowdin::Configuration.new
      yield config if block_given?
    end

    def build_connection
      @connection ||= ::RestClient::Resource.new(config.base_url, build_options)
    end

    def build_options
      @options ||= config.options.merge(headers: config.headers)
    end

    def set_default_logger
      require 'logger'
      @logger ||= Logger.new($stderr)
    end

    def check_rest_client_proxy
      ENV['http_proxy'] ? ::RestClient.proxy = ENV['http_proxy'] : false
    end

    def check_logger
      config.logger_enabled? ? set_default_logger : config.enable_logger = false
    end
  end
end
