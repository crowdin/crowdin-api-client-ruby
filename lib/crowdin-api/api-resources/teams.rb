# frozen_string_literal: true

module Crowdin
  module ApiResources
    # -- For Enterprise mode only --
    module Teams
      def add_team_to_project(query = {}, project_id = config.project_id)
        config.enterprise_mode? || raise_only_for_enterprise_mode_error
        project_id              || raise_project_id_is_required_error

        request = Web::Request.new(
          self,
          :post,
          "/projects/#{project_id}/teams",
          query
        )

        request.perform
      end

      def list_teams(query = {})
        config.enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          self,
          :get,
          '/teams',
          query
        )

        request.perform
      end

      def add_team(query = {})
        config.enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          self,
          :post,
          '/teams',
          query
        )

        request.perform
      end

      def get_team(team_id = nil, query = {})
        config.enterprise_mode? || raise_only_for_enterprise_mode_error
        team_id                 || raise_parameter_is_required_error(:team_id)

        request = Web::Request.new(
          self,
          :get,
          "/teams/#{team_id}",
          query
        )

        request.perform
      end

      def delete_team(team_id = nil)
        config.enterprise_mode? || raise_only_for_enterprise_mode_error
        team_id                 || raise_parameter_is_required_error(:team_id)

        request = Web::Request.new(
          self,
          :delete,
          "/teams/#{team_id}"
        )

        request.perform
      end

      def edit_team(team_id = nil, query = {})
        config.enterprise_mode? || raise_only_for_enterprise_mode_error
        team_id                 || raise_parameter_is_required_error(:team_id)

        request = Web::Request.new(
          self,
          :patch,
          "/teams/#{team_id}",
          query
        )

        request.perform
      end

      def team_members_list(team_id = nil, query = {})
        config.enterprise_mode? || raise_only_for_enterprise_mode_error
        team_id                 || raise_parameter_is_required_error(:team_id)

        request = Web::Request.new(
          self,
          :get,
          "/teams/#{team_id}/members",
          query
        )

        request.perform
      end

      def add_team_members(team_id = nil, query = {})
        config.enterprise_mode? || raise_only_for_enterprise_mode_error
        team_id                 || raise_parameter_is_required_error(:team_id)

        request = Web::Request.new(
          self,
          :post,
          "/teams/#{team_id}/members",
          query
        )

        request.perform
      end

      def delete_all_team_members(team_id = nil)
        config.enterprise_mode? || raise_only_for_enterprise_mode_error
        team_id                 || raise_parameter_is_required_error(:team_id)

        request = Web::Request.new(
          self,
          :delete,
          "/teams/#{team_id}/members"
        )

        request.perform
      end

      def delete_team_member(team_id = nil, member_id = nil)
        config.enterprise_mode? || raise_only_for_enterprise_mode_error
        team_id                 || raise_parameter_is_required_error(:team_id)
        member_id               || raise_parameter_is_required_error(:member_id)

        request = Web::Request.new(
          self,
          :delete,
          "/teams/#{team_id}/members/#{member_id}"
        )

        request.perform
      end
    end
  end
end
