# frozen_string_literal: true

module Crowdin
  class Configuration
    attr_accessor :api_token
    attr_accessor :project_id
    attr_accessor :organization_domain
    attr_accessor :enable_logger

    attr_reader :target_api_url

    def initialize
      @target_api_url = '/api/v2'
    end

    def options
      {
        headers: {},
        timeout: nil,
        json: true
      }
    end

    def headers
      {
        'Accept' => 'application/json',
        'Authorization' => "Bearer #{api_token}",
        'Content-Type' => 'application/json',
        'User-Agent' => "crowdin-rb/#{Crowdin::Client::VERSION}/#{RUBY_VERSION}/#{RUBY_PLATFORM}"
      }
    end

    def base_url
      if organization_domain
        !!organization_domain.scan(/.com/) ? organization_domain : "https://#{organization_domain}.api.crowdin.com"
      else
        'https://api.crowdin.com'
      end
    end

    def logger_enabled?
      enable_logger
    end
  end
end
