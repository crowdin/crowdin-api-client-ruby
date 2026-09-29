# frozen_string_literal: true

module Crowdin
  module ApiResources
    module StringTranslations
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.approvals.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.approvals.getMany  Enterprise API Documentation}
      def list_translation_approvals(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/approvals",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.approvals.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.approvals.post  Enterprise API Documentation}
      def add_approval(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/approvals",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param approval_id [Integer] Approval Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.approvals.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.approvals.get  Enterprise API Documentation}
      def get_approval(approval_id = nil, project_id = config.project_id)
        approval_id || raise_parameter_is_required_error(:approval_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/approvals/#{approval_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param approval_id [Integer] Approval Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.approvals.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.approvals.delete  Enterprise API Documentation}
      def remove_approval(approval_id = nil, project_id = config.project_id)
        approval_id || raise_parameter_is_required_error(:approval_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/approvals/#{approval_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.approvals.deleteMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.approvals.deleteMany  Enterprise API Documentation}
      def remove_string_approvals(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/approvals",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param language_id [String] Language Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.languages.translations.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.languages.translations.getMany  Enterprise API Documentation}
      def list_language_translations(language_id = nil, query = {}, project_id = config.project_id)
        language_id || raise_parameter_is_required_error(:language_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/languages/#{language_id}/translations",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.getMany  Enterprise API Documentation}
      def list_string_translations(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/translations",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.post  Enterprise API Documentation}
      def add_translation(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/translations",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.deleteMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.deleteMany  Enterprise API Documentation}
      def delete_string_translations(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/translations",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param translation_id [Integer] Translation Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.get  Enterprise API Documentation}
      def get_translation(translation_id = nil, query = {}, project_id = config.project_id)
        translation_id || raise_parameter_is_required_error(:translation_id)
        project_id     || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/translations/#{translation_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param translation_id [Integer] Translation Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.put  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.put  Enterprise API Documentation}
      def restore_translation(translation_id = nil, project_id = config.project_id)
        translation_id || raise_parameter_is_required_error(:translation_id)
        project_id     || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :put,
          "#{config.target_api_url}/projects/#{project_id}/translations/#{translation_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param translation_id [Integer] Translation Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.delete  Enterprise API Documentation}
      def delete_translation(translation_id = nil, project_id = config.project_id)
        translation_id || raise_parameter_is_required_error(:translation_id)
        project_id     || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/translations/#{translation_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.votes.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.votes.getMany  Enterprise API Documentation}
      def list_translation_votes(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/votes",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.votes.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.votes.post  Enterprise API Documentation}
      def add_vote(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/votes",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param vote_id [Integer] Vote Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.votes.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.votes.get  Enterprise API Documentation}
      def get_vote(vote_id = nil, project_id = config.project_id)
        vote_id    || raise_parameter_is_required_error(:vote_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/votes/#{vote_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param vote_id [Integer] Vote Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.votes.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.votes.delete  Enterprise API Documentation}
      def cancel_vote(vote_id = nil, project_id = config.project_id)
        vote_id    || raise_parameter_is_required_error(:vote_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/projects/#{project_id}/votes/#{vote_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.alignment.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.alignment.post  Enterprise API Documentation}
      def add_translation_alignment(project_id = nil, query = {})
        project_id || raise_project_id_is_required_error

        %i[source_language_id target_language_id text].each do |param|
          query[param] || raise_parameter_is_required_error(param)
        end

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/translations/alignment",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.approvals.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.approvals.patch  Enterprise API Documentation}
      def approval_batch_operations(body = [], project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/approvals",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.translations.patch  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.translations.patch  Enterprise API Documentation}
      def translation_batch_operations(body = [], project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/projects/#{project_id}/translations",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.translations.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.translations.getMany  Enterprise API Documentation}
      def search_translations(query = {})
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/translations",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
