# frozen_string_literal: true

module Crowdin
  module ApiResources
    module StringTranslations
      def list_translation_approvals(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/approvals",
          query
        )

        request.perform
      end

      def add_approval(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/approvals",
          query
        )

        request.perform
      end

      def get_approval(approval_id = nil, project_id = config.project_id)
        approval_id || raise_parameter_is_required_error(:approval_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/approvals/#{approval_id}"
        )

        request.perform
      end

      def remove_approval(approval_id = nil, project_id = config.project_id)
        approval_id || raise_parameter_is_required_error(:approval_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}/approvals/#{approval_id}"
        )

        request.perform
      end

      def list_language_translations(language_id = nil, query = {}, project_id = config.project_id)
        language_id || raise_parameter_is_required_error(:language_id)
        project_id  || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/languages/#{language_id}/translations",
          query
        )

        request.perform
      end

      def list_string_translations(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/translations",
          query
        )

        request.perform
      end

      def add_translation(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/translations",
          query
        )

        request.perform
      end

      # For now Rest Client Resource aren't support payload for DELETE requests.
      # So we have workaround through Rest Client Execute for this case
      def delete_string_translations(query = {}, project_id = config.project_id)
        # project_id || raise_project_id_is_required_error
        #
        # request = Web::Request.new(
        #   self,
        #   :delete,
        #   "/projects/#{project_id}/translations",
        #   query
        # )
        #
        # request.perform

        response = ::RestClient::Request.execute(
          {
            method: :delete,
            url: config.base_url + config.target_api_url + "/projects/#{project_id}/translations",
            payload: query.to_json
          }.merge(@options)
        )

        begin
          JSON.parse(response)
        rescue
          {}
        end
      end

      def get_translation(trnslation_id = nil, query = {}, project_id = config.project_id)
        trnslation_id || raise_parameter_is_required_error(:trnslation_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/translations/#{trnslation_id}",
          query
        )

        request.perform
      end

      def restore_translation(trnslation_id = nil, project_id = config.project_id)
        trnslation_id || raise_parameter_is_required_error(:trnslation_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :put,
          "/projects/#{project_id}/translations/#{trnslation_id}"
        )

        request.perform
      end

      def delete_translation(trnslation_id = nil, project_id = config.project_id)
        trnslation_id || raise_parameter_is_required_error(:trnslation_id)
        project_id    || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}/translations/#{trnslation_id}"
        )

        request.perform
      end

      def list_translation_votes(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/votes",
          query
        )

        request.perform
      end

      def add_vote(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/votes",
          query
        )

        request.perform
      end

      def get_vote(vote_id = nil, project_id = config.project_id)
        vote_id    || raise_parameter_is_required_error(:vote_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/votes/#{vote_id}"
        )

        request.perform
      end

      def edit_screenshot(vote_id = nil, project_id = config.project_id)
        vote_id    || raise_parameter_is_required_error(:vote_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}/votes/#{vote_id}"
        )

        request.perform
      end
    end
  end
end
