# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Teams
      # -- For Enterprise mode only --

      def add_team_to_project(query = {}, project_id = config.project_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        project_id       || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/teams",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def list_teams(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/teams",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def add_team(query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/teams",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def get_team(team_id = nil, query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error
        team_id          || raise_parameter_is_required_error(:team_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/teams/#{team_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def delete_team(team_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        team_id          || raise_parameter_is_required_error(:team_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/teams/#{team_id}"
        )
        Web::SendRequest.new(request).perform
      end

      def edit_team(team_id = nil, query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error
        team_id          || raise_parameter_is_required_error(:team_id)

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/teams/#{team_id}",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def team_members_list(team_id = nil, query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error
        team_id          || raise_parameter_is_required_error(:team_id)

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/teams/#{team_id}/members",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def add_team_members(team_id = nil, query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error
        team_id          || raise_parameter_is_required_error(:team_id)

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/teams/#{team_id}/members",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      def delete_all_team_members(team_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        team_id          || raise_parameter_is_required_error(:team_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/teams/#{team_id}/members"
        )
        Web::SendRequest.new(request).perform
      end

      def delete_team_member(team_id = nil, member_id = nil)
        enterprise_mode? || raise_only_for_enterprise_mode_error
        team_id          || raise_parameter_is_required_error(:team_id)
        member_id        || raise_parameter_is_required_error(:member_id)

        request = Web::Request.new(
          connection,
          :delete,
          "#{config.target_api_url}/teams/#{team_id}/members/#{member_id}"
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
