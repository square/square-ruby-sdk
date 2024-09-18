module Square
  # EmployeesApi
  class EmployeesApi < BaseApi
    # TODO: type endpoint description here
    # @param [String] location_id Optional parameter: Example:
    # @param [EmployeeStatus] status Optional parameter: Specifies the
    # EmployeeStatus to filter the employee by.
    # @param [Integer] limit Optional parameter: The number of employees to be
    # returned on each page.
    # @param [String] cursor Optional parameter: The token required to retrieve
    # the specified page of results.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_employees(location_id: nil,
                       status: nil,
                       limit: nil,
                       cursor: nil)
      warn 'Endpoint list_employees in EmployeesApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/employees',
                                     'default')
                   .query_param(new_parameter(location_id, key: 'location_id'))
                   .query_param(new_parameter(status, key: 'status'))
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

    # TODO: type endpoint description here
    # @param [String] id Required parameter: UUID for the employee that was
    # requested.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_employee(id:)
      warn 'Endpoint retrieve_employee in EmployeesApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/employees/{id}',
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
  end
end
