module Square
  # LaborApi
  class LaborApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Returns a paginated list of `BreakType` instances for a business.
    # @param [String] location_id Optional parameter: Filter Break Types
    # returned to only those that are associated with the specified location.
    # @param [Integer] limit Optional parameter: Maximum number of Break Types
    # to return per page. Can range between 1 and 200. The default is the
    # maximum at 200.
    # @param [String] cursor Optional parameter: Pointer to the next page of
    # Break Type results to fetch.
    # @return [ListBreakTypesResponse Hash] response from the API call
    def list_break_types(location_id: nil,
                         limit: nil,
                         cursor: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/labor/break-types'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'location_id' => location_id,
        'limit' => limit,
        'cursor' => cursor
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

    # Creates a new `BreakType`.
    # A `BreakType` is a template for creating `Break` objects.
    # You must provide the following values in your request to this
    # endpoint:
    # - `location_id`
    # - `break_name`
    # - `expected_duration`
    # - `is_paid`
    # You can only have 3 `BreakType` instances per location. If you attempt to
    # add a 4th
    # `BreakType` for a location, an `INVALID_REQUEST_ERROR` "Exceeded limit of
    # 3 breaks per location."
    # is returned.
    # @param [CreateBreakTypeRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateBreakTypeResponse Hash] response from the API call
    def create_break_type(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/labor/break-types'
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

    # Deletes an existing `BreakType`.
    # A `BreakType` can be deleted even if it is referenced from a `Shift`.
    # @param [String] id Required parameter: UUID for the `BreakType` being
    # deleted.
    # @return [DeleteBreakTypeResponse Hash] response from the API call
    def delete_break_type(id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/labor/break-types/{id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'id' => id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
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

    # Returns a single `BreakType` specified by id.
    # @param [String] id Required parameter: UUID for the `BreakType` being
    # retrieved.
    # @return [GetBreakTypeResponse Hash] response from the API call
    def get_break_type(id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/labor/break-types/{id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'id' => id
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

    # Updates an existing `BreakType`.
    # @param [String] id Required parameter: UUID for the `BreakType` being
    # updated.
    # @param [UpdateBreakTypeRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdateBreakTypeResponse Hash] response from the API call
    def update_break_type(id:,
                          body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/labor/break-types/{id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'id' => id
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

    # Returns a paginated list of `EmployeeWage` instances for a business.
    # @param [String] employee_id Optional parameter: Filter wages returned to
    # only those that are associated with the specified employee.
    # @param [Integer] limit Optional parameter: Maximum number of Employee
    # Wages to return per page. Can range between 1 and 200. The default is the
    # maximum at 200.
    # @param [String] cursor Optional parameter: Pointer to the next page of
    # Employee Wage results to fetch.
    # @return [ListEmployeeWagesResponse Hash] response from the API call
    def list_employee_wages(employee_id: nil,
                            limit: nil,
                            cursor: nil)
      warn 'Endpoint list_employee_wages in LaborApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/labor/employee-wages'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'employee_id' => employee_id,
        'limit' => limit,
        'cursor' => cursor
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

    # Returns a single `EmployeeWage` specified by id.
    # @param [String] id Required parameter: UUID for the `EmployeeWage` being
    # retrieved.
    # @return [GetEmployeeWageResponse Hash] response from the API call
    def get_employee_wage(id:)
      warn 'Endpoint get_employee_wage in LaborApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/labor/employee-wages/{id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'id' => id
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

    # Creates a new `Shift`.
    # A `Shift` represents a complete work day for a single employee.
    # You must provide the following values in your request to this
    # endpoint:
    # - `location_id`
    # - `employee_id`
    # - `start_at`
    # An attempt to create a new `Shift` can result in a `BAD_REQUEST` error
    # when:
    # - The `status` of the new `Shift` is `OPEN` and the employee has another
    # shift with an `OPEN` status.
    # - The `start_at` date is in the future
    # - the `start_at` or `end_at` overlaps another shift for the same employee
    # - If `Break`s are set in the request, a break `start_at`
    # must not be before the `Shift.start_at`. A break `end_at` must not be
    # after
    # the `Shift.end_at`
    # @param [CreateShiftRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [CreateShiftResponse Hash] response from the API call
    def create_shift(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/labor/shifts'
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

    # Returns a paginated list of `Shift` records for a business.
    # The list to be returned can be filtered by:
    # - Location IDs **and**
    # - employee IDs **and**
    # - shift status (`OPEN`, `CLOSED`) **and**
    # - shift start **and**
    # - shift end **and**
    # - work day details
    # The list can be sorted by:
    # - `start_at`
    # - `end_at`
    # - `created_at`
    # - `updated_at`
    # @param [SearchShiftsRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [SearchShiftsResponse Hash] response from the API call
    def search_shifts(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/labor/shifts/search'
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

    # Deletes a `Shift`.
    # @param [String] id Required parameter: UUID for the `Shift` being
    # deleted.
    # @return [DeleteShiftResponse Hash] response from the API call
    def delete_shift(id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/labor/shifts/{id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'id' => id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
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

    # Returns a single `Shift` specified by id.
    # @param [String] id Required parameter: UUID for the `Shift` being
    # retrieved.
    # @return [GetShiftResponse Hash] response from the API call
    def get_shift(id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/labor/shifts/{id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'id' => id
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

    # Updates an existing `Shift`.
    # When adding a `Break` to a `Shift`, any earlier `Breaks` in the `Shift`
    # have
    # the `end_at` property set to a valid RFC-3339 datetime string.
    # When closing a `Shift`, all `Break` instances in the shift must be
    # complete with `end_at`
    # set on each `Break`.
    # @param [String] id Required parameter: ID of the object being updated.
    # @param [UpdateShiftRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [UpdateShiftResponse Hash] response from the API call
    def update_shift(id:,
                     body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/labor/shifts/{id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'id' => id
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

    # Returns a paginated list of `TeamMemberWage` instances for a business.
    # @param [String] team_member_id Optional parameter: Filter wages returned
    # to only those that are associated with the specified team member.
    # @param [Integer] limit Optional parameter: Maximum number of Team Member
    # Wages to return per page. Can range between 1 and 200. The default is the
    # maximum at 200.
    # @param [String] cursor Optional parameter: Pointer to the next page of
    # Employee Wage results to fetch.
    # @return [ListTeamMemberWagesResponse Hash] response from the API call
    def list_team_member_wages(team_member_id: nil,
                               limit: nil,
                               cursor: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/labor/team-member-wages'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'team_member_id' => team_member_id,
        'limit' => limit,
        'cursor' => cursor
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

    # Returns a single `TeamMemberWage` specified by id.
    # @param [String] id Required parameter: UUID for the `TeamMemberWage` being
    # retrieved.
    # @return [GetTeamMemberWageResponse Hash] response from the API call
    def get_team_member_wage(id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/labor/team-member-wages/{id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'id' => id
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

    # Returns a list of `WorkweekConfig` instances for a business.
    # @param [Integer] limit Optional parameter: Maximum number of Workweek
    # Configs to return per page.
    # @param [String] cursor Optional parameter: Pointer to the next page of
    # Workweek Config results to fetch.
    # @return [ListWorkweekConfigsResponse Hash] response from the API call
    def list_workweek_configs(limit: nil,
                              cursor: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/labor/workweek-configs'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'limit' => limit,
        'cursor' => cursor
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

    # Updates a `WorkweekConfig`.
    # @param [String] id Required parameter: UUID for the `WorkweekConfig`
    # object being updated.
    # @param [UpdateWorkweekConfigRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdateWorkweekConfigResponse Hash] response from the API call
    def update_workweek_config(id:,
                               body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/labor/workweek-configs/{id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'id' => id
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
