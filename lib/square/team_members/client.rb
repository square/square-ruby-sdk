
module Square
  module TeamMembers
    class Client
      # @option client [Square::Internal::Http::RawClient]
      #
      # @return [Square::TeamMembers::Client]
      def initialize(client)
        @client = client
      end

      # Creates a single `TeamMember` object. The `TeamMember` object is returned on successful creates.
      # You must provide the following values in your request to this endpoint:
      # - `given_name`
      # - `family_name`
      # 
      # Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#createteammember).
      #
      # @return [Square::CreateTeamMemberResponse]
      def create(request_options: {}, **params)
        _request = Square::Internal::Http::JSONRequest.new(
          method: POST,
          path: "v2/team-members"
        )

        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateTeamMemberResponse.load(_response.body)

        else
          raise _response.body
      end

      # Creates multiple `TeamMember` objects. The created `TeamMember` objects are returned on successful creates.
      # This process is non-transactional and processes as much of the request as possible. If one of the creates in
      # the request cannot be successfully processed, the request is not marked as failed, but the body of the response
      # contains explicit error information for the failed create.
      # 
      # Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#bulk-create-team-members).
      #
      # @return [Square::BatchCreateTeamMembersResponse]
      def batch_create(request_options: {}, **params)
        _request = params

        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchCreateTeamMembersResponse.load(_response.body)

        else
          raise _response.body
      end

      # Updates multiple `TeamMember` objects. The updated `TeamMember` objects are returned on successful updates.
      # This process is non-transactional and processes as much of the request as possible. If one of the updates in
      # the request cannot be successfully processed, the request is not marked as failed, but the body of the response
      # contains explicit error information for the failed update.
      # Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#bulk-update-team-members).
      #
      # @return [Square::BatchUpdateTeamMembersResponse]
      def batch_update(request_options: {}, **params)
        _request = params

        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchUpdateTeamMembersResponse.load(_response.body)

        else
          raise _response.body
      end

      # Returns a paginated list of `TeamMember` objects for a business. 
      # The list can be filtered by location IDs, `ACTIVE` or `INACTIVE` status, or whether
      # the team member is the Square account owner.
      #
      # @return [Square::SearchTeamMembersResponse]
      def search(request_options: {}, **params)
        _request = params

        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchTeamMembersResponse.load(_response.body)

        else
          raise _response.body
      end

      # Retrieves a `TeamMember` object for the given `TeamMember.id`.
      # Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#retrieve-a-team-member).
      #
      # @return [Square::GetTeamMemberResponse]
      def get(request_options: {}, **params)
        _request = params

        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetTeamMemberResponse.load(_response.body)

        else
          raise _response.body
      end

      # Updates a single `TeamMember` object. The `TeamMember` object is returned on successful updates.
      # Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#update-a-team-member).
      #
      # @return [Square::UpdateTeamMemberResponse]
      def update(request_options: {}, **params)
        _request = params

        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateTeamMemberResponse.load(_response.body)

        else
          raise _response.body
      end

    end
  end
end
