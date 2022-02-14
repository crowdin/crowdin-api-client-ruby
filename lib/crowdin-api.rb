# frozen_string_literal: true

# Libs
require 'json'
require 'open-uri'
require 'rest-client'

# Core modules
require 'crowdin-api/core/errors'
require 'crowdin-api/core/errors_raisers'
require 'crowdin-api/core/request'
require 'crowdin-api/core/utils'

# API modules
require 'crowdin-api/api-resources/storages'
require 'crowdin-api/api-resources/languages'
require 'crowdin-api/api-resources/projects'
require 'crowdin-api/api-resources/workflows'
require 'crowdin-api/api-resources/source_files'
require 'crowdin-api/api-resources/translations'
require 'crowdin-api/api-resources/source_strings'
require 'crowdin-api/api-resources/string_translations'
require 'crowdin-api/api-resources/string_comments'
require 'crowdin-api/api-resources/screenshots'
require 'crowdin-api/api-resources/glossaries'
require 'crowdin-api/api-resources/translation_memory'
require 'crowdin-api/api-resources/machine_translation_engines'
require 'crowdin-api/api-resources/reports'
require 'crowdin-api/api-resources/tasks'
require 'crowdin-api/api-resources/users'
require 'crowdin-api/api-resources/teams'
require 'crowdin-api/api-resources/vendors'
require 'crowdin-api/api-resources/webhooks'
require 'crowdin-api/api-resources/dictionaries'
require 'crowdin-api/api-resources/distributions'
require 'crowdin-api/api-resources/labels'
require 'crowdin-api/api-resources/translation_status'

# Client modules
require 'crowdin-api/client/version'
require 'crowdin-api/client/configuration'
require 'crowdin-api/client/client'
