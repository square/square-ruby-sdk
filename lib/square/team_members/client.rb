# frozen_string_literal: true

module Square
  module TeamMembers
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Creates a single `TeamMember` object. The `TeamMember` object is returned on successful creates.
      # You must provide the following values in your request to this endpoint:
      # - `given_name`
      # - `family_name`
      #
      # Learn about [Troubleshooting the Team
      # API](https://developer.squareup.com/docs/team/troubleshooting#createteammember).
      #
      # @param request_options [Hash]
      # @param params [Square::Types::CreateTeamMemberRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::CreateTeamMemberResponse]
      def create(request_options: {}, **params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/team-members",
          body: Square::Types::CreateTeamMemberRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateTeamMemberResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates multiple `TeamMember` objects. The created `TeamMember` objects are returned on successful creates.
      # This process is non-transactional and processes as much of the request as possible. If one of the creates in
      # the request cannot be successfully processed, the request is not marked as failed, but the body of the response
      # contains explicit error information for the failed create.
      #
      # Learn about [Troubleshooting the Team
      # API](https://developer.squareup.com/docs/team/troubleshooting#bulk-create-team-members).
      #
      # @param request_options [Hash]
      # @param params [Square::TeamMembers::Types::BatchCreateTeamMembersRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::BatchCreateTeamMembersResponse]
      def batch_create(request_options: {}, **params)
        body_prop_names = %i[team_members]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/team-members/bulk-create",
          body: Square::TeamMembers::Types::BatchCreateTeamMembersRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::BatchCreateTeamMembersResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates multiple `TeamMember` objects. The updated `TeamMember` objects are returned on successful updates.
      # This process is non-transactional and processes as much of the request as possible. If one of the updates in
      # the request cannot be successfully processed, the request is not marked as failed, but the body of the response
      # contains explicit error information for the failed update.
      # Learn about [Troubleshooting the Team
      # API](https://developer.squareup.com/docs/team/troubleshooting#bulk-update-team-members).
      #
      # @param request_options [Hash]
      # @param params [Square::TeamMembers::Types::BatchUpdateTeamMembersRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::BatchUpdateTeamMembersResponse]
      def batch_update(request_options: {}, **params)
        body_prop_names = %i[team_members]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/team-members/bulk-update",
          body: Square::TeamMembers::Types::BatchUpdateTeamMembersRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::BatchUpdateTeamMembersResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns a paginated list of `TeamMember` objects for a business.
      # The list can be filtered by location IDs, `ACTIVE` or `INACTIVE` status, or whether
      # the team member is the Square account owner.
      #
      # @param request_options [Hash]
      # @param params [Square::TeamMembers::Types::SearchTeamMembersRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::SearchTeamMembersResponse]
      def search(request_options: {}, **params)
        body_prop_names = %i[query limit cursor]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/team-members/search",
          body: Square::TeamMembers::Types::SearchTeamMembersRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::SearchTeamMembersResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves a `TeamMember` object for the given `TeamMember.id`.
      # Learn about [Troubleshooting the Team
      # API](https://developer.squareup.com/docs/team/troubleshooting#retrieve-a-team-member).
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :team_member_id
      #
      # @return [Square::Types::GetTeamMemberResponse]
      def get(request_options: {}, **params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/team-members/#{params[:team_member_id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetTeamMemberResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates a single `TeamMember` object. The `TeamMember` object is returned on successful updates.
      # Learn about [Troubleshooting the Team
      # API](https://developer.squareup.com/docs/team/troubleshooting#update-a-team-member).
      #
      # @param request_options [Hash]
      # @param params [Square::Types::UpdateTeamMemberRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :team_member_id
      #
      # @return [Square::Types::UpdateTeamMemberResponse]
      def update(request_options: {}, **params)
        path_param_names = %i[team_member_id]
        body_params = params.except(*path_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/team-members/#{params[:team_member_id]}",
          body: Square::Types::UpdateTeamMemberRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::UpdateTeamMemberResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Square::WageSetting::Client]
      def wage_setting
        @wage_setting ||= Square::TeamMembers::WageSetting::Client.new(client: @client)
      end
    end
  end
end
