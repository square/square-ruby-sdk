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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    #  Use the CreateEmployee endpoint to add an employee to a Square
    # account. Employees created with the Connect API have an initial status
    # of `INACTIVE`. Inactive employees cannot sign in to Square Point of Sale
    # until they are activated from the Square Dashboard. Employee status
    # cannot be changed with the Connect API.
    # Employee entities cannot be deleted. To disable employee profiles,
    # set the employee's status to <code>INACTIVE</code>
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
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
        'employee_id' => { 'value' => employee_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
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
        'employee_id' => { 'value' => employee_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Creates an employee role you can then assign to employees.
    # Square accounts can include any number of roles that can be assigned to
    # employees. These roles define the actions and permissions granted to an
    # employee with that role. For example, an employee with a "Shift Manager"
    # role might be able to issue refunds in Square Point of Sale, whereas an
    # employee with a "Clerk" role might not.
    # Roles are assigned with the
    # [V1UpdateEmployee]($e/V1Employees/UpdateEmployeeRole)
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
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
        'role_id' => { 'value' => role_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
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
        'role_id' => { 'value' => role_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end
  end
end
