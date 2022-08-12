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

    include Web::FetchAllExtensions

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

    #
    # FetchAll options:
    # * limit, Integer, default: 500 | How many records need to load per one request
    # * offset, Integer, default: 0 | How many records need to skip
    # * request_delay, Integer (seconds), default: 0 | Delay between requests
    #
    #
    # Note: Please, specify project_id while Client initialization if you need to use methods that need it within FetchAll
    #
    # === Example
    #
    #  @crowdin.fetch_all(:list_projects)
    #
    # with specified options
    #
    #  @crowdin.fetch_all(:list_projects, { limit: 10, request_delay: 1 })
    #
    # playing with response per fetch. Note: the block actually don't make any effect to finite result
    #
    #  @crowdin.fetch_all(:list_projects, { limit: 10, request_delay: 1 }) { |response| puts response['data'] }
    #
    # also you can specify retry configuration to handle some exceptions
    #
    # Retry configuration options:
    # * request_delay, Integer (seconds), default: 0 | Delay between retries
    # * retries_count, Integer, default: 0
    # * error_messages, Array
    #
    #  @crowdin.fetch_all(:list_projects, {}, { request_delay: 2, retries_count: 3, error_messages: ['401'] })
    #
    # fetch all execution will be terminated if response error are same as in error_messages array
    # otherwise system will retry so many times, as indicated at tries_count
    #
    def fetch_all(api_resource, opts = {}, retry_opts = {})
      unless Web::FetchAllExtensions::API_RESOURCES_FOR_FETCH_ALL.include?(api_resource)
        raise(Errors::FetchAllProcessingError, "#{api_resource} method aren't supported for FetchAll")
      end

      limit = opts[:limit] || Web::FetchAllExtensions::MAX_ITEMS_COUNT_PER_REQUEST
      offset = opts[:offset] || 0
      request_delay = opts[:request_delay] || 0

      retry_request_delay = retry_opts[:request_delay] || 0
      retries_count = retry_opts[:retries_count] || 0
      retry_error_messages = retry_opts[:error_messages] || []

      result = []
      loop do
        response = case api_resource
        when :list_terms
          send(api_resource, opts[:glossary_id], { limit: limit, offset: offset })
        when :list_file_revisions
          send(api_resource, opts[:file_id], { limit: limit, offset: offset })
        else
          send(api_resource, { limit: limit, offset: offset })
        end

        if response.is_a?(String) && response.match('Something went wrong')
          if retries_count.positive?
            retry_error_messages.each do |message|
              break if response.match(message)
            end

            retries_count -= 1
            sleep retry_request_delay
          else
            raise(Errors::FetchAllProcessingError, response)
          end
        else
          yield response if block_given?
          deserialized_response = response['data']
          result.concat(deserialized_response)
          offset += deserialized_response.size
          break if deserialized_response.size < limit
        end

        sleep request_delay
      end
      result
    rescue StandardError => e
      raise(Errors::FetchAllProcessingError, "FetchAll wasn't processed. Details - #{e.message}")
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
