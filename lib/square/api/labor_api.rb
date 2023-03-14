module Square
  # LaborApi
  class LaborApi < BaseApi
    # Returns a paginated list of `BreakType` instances for a business.
    # @param [String] location_id Optional parameter: Filter the returned
    # `BreakType` results to only those that are associated with the specified
    # location.
    # @param [Integer] limit Optional parameter: The maximum number of
    # `BreakType` results to return per page. The number can range between 1 and
    # 200. The default is 200.
    # @param [String] cursor Optional parameter: A pointer to the next page of
    # `BreakType` results to fetch.
    # @return [ListBreakTypesResponse Hash] response from the API call
    def list_break_types(location_id: nil,
                         limit: nil,
                         cursor: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/labor/break-types',
                                     'default')
                   .query_param(new_parameter(location_id, key: 'location_id'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates a new `BreakType`.
    # A `BreakType` is a template for creating `Break` objects.
    # You must provide the following values in your request to this
    # endpoint:
    # - `location_id`
    # - `break_name`
    # - `expected_duration`
    # - `is_paid`
    # You can only have three `BreakType` instances per location. If you attempt
    # to add a fourth
    # `BreakType` for a location, an `INVALID_REQUEST_ERROR` "Exceeded limit of
    # 3 breaks per location."
    # is returned.
    # @param [CreateBreakTypeRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateBreakTypeResponse Hash] response from the API call
    def create_break_type(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/labor/break-types',
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

    # Deletes an existing `BreakType`.
    # A `BreakType` can be deleted even if it is referenced from a `Shift`.
    # @param [String] id Required parameter: The UUID for the `BreakType` being
    # deleted.
    # @return [DeleteBreakTypeResponse Hash] response from the API call
    def delete_break_type(id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/labor/break-types/{id}',
                                     'default')
                   .template_param(new_parameter(id, key: 'id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns a single `BreakType` specified by `id`.
    # @param [String] id Required parameter: The UUID for the `BreakType` being
    # retrieved.
    # @return [GetBreakTypeResponse Hash] response from the API call
    def get_break_type(id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/labor/break-types/{id}',
                                     'default')
                   .template_param(new_parameter(id, key: 'id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates an existing `BreakType`.
    # @param [String] id Required parameter: The UUID for the `BreakType` being
    # updated.
    # @param [UpdateBreakTypeRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdateBreakTypeResponse Hash] response from the API call
    def update_break_type(id:,
                          body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/labor/break-types/{id}',
                                     'default')
                   .template_param(new_parameter(id, key: 'id')
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

    # Returns a paginated list of `EmployeeWage` instances for a business.
    # @param [String] employee_id Optional parameter: Filter the returned wages
    # to only those that are associated with the specified employee.
    # @param [Integer] limit Optional parameter: The maximum number of
    # `EmployeeWage` results to return per page. The number can range between 1
    # and 200. The default is 200.
    # @param [String] cursor Optional parameter: A pointer to the next page of
    # `EmployeeWage` results to fetch.
    # @return [ListEmployeeWagesResponse Hash] response from the API call
    def list_employee_wages(employee_id: nil,
                            limit: nil,
                            cursor: nil)
      warn 'Endpoint list_employee_wages in LaborApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/labor/employee-wages',
                                     'default')
                   .query_param(new_parameter(employee_id, key: 'employee_id'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns a single `EmployeeWage` specified by `id`.
    # @param [String] id Required parameter: The UUID for the `EmployeeWage`
    # being retrieved.
    # @return [GetEmployeeWageResponse Hash] response from the API call
    def get_employee_wage(id:)
      warn 'Endpoint get_employee_wage in LaborApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/labor/employee-wages/{id}',
                                     'default')
                   .template_param(new_parameter(id, key: 'id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates a new `Shift`.
    # A `Shift` represents a complete workday for a single employee.
    # You must provide the following values in your request to this
    # endpoint:
    # - `location_id`
    # - `employee_id`
    # - `start_at`
    # An attempt to create a new `Shift` can result in a `BAD_REQUEST` error
    # when:
    # - The `status` of the new `Shift` is `OPEN` and the employee has another
    # shift with an `OPEN` status.
    # - The `start_at` date is in the future.
    # - The `start_at` or `end_at` date overlaps another shift for the same
    # employee.
    # - The `Break` instances are set in the request and a break `start_at`
    # is before the `Shift.start_at`, a break `end_at` is after
    # the `Shift.end_at`, or both.
    # @param [CreateShiftRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [CreateShiftResponse Hash] response from the API call
    def create_shift(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/labor/shifts',
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

    # Returns a paginated list of `Shift` records for a business.
    # The list to be returned can be filtered by:
    # - Location IDs.
    # - Employee IDs.
    # - Shift status (`OPEN` and `CLOSED`).
    # - Shift start.
    # - Shift end.
    # - Workday details.
    # The list can be sorted by:
    # - `start_at`.
    # - `end_at`.
    # - `created_at`.
    # - `updated_at`.
    # @param [SearchShiftsRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [SearchShiftsResponse Hash] response from the API call
    def search_shifts(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/labor/shifts/search',
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

    # Deletes a `Shift`.
    # @param [String] id Required parameter: The UUID for the `Shift` being
    # deleted.
    # @return [DeleteShiftResponse Hash] response from the API call
    def delete_shift(id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/labor/shifts/{id}',
                                     'default')
                   .template_param(new_parameter(id, key: 'id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns a single `Shift` specified by `id`.
    # @param [String] id Required parameter: The UUID for the `Shift` being
    # retrieved.
    # @return [GetShiftResponse Hash] response from the API call
    def get_shift(id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/labor/shifts/{id}',
                                     'default')
                   .template_param(new_parameter(id, key: 'id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates an existing `Shift`.
    # When adding a `Break` to a `Shift`, any earlier `Break` instances in the
    # `Shift` have
    # the `end_at` property set to a valid RFC-3339 datetime string.
    # When closing a `Shift`, all `Break` instances in the `Shift` must be
    # complete with `end_at`
    # set on each `Break`.
    # @param [String] id Required parameter: The ID of the object being
    # updated.
    # @param [UpdateShiftRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [UpdateShiftResponse Hash] response from the API call
    def update_shift(id:,
                     body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/labor/shifts/{id}',
                                     'default')
                   .template_param(new_parameter(id, key: 'id')
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

    # Returns a paginated list of `TeamMemberWage` instances for a business.
    # @param [String] team_member_id Optional parameter: Filter the returned
    # wages to only those that are associated with the specified team member.
    # @param [Integer] limit Optional parameter: The maximum number of
    # `TeamMemberWage` results to return per page. The number can range between
    # 1 and 200. The default is 200.
    # @param [String] cursor Optional parameter: A pointer to the next page of
    # `EmployeeWage` results to fetch.
    # @return [ListTeamMemberWagesResponse Hash] response from the API call
    def list_team_member_wages(team_member_id: nil,
                               limit: nil,
                               cursor: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/labor/team-member-wages',
                                     'default')
                   .query_param(new_parameter(team_member_id, key: 'team_member_id'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns a single `TeamMemberWage` specified by `id `.
    # @param [String] id Required parameter: The UUID for the `TeamMemberWage`
    # being retrieved.
    # @return [GetTeamMemberWageResponse Hash] response from the API call
    def get_team_member_wage(id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/labor/team-member-wages/{id}',
                                     'default')
                   .template_param(new_parameter(id, key: 'id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns a list of `WorkweekConfig` instances for a business.
    # @param [Integer] limit Optional parameter: The maximum number of
    # `WorkweekConfigs` results to return per page.
    # @param [String] cursor Optional parameter: A pointer to the next page of
    # `WorkweekConfig` results to fetch.
    # @return [ListWorkweekConfigsResponse Hash] response from the API call
    def list_workweek_configs(limit: nil,
                              cursor: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/labor/workweek-configs',
                                     'default')
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates a `WorkweekConfig`.
    # @param [String] id Required parameter: The UUID for the `WorkweekConfig`
    # object being updated.
    # @param [UpdateWorkweekConfigRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdateWorkweekConfigResponse Hash] response from the API call
    def update_workweek_config(id:,
                               body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/labor/workweek-configs/{id}',
                                     'default')
                   .template_param(new_parameter(id, key: 'id')
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
