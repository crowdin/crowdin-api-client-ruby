# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Users
      def get_authenticated_user
        request = Web::Request.new(
          self,
          :get,
          '/user'
        )

        request.perform
      end

      def list_project_members(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/members",
          query
        )

        request.perform
      end

      def get_member_info(member_id = nil, project_id = config.project_id)
        member_id  || raise_parameter_is_required_error(:member_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/members/#{member_id}"
        )

        request.perform
      end

      # -- For Enterprise mode only --

      def add_project_member(query = {}, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        project_id              || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/members",
          query
        )

        request.perform
      end

      def get_project_member_permissions(member_id = nil, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        member_id               || raise_parameter_is_required_error(:member_id)
        project_id              || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :get,
          "/projects/#{project_id}/members/#{member_id}"
        )

        request.perform
      end

      def replace_project_permissions(member_id = nil, query = {}, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        member_id               || raise_parameter_is_required_error(:member_id)
        project_id              || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :put,
          "/projects/#{project_id}/members/#{member_id}",
          query
        )

        request.perform
      end

      def delete_member_from_project(member_id = nil, query = {}, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        member_id               || raise_parameter_is_required_error(:member_id)
        project_id              || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :delete,
          "/projects/#{project_id}/members/#{member_id}",
          query
        )

        request.perform
      end

      def list_users(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          self,
          :get,
          '/users',
          query
        )

        request.perform
      end

      def invite_user(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          self,
          :post,
          '/users',
          query
        )

        request.perform
      end

      def get_user(user_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        user_id                 || raise_parameter_is_required_error(:user_id)

        request = Web::Request.new(
          self,
          :get,
          "/users/#{user_id}"
        )

        request.perform
      end

      def delete_user(user_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        user_id                 || raise_parameter_is_required_error(:user_id)

        request = Web::Request.new(
          self,
          :delete,
          "/users/#{user_id}"
        )

        request.perform
      end

      def edit_user(user_id = nil, query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error
        user_id                 || raise_parameter_is_required_error(:user_id)

        request = Web::Request.new(
          self,
          :patch,
          "/users/#{user_id}",
          query
        )

        request.perform
      end
    end
  end
end
