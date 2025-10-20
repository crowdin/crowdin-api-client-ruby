# frozen_string_literal: true

module Crowdin
  # API Resources modules
  API_RESOURCES_MODULES = %i[Storages Languages Projects Workflows SourceFiles Translations SourceStrings
                             StringTranslations StringComments Screenshots Glossaries TranslationMemory
                             MachineTranslationEngines Reports Tasks Users Teams Vendors Webhooks
                             Dictionaries Distributions Labels TranslationStatus Bundles Notifications
                             Applications StringCorrections].freeze

  # Error Raisers modules
  ERROR_RAISERS_MODULES = %i[ApiErrorsRaiser ClientErrorsRaiser].freeze
end

# Libs
require 'json'
require 'open-uri'
require 'rest-client'

# Core modules
require 'crowdin-api/core/errors'
require 'crowdin-api/core/errors_raisers'
require 'crowdin-api/core/request'
require 'crowdin-api/core/send_request'
require 'crowdin-api/core/fetch_all_extensions'

# API modules
Crowdin::API_RESOURCES_MODULES.each do |api_resource|
  require "crowdin-api/api_resources/#{api_resource.to_s.gsub(/([a-z\d])([A-Z])/, '\1_\2').downcase}"
rescue LoadError
  # Ignored
end

# Client modules
require 'crowdin-api/client/version'
require 'crowdin-api/client/configuration'
require 'crowdin-api/client/client'
