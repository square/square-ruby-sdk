module Square
  # TeamApi
  class TeamApi < BaseApi
    # Creates a single `TeamMember` object. The `TeamMember` object is returned
    # on successful creates.
    # You must provide the following values in your request to this endpoint:
    # - `given_name`
    # - `family_name`
    # Learn about [Troubleshooting the Team
    # API](https://developer.squareup.com/docs/team/troubleshooting#createteamme
    # mber).
    # @param [CreateTeamMemberRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateTeamMemberResponse Hash] response from the API call
    def create_team_member(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/team-members',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates multiple `TeamMember` objects. The created `TeamMember` objects
    # are returned on successful creates.
    # This process is non-transactional and processes as much of the request as
    # possible. If one of the creates in
    # the request cannot be successfully processed, the request is not marked as
    # failed, but the body of the response
    # contains explicit error information for the failed create.
    # Learn about [Troubleshooting the Team
    # API](https://developer.squareup.com/docs/team/troubleshooting#bulk-create-
    # team-members).
    # @param [BulkCreateTeamMembersRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [BulkCreateTeamMembersResponse Hash] response from the API call
    def bulk_create_team_members(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/team-members/bulk-create',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates multiple `TeamMember` objects. The updated `TeamMember` objects
    # are returned on successful updates.
    # This process is non-transactional and processes as much of the request as
    # possible. If one of the updates in
    # the request cannot be successfully processed, the request is not marked as
    # failed, but the body of the response
    # contains explicit error information for the failed update.
    # Learn about [Troubleshooting the Team
    # API](https://developer.squareup.com/docs/team/troubleshooting#bulk-update-
    # team-members).
    # @param [BulkUpdateTeamMembersRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [BulkUpdateTeamMembersResponse Hash] response from the API call
    def bulk_update_team_members(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/team-members/bulk-update',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns a paginated list of `TeamMember` objects for a business.
    # The list can be filtered by the following:
    # - location IDs
    # - `status`
    # @param [SearchTeamMembersRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [SearchTeamMembersResponse Hash] response from the API call
    def search_team_members(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/team-members/search',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves a `TeamMember` object for the given `TeamMember.id`.
    # Learn about [Troubleshooting the Team
    # API](https://developer.squareup.com/docs/team/troubleshooting#retrieve-a-t
    # eam-member).
    # @param [String] team_member_id Required parameter: The ID of the team
    # member to retrieve.
    # @return [RetrieveTeamMemberResponse Hash] response from the API call
    def retrieve_team_member(team_member_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/team-members/{team_member_id}',
                                     'default')
                   .template_param(new_parameter(team_member_id, key: 'team_member_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates a single `TeamMember` object. The `TeamMember` object is returned
    # on successful updates.
    # Learn about [Troubleshooting the Team
    # API](https://developer.squareup.com/docs/team/troubleshooting#update-a-tea
    # m-member).
    # @param [String] team_member_id Required parameter: The ID of the team
    # member to update.
    # @param [UpdateTeamMemberRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdateTeamMemberResponse Hash] response from the API call
    def update_team_member(team_member_id:,
                           body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/team-members/{team_member_id}',
                                     'default')
                   .template_param(new_parameter(team_member_id, key: 'team_member_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves a `WageSetting` object for a team member specified
    # by `TeamMember.id`.
    # Learn about [Troubleshooting the Team
    # API](https://developer.squareup.com/docs/team/troubleshooting#retrievewage
    # setting).
    # @param [String] team_member_id Required parameter: The ID of the team
    # member for which to retrieve the wage setting.
    # @return [RetrieveWageSettingResponse Hash] response from the API call
    def retrieve_wage_setting(team_member_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/team-members/{team_member_id}/wage-setting',
                                     'default')
                   .template_param(new_parameter(team_member_id, key: 'team_member_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates or updates a `WageSetting` object. The object is created if a
    # `WageSetting` with the specified `team_member_id` does not exist.
    # Otherwise,
    # it fully replaces the `WageSetting` object for the team member.
    # The `WageSetting` is returned on a successful update.
    # Learn about [Troubleshooting the Team
    # API](https://developer.squareup.com/docs/team/troubleshooting#create-or-up
    # date-a-wage-setting).
    # @param [String] team_member_id Required parameter: The ID of the team
    # member for which to update the `WageSetting` object.
    # @param [UpdateWageSettingRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdateWageSettingResponse Hash] response from the API call
    def update_wage_setting(team_member_id:,
                            body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/team-members/{team_member_id}/wage-setting',
                                     'default')
                   .template_param(new_parameter(team_member_id, key: 'team_member_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end
  end
end
