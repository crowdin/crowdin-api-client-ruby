# frozen_string_literal: true

#
# A wrapper and interface to the Crowdin API. Please visit the Crowdin developers site
# for a full explanation of what each of the Crowdin api methods expect and perform.
#
# https://support.crowdin.com/api/v2/
# https://support.crowdin.com/enterprise/api/
#
module Crowdin
  #
  # === Example
  #
  #  require 'crowdin-api'
  #
  #  crowdin = Crowdin::Client.new do |config|
  #    config.api_token = 'YOUR_API_TOKEN'
  #  end
  #
  #  crowdin.list_projects
  #
  class Client
    # Processing all API Resources modules to include them to the Client
    API_RESOURCES_MODULES.each do |module_name|
      Client.send(:include, Object.const_get("Crowdin::ApiResources::#{module_name}"))
    end

    # Processing all Error Raisers modules to include them to the Client
    ERROR_RAISERS_MODULES.each do |module_name|
      Client.send(:include, Object.const_get("Crowdin::Errors::#{module_name}"))
    end

    attr_reader :config
    attr_reader :connection
    attr_reader :options
    attr_reader :logger

    def initialize(&block)
      build_configuration(&block)

      check_logger
      check_rest_client_proxy

      build_connection
    end

    def log!(message)
      !config.logger_enabled? || logger.debug(message)
    end

    def logger=(logger)
      raise_logger_are_not_enabled_error unless config.logger_enabled?
      @logger = logger
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
