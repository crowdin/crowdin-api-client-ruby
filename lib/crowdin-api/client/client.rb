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
    # Processing API Resources modules to include them to the Client
    API_RESOURCES_MODULES.each do |module_name|
      Client.send(:include, Object.const_get("Crowdin::ApiResources::#{module_name}"))
    end

    # Processing Error Raisers modules to include them to the Client
    ERROR_RAISERS_MODULES.each do |module_name|
      Client.send(:include, Object.const_get("Crowdin::Errors::#{module_name}"))
    end

    # Config instance that includes configuration options for the Client
    attr_reader :config
    # Instance with established connection through RestClient to the Crowdin API
    attr_reader :connection
    # Instance with options and headers for RestClient connection
    attr_reader :options
    # Logger instance
    attr_reader :logger

    def initialize(&block)
      build_configuration(&block)

      update_logger
      update_rest_client_proxy

      build_connection
    end

    def log(message)
      !logger_enabled? || logger.debug(message)
    end

    def logger=(logger)
      raise_logger_are_not_enabled_error unless logger_enabled?

      @logger = logger
      update_rest_client_logger
    end

    def enterprise_mode?
      !!config.organization_domain
    end

    def logger_enabled?
      config.logger_enabled?
    end

    private

      def build_configuration
        @config = Crowdin::Configuration.new
        yield config if block_given?
      end

      def build_connection
        build_options
        @connection ||= ::RestClient::Resource.new(config.base_url, options)
      end

      def build_options
        @options ||= config.options.merge(headers: config.headers)
      end

      def set_default_logger
        require 'logger'
        @logger ||= Logger.new($stdout)
        update_rest_client_logger
      end

      def update_rest_client_logger
        ::RestClient.log = @logger
      end

      def update_rest_client_proxy
        ENV['http_proxy'] ? ::RestClient.proxy = ENV.fetch('http_proxy') : false
      end

      def update_logger
        config.logger_enabled? ? set_default_logger : config.enable_logger = false
      end
  end
end
