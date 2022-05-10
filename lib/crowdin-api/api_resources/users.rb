# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Users
      def get_authenticated_user
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/user"
        )
        Web::SendRequest.new(request).perform
      end

      def list_project_members(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/members",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def get_member_info(member_id = nil, project_id = config.project_id)
        member_id  || raise_parameter_is_required_error(:member_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/members/#{member_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # -- For Enterprise mode only --

      def add_project_member(query = {}, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        project_id       || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/members",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def get_project_member_permissions(member_id = nil, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        member_id        || raise_parameter_is_required_error(:member_id)
        project_id       || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/members/#{member_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def replace_project_permissions(member_id = nil, query = {}, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        member_id        || raise_parameter_is_required_error(:member_id)
        project_id       || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :put,
          "#{config.target_api_url}/projects/#{project_id}/members/#{member_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def delete_member_from_project(member_id = nil, query = {}, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        member_id        || raise_parameter_is_required_error(:member_id)
        project_id       || raise_project_id_is_required_error

        response = ::RestClient::Request.execute(
          {
            method: :delete,
            url: config.base_url + config.target_api_url + "/projects/#{project_id}/members/#{member_id}",
            payload: query.to_json
          }.merge(@options)
        )

        response.body.empty? ? response.code : JSON.parse(response.body)
      rescue StandardError => e
        e.message
      end

      def list_users(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/users",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def invite_user(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/users",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def get_user(user_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        user_id          || raise_parameter_is_required_error(:user_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/users/#{user_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def delete_user(user_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        user_id          || raise_parameter_is_required_error(:user_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/users/#{user_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def edit_user(user_id = nil, query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error
        user_id          || raise_parameter_is_required_error(:user_id)

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/users/#{user_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
