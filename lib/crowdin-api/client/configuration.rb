# frozen_string_literal: true

module Crowdin
  class Configuration
    attr_accessor :api_token
    attr_accessor :project_id
    attr_accessor :organization_domain
    attr_accessor :request_timeout

    attr_accessor :enable_logger
    alias logger_enabled? enable_logger

    attr_reader :target_api_url

    def initialize
      @target_api_url = '/api/v2'
    end

    def options
      {
        headers: {},
        timeout: request_timeout,
        json:    true
      }
    end

    def headers
      {
        'Accept'        => 'application/json',
        'Authorization' => "Bearer #{api_token}",
        'Content-Type'  => 'application/json',
        'User-Agent'    => "crowdin-rb/#{Crowdin::Client::VERSION}/#{RUBY_VERSION}/#{RUBY_PLATFORM}"
      }
    end

    def base_url
      @base_url ||=
        if !!organization_domain
          if organization_domain.include?('.com')
            "https://#{organization_domain}"
          else
            "https://#{organization_domain}.api.crowdin.com"
          end
        else
          'https://api.crowdin.com'
        end
    end
  end
end
