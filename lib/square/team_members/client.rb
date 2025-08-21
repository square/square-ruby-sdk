# frozen_string_literal: true

module Square
  module TeamMembers
    class Client
      # @return [Square::TeamMembers::Client]
      def initialize(client:)
        @client = client
      end

      # Creates a single `TeamMember` object. The `TeamMember` object is returned on successful creates.
      # You must provide the following values in your request to this endpoint:
      # - `given_name`
      # - `family_name`
      #
      # Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#createteammember).
      #
      # @return [Square::Types::CreateTeamMemberResponse]
      def create(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/team-members",
          body: Square::Types::CreateTeamMemberRequest.new(params[:request]).to_h
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateTeamMemberResponse.load(_response.body)
        end

        raise _response.body
      end

      # Creates multiple `TeamMember` objects. The created `TeamMember` objects are returned on successful creates.
      # This process is non-transactional and processes as much of the request as possible. If one of the creates in
      # the request cannot be successfully processed, the request is not marked as failed, but the body of the response
      # contains explicit error information for the failed create.
      #
      # Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#bulk-create-team-members).
      #
      # @return [Square::Types::BatchCreateTeamMembersResponse]
      def batch_create(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/team-members/bulk-create",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchCreateTeamMembersResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates multiple `TeamMember` objects. The updated `TeamMember` objects are returned on successful updates.
      # This process is non-transactional and processes as much of the request as possible. If one of the updates in
      # the request cannot be successfully processed, the request is not marked as failed, but the body of the response
      # contains explicit error information for the failed update.
      # Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#bulk-update-team-members).
      #
      # @return [Square::Types::BatchUpdateTeamMembersResponse]
      def batch_update(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/team-members/bulk-update",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchUpdateTeamMembersResponse.load(_response.body)
        end

        raise _response.body
      end

      # Returns a paginated list of `TeamMember` objects for a business.
      # The list can be filtered by location IDs, `ACTIVE` or `INACTIVE` status, or whether
      # the team member is the Square account owner.
      #
      # @return [Square::Types::SearchTeamMembersResponse]
      def search(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/team-members/search",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchTeamMembersResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves a `TeamMember` object for the given `TeamMember.id`.
      # Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#retrieve-a-team-member).
      #
      # @return [Square::Types::GetTeamMemberResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/team-members/#{params[:team_member_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetTeamMemberResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates a single `TeamMember` object. The `TeamMember` object is returned on successful updates.
      # Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#update-a-team-member).
      #
      # @return [Square::Types::UpdateTeamMemberResponse]
      def update(request_options: {}, **params)
        _path_param_names = ["team_member_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/team-members/#{params[:team_member_id]}",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateTeamMemberResponse.load(_response.body)
        end

        raise _response.body
      end

      # @return [Square::WageSetting::Client]
      def wageSetting
        @wageSetting ||= Square::WageSetting::Client.new(client: @raw_client)
      end
    end
  end
end
