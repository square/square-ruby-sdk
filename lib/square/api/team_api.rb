module Square
  # TeamApi
  class TeamApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Creates a single `TeamMember` object. The `TeamMember` will be returned on
    # successful creates.
    # You must provide the following values in your request to this endpoint:
    # - `first_name`
    # - `last_name`
    # Learn about [Troubleshooting the Teams
    # API](https://developer.squareup.com/docs/docs/team/troubleshooting#createt
    # eammember).
    # @param [CreateTeamMemberRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateTeamMemberResponse Hash] response from the API call
    def create_team_member(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/team-members'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Creates multiple `TeamMember` objects. The created `TeamMember` objects
    # will be returned on successful creates.
    # This process is non-transactional and will process as much of the request
    # as is possible. If one of the creates in
    # the request cannot be successfully processed, the request will NOT be
    # marked as failed, but the body of the response
    # will contain explicit error information for this particular create.
    # Learn about [Troubleshooting the Teams
    # API](https://developer.squareup.com/docs/docs/team/troubleshooting#bulkcre
    # ateteammembers).
    # @param [BulkCreateTeamMembersRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [BulkCreateTeamMembersResponse Hash] response from the API call
    def bulk_create_team_members(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/team-members/bulk-create'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Updates multiple `TeamMember` objects. The updated `TeamMember` objects
    # will be returned on successful updates.
    # This process is non-transactional and will process as much of the request
    # as is possible. If one of the updates in
    # the request cannot be successfully processed, the request will NOT be
    # marked as failed, but the body of the response
    # will contain explicit error information for this particular update.
    # Learn about [Troubleshooting the Teams
    # API](https://developer.squareup.com/docs/docs/team/troubleshooting#bulkupd
    # ateteammembers).
    # @param [BulkUpdateTeamMembersRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [BulkUpdateTeamMembersResponse Hash] response from the API call
    def bulk_update_team_members(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/team-members/bulk-update'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Returns a paginated list of `TeamMember` objects for a business.
    # The list to be returned can be filtered by:
    # - location IDs **and**
    # - `is_active`
    # @param [SearchTeamMembersRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [SearchTeamMembersResponse Hash] response from the API call
    def search_team_members(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/team-members/search'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Retrieve a `TeamMember` object for the given `TeamMember.id`
    # Learn about [Troubleshooting the Teams
    # API](https://developer.squareup.com/docs/docs/team/troubleshooting#retriev
    # eteammember).
    # @param [String] team_member_id Required parameter: The ID of the team
    # member to retrieve.
    # @return [RetrieveTeamMemberResponse Hash] response from the API call
    def retrieve_team_member(team_member_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/team-members/{team_member_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'team_member_id' => team_member_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Updates a single `TeamMember` object. The `TeamMember` will be returned on
    # successful updates.
    # Learn about [Troubleshooting the Teams
    # API](https://developer.squareup.com/docs/docs/team/troubleshooting#updatet
    # eammember).
    # @param [String] team_member_id Required parameter: The ID of the team
    # member to update.
    # @param [UpdateTeamMemberRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdateTeamMemberResponse Hash] response from the API call
    def update_team_member(team_member_id:,
                           body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/team-members/{team_member_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'team_member_id' => team_member_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Retrieve a `WageSetting` object for a team member specified
    # by `TeamMember.id`.
    # Learn about [Troubleshooting the Teams
    # API](https://developer.squareup.com/docs/docs/team/troubleshooting#retriev
    # ewagesetting).
    # @param [String] team_member_id Required parameter: The ID of the team
    # member to retrieve wage setting for
    # @return [RetrieveWageSettingResponse Hash] response from the API call
    def retrieve_wage_setting(team_member_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/team-members/{team_member_id}/wage-setting'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'team_member_id' => team_member_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Creates or updates a `WageSetting` object. The object is created if a
    # `WageSetting` with the specified `team_member_id` does not exist.
    # Otherwise,
    # it fully replaces the `WageSetting` object for the team member.
    # The `WageSetting` will be returned upon successful update.
    # Learn about [Troubleshooting the Teams
    # API](https://developer.squareup.com/docs/docs/team/troubleshooting#updatew
    # agesetting).
    # @param [String] team_member_id Required parameter: The ID of the team
    # member to update the `WageSetting` object for.
    # @param [UpdateWageSettingRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdateWageSettingResponse Hash] response from the API call
    def update_wage_setting(team_member_id:,
                            body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/team-members/{team_member_id}/wage-setting'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'team_member_id' => team_member_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end
  end
end
