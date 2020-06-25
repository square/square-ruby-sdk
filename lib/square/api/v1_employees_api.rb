module Square
  # V1EmployeesApi
  class V1EmployeesApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Provides summary information for all of a business's employees.
    # @param [SortOrder] order Optional parameter: The order in which employees
    # are listed in the response, based on their created_at field.      Default
    # value: ASC
    # @param [String] begin_updated_at Optional parameter: If filtering results
    # by their updated_at field, the beginning of the requested reporting
    # period, in ISO 8601 format
    # @param [String] end_updated_at Optional parameter: If filtering results by
    # there updated_at field, the end of the requested reporting period, in ISO
    # 8601 format.
    # @param [String] begin_created_at Optional parameter: If filtering results
    # by their created_at field, the beginning of the requested reporting
    # period, in ISO 8601 format.
    # @param [String] end_created_at Optional parameter: If filtering results by
    # their created_at field, the end of the requested reporting period, in ISO
    # 8601 format.
    # @param [V1ListEmployeesRequestStatus] status Optional parameter: If
    # provided, the endpoint returns only employee entities with the specified
    # status (ACTIVE or INACTIVE).
    # @param [String] external_id Optional parameter: If provided, the endpoint
    # returns only employee entities with the specified external_id.
    # @param [Integer] limit Optional parameter: The maximum integer number of
    # employee entities to return in a single response. Default 100, maximum
    # 200.
    # @param [String] batch_token Optional parameter: A pagination cursor to
    # retrieve the next set of results for your original query to the
    # endpoint.
    # @return [List of V1Employee Hash] response from the API call
    def list_employees(order: nil,
                       begin_updated_at: nil,
                       end_updated_at: nil,
                       begin_created_at: nil,
                       end_created_at: nil,
                       status: nil,
                       external_id: nil,
                       limit: nil,
                       batch_token: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/me/employees'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'order' => order,
        'begin_updated_at' => begin_updated_at,
        'end_updated_at' => end_updated_at,
        'begin_created_at' => begin_created_at,
        'end_created_at' => end_created_at,
        'status' => status,
        'external_id' => external_id,
        'limit' => limit,
        'batch_token' => batch_token
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

    #  Use the CreateEmployee endpoint to add an employee to a Square
    # account. Employees created with the Connect API have an initial status
    # of `INACTIVE`. Inactive employees cannot sign in to Square Point of Sale
    # until they are activated from the Square Dashboard. Employee status
    # cannot be changed with the Connect API.
    # <aside class="important">
    # Employee entities cannot be deleted. To disable employee profiles,
    # set the employee's status to <code>INACTIVE</code>
    # </aside>
    # @param [V1Employee] body Required parameter: An object containing the
    # fields to POST for the request.  See the corresponding object definition
    # for field details.
    # @return [V1Employee Hash] response from the API call
    def create_employee(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/me/employees'
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

    # Provides the details for a single employee.
    # @param [String] employee_id Required parameter: The employee's ID.
    # @return [V1Employee Hash] response from the API call
    def retrieve_employee(employee_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/me/employees/{employee_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'employee_id' => employee_id
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

    # UpdateEmployee
    # @param [String] employee_id Required parameter: The ID of the role to
    # modify.
    # @param [V1Employee] body Required parameter: An object containing the
    # fields to POST for the request.  See the corresponding object definition
    # for field details.
    # @return [V1Employee Hash] response from the API call
    def update_employee(employee_id:,
                        body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/me/employees/{employee_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'employee_id' => employee_id
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

    # Provides summary information for all of a business's employee roles.
    # @param [SortOrder] order Optional parameter: The order in which employees
    # are listed in the response, based on their created_at field.Default value:
    # ASC
    # @param [Integer] limit Optional parameter: The maximum integer number of
    # employee entities to return in a single response. Default 100, maximum
    # 200.
    # @param [String] batch_token Optional parameter: A pagination cursor to
    # retrieve the next set of results for your original query to the
    # endpoint.
    # @return [List of V1EmployeeRole Hash] response from the API call
    def list_employee_roles(order: nil,
                            limit: nil,
                            batch_token: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/me/roles'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'order' => order,
        'limit' => limit,
        'batch_token' => batch_token
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

    # Creates an employee role you can then assign to employees.
    # Square accounts can include any number of roles that can be assigned to
    # employees. These roles define the actions and permissions granted to an
    # employee with that role. For example, an employee with a "Shift Manager"
    # role might be able to issue refunds in Square Point of Sale, whereas an
    # employee with a "Clerk" role might not.
    # Roles are assigned with the [V1UpdateEmployee](#endpoint-v1updateemployee)
    # endpoint. An employee can have only one role at a time.
    # If an employee has no role, they have none of the permissions associated
    # with roles. All employees can accept payments with Square Point of Sale.
    # @param [V1EmployeeRole] body Required parameter: An EmployeeRole object
    # with a name and permissions, and an optional owner flag.
    # @return [V1EmployeeRole Hash] response from the API call
    def create_employee_role(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/me/roles'
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

    # Provides the details for a single employee role.
    # @param [String] role_id Required parameter: The role's ID.
    # @return [V1EmployeeRole Hash] response from the API call
    def retrieve_employee_role(role_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/me/roles/{role_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'role_id' => role_id
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

    # Modifies the details of an employee role.
    # @param [String] role_id Required parameter: The ID of the role to
    # modify.
    # @param [V1EmployeeRole] body Required parameter: An object containing the
    # fields to POST for the request.  See the corresponding object definition
    # for field details.
    # @return [V1EmployeeRole Hash] response from the API call
    def update_employee_role(role_id:,
                             body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/me/roles/{role_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'role_id' => role_id
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

    # Provides summary information for all of a business's employee timecards.
    # @param [SortOrder] order Optional parameter: The order in which timecards
    # are listed in the response, based on their created_at field.
    # @param [String] employee_id Optional parameter: If provided, the endpoint
    # returns only timecards for the employee with the specified ID.
    # @param [String] begin_clockin_time Optional parameter: If filtering
    # results by their clockin_time field, the beginning of the requested
    # reporting period, in ISO 8601 format.
    # @param [String] end_clockin_time Optional parameter: If filtering results
    # by their clockin_time field, the end of the requested reporting period, in
    # ISO 8601 format.
    # @param [String] begin_clockout_time Optional parameter: If filtering
    # results by their clockout_time field, the beginning of the requested
    # reporting period, in ISO 8601 format.
    # @param [String] end_clockout_time Optional parameter: If filtering results
    # by their clockout_time field, the end of the requested reporting period,
    # in ISO 8601 format.
    # @param [String] begin_updated_at Optional parameter: If filtering results
    # by their updated_at field, the beginning of the requested reporting
    # period, in ISO 8601 format.
    # @param [String] end_updated_at Optional parameter: If filtering results by
    # their updated_at field, the end of the requested reporting period, in ISO
    # 8601 format.
    # @param [Boolean] deleted Optional parameter: If true, only deleted
    # timecards are returned. If false, only valid timecards are returned.If you
    # don't provide this parameter, both valid and deleted timecards are
    # returned.
    # @param [Integer] limit Optional parameter: The maximum integer number of
    # employee entities to return in a single response. Default 100, maximum
    # 200.
    # @param [String] batch_token Optional parameter: A pagination cursor to
    # retrieve the next set of results for your original query to the
    # endpoint.
    # @return [List of V1Timecard Hash] response from the API call
    def list_timecards(order: nil,
                       employee_id: nil,
                       begin_clockin_time: nil,
                       end_clockin_time: nil,
                       begin_clockout_time: nil,
                       end_clockout_time: nil,
                       begin_updated_at: nil,
                       end_updated_at: nil,
                       deleted: false,
                       limit: nil,
                       batch_token: nil)
      warn 'Endpoint list_timecards in V1EmployeesApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/me/timecards'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'order' => order,
        'employee_id' => employee_id,
        'begin_clockin_time' => begin_clockin_time,
        'end_clockin_time' => end_clockin_time,
        'begin_clockout_time' => begin_clockout_time,
        'end_clockout_time' => end_clockout_time,
        'begin_updated_at' => begin_updated_at,
        'end_updated_at' => end_updated_at,
        'deleted' => deleted,
        'limit' => limit,
        'batch_token' => batch_token
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

    # Creates a timecard for an employee and clocks them in with an
    # `API_CREATE` event and a `clockin_time` set to the current time unless
    # the request provides a different value.
    # To import timecards from another
    # system (rather than clocking someone in). Specify the `clockin_time`
    # and* `clockout_time` in the request.
    # Timecards correspond to exactly one shift for a given employee, bounded
    # by the `clockin_time` and `clockout_time` fields. An employee is
    # considered clocked in if they have a timecard that doesn't have a
    # `clockout_time` set. An employee that is currently clocked in cannot
    # be clocked in a second time.
    # @param [V1Timecard] body Required parameter: An object containing the
    # fields to POST for the request.  See the corresponding object definition
    # for field details.
    # @return [V1Timecard Hash] response from the API call
    def create_timecard(body:)
      warn 'Endpoint create_timecard in V1EmployeesApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/me/timecards'
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

    # Deletes a timecard. Timecards can also be deleted through the
    # Square Dashboard. Deleted timecards are still accessible through
    # Connect API endpoints, but cannot be modified. The `deleted` field of
    # the `Timecard` object indicates whether the timecard has been deleted.
    # __Note__: By default, deleted timecards appear alongside valid timecards
    # in
    # results returned by the
    # [ListTimecards](#endpoint-v1employees-listtimecards)
    # endpoint. To filter deleted timecards, include the `deleted` query
    # parameter in the list request.
    # Only approved accounts can manage their employees with Square.
    # Unapproved accounts cannot use employee management features with the
    # API.
    # @param [String] timecard_id Required parameter: The ID of the timecard to
    # delete.
    # @return [Object] response from the API call
    def delete_timecard(timecard_id:)
      warn 'Endpoint delete_timecard in V1EmployeesApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/me/timecards/{timecard_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'timecard_id' => timecard_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
        _query_url
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      ApiResponse.new(_response, data: _response.raw_body)
    end

    # Provides the details for a single timecard.
    # <aside>
    # Only approved accounts can manage their employees with Square.
    # Unapproved accounts cannot use employee management features with the
    # API.
    # </aside>
    # @param [String] timecard_id Required parameter: The timecard's ID.
    # @return [V1Timecard Hash] response from the API call
    def retrieve_timecard(timecard_id:)
      warn 'Endpoint retrieve_timecard in V1EmployeesApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/me/timecards/{timecard_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'timecard_id' => timecard_id
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

    # Modifies the details of a timecard with an `API_EDIT` event for
    # the timecard. Updating an active timecard with a `clockout_time`
    # clocks the employee out.
    # @param [String] timecard_id Required parameter: TThe ID of the timecard to
    # modify.
    # @param [V1Timecard] body Required parameter: An object containing the
    # fields to POST for the request. See the corresponding object definition
    # for field details.
    # @return [V1Timecard Hash] response from the API call
    def update_timecard(timecard_id:,
                        body:)
      warn 'Endpoint update_timecard in V1EmployeesApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/me/timecards/{timecard_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'timecard_id' => timecard_id
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

    # Provides summary information for all events associated with a
    # particular timecard.
    # <aside>
    # Only approved accounts can manage their employees with Square.
    # Unapproved accounts cannot use employee management features with the
    # API.
    # </aside>
    # @param [String] timecard_id Required parameter: The ID of the timecard to
    # list events for.
    # @return [List of V1TimecardEvent Hash] response from the API call
    def list_timecard_events(timecard_id:)
      warn 'Endpoint list_timecard_events in V1EmployeesApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/me/timecards/{timecard_id}/events'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'timecard_id' => timecard_id
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

    # Provides the details for all of a location's cash drawer shifts during a
    # date range. The date range you specify cannot exceed 90 days.
    # @param [String] location_id Required parameter: The ID of the location to
    # list cash drawer shifts for.
    # @param [SortOrder] order Optional parameter: The order in which cash
    # drawer shifts are listed in the response, based on their created_at field.
    # Default value: ASC
    # @param [String] begin_time Optional parameter: The beginning of the
    # requested reporting period, in ISO 8601 format. Default value: The current
    # time minus 90 days.
    # @param [String] end_time Optional parameter: The beginning of the
    # requested reporting period, in ISO 8601 format. Default value: The current
    # time.
    # @return [List of V1CashDrawerShift Hash] response from the API call
    def list_cash_drawer_shifts(location_id:,
                                order: nil,
                                begin_time: nil,
                                end_time: nil)
      warn 'Endpoint list_cash_drawer_shifts in V1EmployeesApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/cash-drawer-shifts'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'order' => order,
        'begin_time' => begin_time,
        'end_time' => end_time
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

    # Provides the details for a single cash drawer shift, including all events
    # that occurred during the shift.
    # @param [String] location_id Required parameter: The ID of the location to
    # list cash drawer shifts for.
    # @param [String] shift_id Required parameter: The shift's ID.
    # @return [V1CashDrawerShift Hash] response from the API call
    def retrieve_cash_drawer_shift(location_id:,
                                   shift_id:)
      warn 'Endpoint retrieve_cash_drawer_shift in V1EmployeesApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v1/{location_id}/cash-drawer-shifts/{shift_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'shift_id' => shift_id
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
  end
end
