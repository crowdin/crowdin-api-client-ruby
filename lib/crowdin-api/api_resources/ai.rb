# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Ai
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.ai.settings.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.ai.settings.get  Enterprise API Documentation}
      def get_project_ai_settings(project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/ai/settings"
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.file-translations.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.file-translations.post  Enterprise API Documentation}
      def ai_file_translations(body = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'ai/file-translations'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param job_identifier [String] AI File Translations job identifier
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.file-translations.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.file-translations.delete  Enterprise API Documentation}
      def cancel_file_translations(job_identifier, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/file-translations/#{job_identifier}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param job_identifier [String] AI File Translations job identifier
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.file-translations.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.file-translations.get  Enterprise API Documentation}
      def get_file_translations_status(job_identifier, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/file-translations/#{job_identifier}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param job_identifier [String] AI File Translations job identifier
      # @param destination [String] Destination of File
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.file-translations.download  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.file-translations.download  Enterprise API Documentation}
      def download_translated_file(job_identifier, destination = nil, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/file-translations/#{job_identifier}/download"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request, destination).perform
      end

      # @param job_identifier [String] AI File Translations job identifier
      # @param destination [String] Destination of File
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.file-translations.download-strings  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.file-translations.download-strings  Enterprise API Documentation}
      def download_translated_file_strings(job_identifier, destination = nil, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/file-translations/#{job_identifier}/translations"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request, destination).perform
      end

      # @param query [Hash] Request Query Parameters
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.prompts.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.getMany  Enterprise API Documentation}
      def list_ai_prompts(query = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'ai/prompts'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.prompts.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.post  Enterprise API Documentation}
      def add_ai_prompt(body = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'ai/prompts'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.prompts.fine-tuning.jobs.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.fine-tuning.jobs.getMany  Enterprise API Documentation}
      def list_ai_prompt_fine_tuning_jobs(query = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'ai/prompts/fine-tuning/jobs'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_prompt_id [Integer] AI Prompt identifier
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.prompts.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.delete  Enterprise API Documentation}
      def delete_ai_prompt(ai_prompt_id, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/prompts/#{ai_prompt_id}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_prompt_id [Integer] AI Prompt identifier
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.prompts.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.get  Enterprise API Documentation}
      def get_ai_prompt(ai_prompt_id, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/prompts/#{ai_prompt_id}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_prompt_id [Integer] AI Prompt identifier
      # @param body [Array] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.prompts.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.patch  Enterprise API Documentation}
      def edit_ai_prompt(ai_prompt_id, body = [], user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/prompts/#{ai_prompt_id}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_prompt_id [Integer] AI Prompt identifier
      # @param body [Hash] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.prompts.clones.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.clones.post  Enterprise API Documentation}
      def clone_ai_prompt(ai_prompt_id, body = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/prompts/#{ai_prompt_id}/clones"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_prompt_id [Integer] AI Prompt identifier
      # @param body [Hash] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.prompts.completions.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.completions.post  Enterprise API Documentation}
      def generate_ai_prompt_completion(ai_prompt_id, body = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/prompts/#{ai_prompt_id}/completions"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_prompt_id [Integer] AI Prompt identifier
      # @param completion_id [String] Ai Prompt Completion Identifier
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.prompts.completions.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.completions.delete  Enterprise API Documentation}
      def cancel_ai_prompt_completion(ai_prompt_id, completion_id, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/prompts/#{ai_prompt_id}/completions/#{completion_id}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_prompt_id [Integer] AI Prompt identifier
      # @param completion_id [String] Ai Prompt Completion Identifier
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.prompts.completions.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.completions.get  Enterprise API Documentation}
      def get_ai_prompt_completion_status(ai_prompt_id, completion_id, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/prompts/#{ai_prompt_id}/completions/#{completion_id}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_prompt_id [Integer] AI Prompt identifier
      # @param completion_id [String] Ai Prompt Completion Identifier
      # @param destination [String] Destination of File
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.prompts.completions.download.download  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.completions.download.download  Enterprise API Documentation}
      def download_ai_prompt_completion(ai_prompt_id, completion_id, destination = nil, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/prompts/#{ai_prompt_id}/completions/#{completion_id}/download"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request, destination).perform
      end

      # @param ai_prompt_id [Integer] AI Prompt identifier
      # @param body [Hash] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.prompts.fine-tuning.datasets.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.fine-tuning.datasets.post  Enterprise API Documentation}
      def generate_ai_prompt_fine_tuning_dataset(ai_prompt_id, body = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/prompts/#{ai_prompt_id}/fine-tuning/datasets"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_prompt_id [Integer] AI Prompt identifier
      # @param job_identifier [String] AI Prompt Fine-Tuning Dataset Generation Identifier, consists of 36 characters
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.prompts.fine-tuning.datasets.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.fine-tuning.datasets.get  Enterprise API Documentation}
      def get_ai_prompt_fine_tuning_dataset_generation_status(ai_prompt_id, job_identifier, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/prompts/#{ai_prompt_id}/fine-tuning/datasets/#{job_identifier}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_prompt_id [Integer] AI Prompt identifier
      # @param job_identifier [String] AI Prompt Fine-Tuning Dataset Generation Identifier, consists of 36 characters
      # @param destination [String] Destination of File
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.prompts.fine-tuning.datasets.download.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.fine-tuning.datasets.download.get  Enterprise API Documentation}
      def download_ai_prompt_fine_tuning_dataset(ai_prompt_id, job_identifier, destination = nil, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/prompts/#{ai_prompt_id}/fine-tuning/datasets/#{job_identifier}/download"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request, destination).perform
      end

      # @param ai_prompt_id [Integer] AI Prompt identifier
      # @param body [Hash] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.prompts.fine-tuning.jobs.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.fine-tuning.jobs.post  Enterprise API Documentation}
      def create_ai_prompt_fine_tuning_job(ai_prompt_id, body = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/prompts/#{ai_prompt_id}/fine-tuning/jobs"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_prompt_id [Integer] AI Prompt identifier
      # @param job_identifier [String] AI Prompt Fine-Tuning Job Identifier, consists of 36 characters
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.prompts.fine-tuning.jobs.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.fine-tuning.jobs.get  Enterprise API Documentation}
      def get_ai_prompt_fine_tuning_job_status(ai_prompt_id, job_identifier, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/prompts/#{ai_prompt_id}/fine-tuning/jobs/#{job_identifier}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_prompt_id [Integer] AI Prompt identifier
      # @param job_identifier [String] AI Prompt Fine-Tuning Job Identifier, consists of 36 characters
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.prompts.fine-tuning.jobs.events.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.fine-tuning.jobs.events.getMany  Enterprise API Documentation}
      def list_ai_prompt_fine_tuning_events(ai_prompt_id, job_identifier, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/prompts/#{ai_prompt_id}/fine-tuning/jobs/#{job_identifier}/events"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.providers.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.providers.getMany  Enterprise API Documentation}
      def list_ai_providers(query = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'ai/providers'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.providers.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.providers.post  Enterprise API Documentation}
      def add_ai_provider(body = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'ai/providers'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.providers.models.crowdin.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.providers.models.enterprise.getMany  Enterprise API Documentation}
      def list_all_ai_provider_models(user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'ai/providers/models'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.providers.supported-models.crowdin.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.providers.supported-models.enterprise.getMany  Enterprise API Documentation}
      def list_supported_ai_provider_models(query = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'ai/providers/supported-models'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_provider_id [Integer] AI Provider identifier
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.providers.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.providers.delete  Enterprise API Documentation}
      def delete_ai_provider(ai_provider_id, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/providers/#{ai_provider_id}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_provider_id [Integer] AI Provider identifier
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.providers.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.providers.get  Enterprise API Documentation}
      def get_ai_provider(ai_provider_id, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/providers/#{ai_provider_id}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_provider_id [Integer] AI Provider identifier
      # @param body [Array] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.providers.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.providers.patch  Enterprise API Documentation}
      def edit_ai_provider(ai_provider_id, body = [], user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/providers/#{ai_provider_id}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_provider_id [Integer] AI Provider identifier
      # @param body [Hash] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.providers.chat.completions.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.providers.chat.completions.post  Enterprise API Documentation}
      def create_ai_proxy_chat_completion(ai_provider_id, body = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/providers/#{ai_provider_id}/chat/completions"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_provider_id [Integer] AI Provider identifier
      # @param path [String] Raw provider API path after `/gateway/`
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.providers.gateway.crowdin.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.providers.gateway.enterprise.delete  Enterprise API Documentation}
      def ai_gateway_delete(ai_provider_id, path, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/providers/#{ai_provider_id}/gateway/#{path}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_provider_id [Integer] AI Provider identifier
      # @param path [String] Raw provider API path after `/gateway/`
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.providers.gateway.crowdin.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.providers.gateway.enterprise.get  Enterprise API Documentation}
      def ai_gateway_get(ai_provider_id, path, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/providers/#{ai_provider_id}/gateway/#{path}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_provider_id [Integer] AI Provider identifier
      # @param path [String] Raw provider API path after `/gateway/`
      # @param body [Hash] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.providers.gateway.crowdin.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.providers.gateway.enterprise.patch  Enterprise API Documentation}
      def ai_gateway_patch(ai_provider_id, path, body = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/providers/#{ai_provider_id}/gateway/#{path}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_provider_id [Integer] AI Provider identifier
      # @param path [String] Raw provider API path after `/gateway/`
      # @param body [Hash] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.providers.gateway.crowdin.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.providers.gateway.enterprise.post  Enterprise API Documentation}
      def ai_gateway_post(ai_provider_id, path, body = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/providers/#{ai_provider_id}/gateway/#{path}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_provider_id [Integer] AI Provider identifier
      # @param path [String] Raw provider API path after `/gateway/`
      # @param body [Hash] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.providers.gateway.crowdin.put  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.providers.gateway.enterprise.put  Enterprise API Documentation}
      def ai_gateway_put(ai_provider_id, path, body = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/providers/#{ai_provider_id}/gateway/#{path}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :put,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_provider_id [Integer] AI Provider identifier
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.providers.models.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.providers.models.getMany  Enterprise API Documentation}
      def list_ai_provider_models(ai_provider_id, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/providers/#{ai_provider_id}/models"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.reports.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.reports.post  Enterprise API Documentation}
      def generate_ai_report(body = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'ai/reports'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_report_id [String] AI Report Identifier, consists of 36 characters
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.reports.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.reports.get  Enterprise API Documentation}
      def check_ai_report_generation_status(ai_report_id, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/reports/#{ai_report_id}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_report_id [String] AI Report Identifier, consists of 36 characters
      # @param destination [String] Destination of File
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.reports.download.download  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.reports.download.download  Enterprise API Documentation}
      def download_ai_report(ai_report_id, destination = nil, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/reports/#{ai_report_id}/download"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request, destination).perform
      end

      # @param query [Hash] Request Query Parameters
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.requestLogs.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.requestLogs.getMany  Enterprise API Documentation}
      def list_ai_request_logs(query = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'ai/request-logs'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.requestLogs.exports.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.requestLogs.exports.post  Enterprise API Documentation}
      def export_ai_request_logs(body = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'ai/request-logs/exports'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param export_id [String] ID of the AI request logs export, 36 characters
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.requestLogs.exports.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.requestLogs.exports.get  Enterprise API Documentation}
      def check_ai_request_logs_export_status(export_id, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/request-logs/exports/#{export_id}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param export_id [String] ID of the AI request logs export, 36 characters
      # @param destination [String] Destination of File
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.requestLogs.exports.download  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.requestLogs.exports.download  Enterprise API Documentation}
      def download_ai_request_logs_export(export_id, destination = nil, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/request-logs/exports/#{export_id}/download"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request, destination).perform
      end

      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.settings.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.settings.get  Enterprise API Documentation}
      def get_ai_settings(user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'ai/settings'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Array] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.settings.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.settings.patch  Enterprise API Documentation}
      def edit_ai_settings(body = [], user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'ai/settings'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.prompts.snippets.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.snippets.getMany  Enterprise API Documentation}
      def list_ai_snippets(query = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'ai/settings/snippets'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.prompts.snippets.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.snippets.post  Enterprise API Documentation}
      def add_ai_snippet(body = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'ai/settings/snippets'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_snippet_id [Integer] AI Snippet identifier
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.prompts.snippets.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.snippets.delete  Enterprise API Documentation}
      def delete_ai_snippet(ai_snippet_id, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/settings/snippets/#{ai_snippet_id}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_snippet_id [Integer] AI Snippet identifier
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.prompts.snippets.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.snippets.get  Enterprise API Documentation}
      def get_ai_snippet(ai_snippet_id, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/settings/snippets/#{ai_snippet_id}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param ai_snippet_id [Integer] AI Snippet identifier
      # @param body [Array] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.prompts.snippets.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.prompts.snippets.patch  Enterprise API Documentation}
      def edit_ai_snippet(ai_snippet_id, body = [], user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/settings/snippets/#{ai_snippet_id}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Hash] Request Body
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.users.ai.translate.strings.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.translate.strings.post  Enterprise API Documentation}
      def ai_translate_strings(body = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'ai/translate'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/#{endpoint}",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.usage.members.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.usage.members.getMany  Enterprise API Documentation}
      def list_ai_usage_members(query = {}, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = 'ai/usage/members'
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param member_id [Integer] User Identifier
      # @param user_id [Integer] User Identifier (Crowdin only)
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.ai.usage.members.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.ai.usage.members.get  Enterprise API Documentation}
      def get_ai_usage_member(member_id, user_id = nil)
        enterprise_mode? || user_id || raise_parameter_is_required_error(:user_id)

        endpoint = "ai/usage/members/#{member_id}"
        endpoint = "users/#{user_id}/#{endpoint}" unless enterprise_mode?
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/#{endpoint}"
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
