module Square
  # EmployeesApi
  class EmployeesApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # ListEmployees
    # @param [String] location_id Optional parameter: Example:
    # @param [EmployeeStatus] status Optional parameter: Specifies the
    # EmployeeStatus to filter the employee by.
    # @param [Integer] limit Optional parameter: The number of employees to be
    # returned on each page.
    # @param [String] cursor Optional parameter: The token required to retrieve
    # the specified page of results.
    # @return [ListEmployeesResponse Hash] response from the API call
    def list_employees(location_id: nil,
                       status: nil,
                       limit: nil,
                       cursor: nil)
      warn 'Endpoint list_employees in EmployeesApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/employees'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'location_id' => location_id,
        'status' => status,
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

    # RetrieveEmployee
    # @param [String] id Required parameter: UUID for the employee that was
    # requested.
    # @return [RetrieveEmployeeResponse Hash] response from the API call
    def retrieve_employee(id:)
      warn 'Endpoint retrieve_employee in EmployeesApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/employees/{id}'
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
  end
end
