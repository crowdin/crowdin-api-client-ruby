# frozen_string_literal: true

module Crowdin
  module ApiResources
    module StringTranslations
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
    end
  end
end
