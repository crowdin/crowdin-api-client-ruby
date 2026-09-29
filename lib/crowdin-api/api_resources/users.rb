# frozen_string_literal: true

module Crowdin
  module ApiResources
    module Users
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.user.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.user.get  Enterprise API Documentation}
      def get_authenticated_user
        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/user"
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.members.getMany  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.members.getMany  Enterprise API Documentation}
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

      # @param member_id [Integer] Project Member Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.members.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.members.get  Enterprise API Documentation}
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

      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.user.patch  API Documentation}
      def edit_authenticated_user(body = [])
        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/user",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.members.post  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.members.post  Enterprise API Documentation}
      def add_project_member(query = {}, project_id = config.project_id)
        project_id || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :post,
          "#{config.target_api_url}/projects/#{project_id}/members",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param member_id [Integer] Project Member Identifier
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.members.get  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.members.get  Enterprise API Documentation}
      def get_project_member_permissions(member_id = nil, project_id = config.project_id)
        member_id        || raise_parameter_is_required_error(:member_id)
        project_id       || raise_project_id_is_required_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/projects/#{project_id}/members/#{member_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param member_id [Integer] Project Member Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.members.put  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.members.put  Enterprise API Documentation}
      def replace_project_permissions(member_id = nil, query = {}, project_id = config.project_id)
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

      # @param member_id [Integer] Project Member Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/api/v2/#operation/api.projects.members.delete  API Documentation}
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.projects.members.delete  Enterprise API Documentation}
      def delete_member_from_project(member_id = nil, query = {}, project_id = config.project_id)
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

      # -- For Enterprise mode only --

      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.users.getMany  Enterprise API Documentation}
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

      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.users.post  Enterprise API Documentation}
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

      # @param user_id [Integer] User Identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.users.getById  Enterprise API Documentation}
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

      # @param user_id [Integer] User Identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.users.delete  Enterprise API Documentation}
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

      # @param user_id [Integer] User Identifier
      # @param query [Hash] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.users.patch  Enterprise API Documentation}
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

      # @param group_id [Integer] Group Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.groups.managers.getMany  Enterprise API Documentation}
      def list_group_managers(group_id, query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/groups/#{group_id}/managers",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param group_id [Integer] Group Identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.groups.managers.patch  Enterprise API Documentation}
      def update_group_managers(group_id, body = [])
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/groups/#{group_id}/managers",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end

      # @param group_id [Integer] Group Identifier
      # @param user_id [Integer] User Identifier
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.groups.managers.get  Enterprise API Documentation}
      def get_group_manager(group_id, user_id)
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/groups/#{group_id}/managers/#{user_id}"
        )
        Web::SendRequest.new(request).perform
      end

      # @param user_id [Integer] User Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.users.projects.contributions.getMany  Enterprise API Documentation}
      def list_user_projects_contributions(user_id, query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/users/#{user_id}/projects/contributions",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param user_id [Integer] User Identifier
      # @param query [Hash] Request Query Parameters
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.users.projects.permissions.getMany  Enterprise API Documentation}
      def list_user_projects_permissions(user_id, query = {})
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :get,
          "#{config.target_api_url}/users/#{user_id}/projects/permissions",
          { params: query }
        )
        Web::SendRequest.new(request).perform
      end

      # @param user_id [Integer] User Identifier
      # @param body [Array] Request Body
      # * {https://support.crowdin.com/developer/enterprise/api/v2/#operation/api.users.projects.permissions.patch  Enterprise API Documentation}
      def edit_user_projects_permissions(user_id, body = [])
        enterprise_mode? || raise_only_for_enterprise_mode_error

        request = Web::Request.new(
          connection,
          :patch,
          "#{config.target_api_url}/users/#{user_id}/projects/permissions",
          { params: body }
        )
        Web::SendRequest.new(request).perform
      end
    end
  end
end
