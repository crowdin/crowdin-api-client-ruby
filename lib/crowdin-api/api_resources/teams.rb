# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Teams
      # -- For Enterprise mode only --

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.teams.post  Enterprise API Documentation}
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

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.teams.getMany  Enterprise API Documentation}
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

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.teams.post  Enterprise API Documentation}
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

      # @param team_id [Integer] Team Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.teams.get  Enterprise API Documentation}
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

      # @param team_id [Integer] Team Identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.teams.delete  Enterprise API Documentation}
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

      # @param team_id [Integer] Team Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.teams.patch  Enterprise API Documentation}
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

      # @param team_id [Integer] Team Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.teams.members.getMany  Enterprise API Documentation}
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

      # @param team_id [Integer] Team Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.teams.members.post  Enterprise API Documentation}
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

      # @param team_id [Integer] Team Identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.teams.members.deleteMany  Enterprise API Documentation}
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

      # @param team_id [Integer] Team Identifier
      # @param member_id [Integer] Team Member Identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.teams.members.delete  Enterprise API Documentation}
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

      # @param group_id [Integer] Group Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.groups.teams.getMany  Enterprise API Documentation}
      def list_group_teams(group_id, query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/groups/#{group_id}/teams",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param group_id [Integer] Group Identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.groups.teams.patch  Enterprise API Documentation}
      def update_group_teams(group_id, body = [])
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/groups/#{group_id}/teams",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param group_id [Integer] Group Identifier
      # @param team_id [Integer] Team Identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.groups.teams.get  Enterprise API Documentation}
      def get_group_team(group_id, team_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/groups/#{group_id}/teams/#{team_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param team_id [Integer] Team Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.teams.projects.permissions.getMany  Enterprise API Documentation}
      def list_team_projects_permissions(team_id, query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/teams/#{team_id}/projects/permissions",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param team_id [Integer] Team Identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.teams.projects.permissions.patch  Enterprise API Documentation}
      def edit_team_projects_permissions(team_id, body = [])
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/teams/#{team_id}/projects/permissions",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
