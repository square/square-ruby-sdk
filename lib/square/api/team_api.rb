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
    # @return [ApiResponse]  the complete http response with raw body and status code.
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
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

    # Lists jobs in a seller account. Results are sorted by title in ascending
    # order.
    # @param [String] cursor Optional parameter: The pagination cursor returned
    # by the previous call to this endpoint. Provide this cursor to retrieve the
    # next page of results for your original request. For more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_jobs(cursor: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/team-members/jobs',
                                     'default')
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates a job in a seller account. A job defines a title and tip
    # eligibility. Note that
    # compensation is defined in a [job assignment]($m/JobAssignment) in a team
    # member's wage setting.
    # @param [CreateJobRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_job(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/team-members/jobs',
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

    # Retrieves a specified job.
    # @param [String] job_id Required parameter: The ID of the job to
    # retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_job(job_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/team-members/jobs/{job_id}',
                                     'default')
                   .template_param(new_parameter(job_id, key: 'job_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates the title or tip eligibility of a job. Changes to the title
    # propagate to all
    # `JobAssignment`, `Shift`, and `TeamMemberWage` objects that reference the
    # job ID. Changes to
    # tip eligibility propagate to all `TeamMemberWage` objects that reference
    # the job ID.
    # @param [String] job_id Required parameter: The ID of the job to update.
    # @param [UpdateJobRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def update_job(job_id:,
                   body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/team-members/jobs/{job_id}',
                                     'default')
                   .template_param(new_parameter(job_id, key: 'job_id')
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

    # Returns a paginated list of `TeamMember` objects for a business.
    # The list can be filtered by location IDs, `ACTIVE` or `INACTIVE` status,
    # or whether
    # the team member is the Square account owner.
    # @param [SearchTeamMembersRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
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
    # by `TeamMember.id`. For more information, see
    # [Troubleshooting the Team
    # API](https://developer.squareup.com/docs/team/troubleshooting#retrievewage
    # setting).
    # Square recommends using [RetrieveTeamMember]($e/Team/RetrieveTeamMember)
    # or [SearchTeamMembers]($e/Team/SearchTeamMembers)
    # to get this information directly from the `TeamMember.wage_setting` field.
    # @param [String] team_member_id Required parameter: The ID of the team
    # member for which to retrieve the wage setting.
    # @return [ApiResponse]  the complete http response with raw body and status code.
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
    # `WageSetting` with the specified `team_member_id` doesn't exist.
    # Otherwise,
    # it fully replaces the `WageSetting` object for the team member.
    # The `WageSetting` is returned on a successful update. For more
    # information, see
    # [Troubleshooting the Team
    # API](https://developer.squareup.com/docs/team/troubleshooting#create-or-up
    # date-a-wage-setting).
    # Square recommends using [CreateTeamMember]($e/Team/CreateTeamMember) or
    # [UpdateTeamMember]($e/Team/UpdateTeamMember)
    # to manage the `TeamMember.wage_setting` field directly.
    # @param [String] team_member_id Required parameter: The ID of the team
    # member for which to update the `WageSetting` object.
    # @param [UpdateWageSettingRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
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
