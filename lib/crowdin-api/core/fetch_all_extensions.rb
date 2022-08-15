# frozen_string_literal: true

module Crowdin
  module Web
    module FetchAllExtensions
      MAX_ITEMS_COUNT_PER_REQUEST = 500.freeze
      API_RESOURCES_FOR_FETCH_ALL = %i[list_vendors list_dictionaries list_directories list_distributions
                                       list_workflow_templates list_languages list_labels list_mts list_files
                                       list_projects list_groups list_branches list_strings list_storages
                                       list_string_comments list_tasks list_user_tasks list_webhooks
                                       list_terms list_file_revisions list_bundles].freeze
    end
  end
end
