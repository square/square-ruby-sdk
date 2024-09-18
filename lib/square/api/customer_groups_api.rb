module Square
  # CustomerGroupsApi
  class CustomerGroupsApi < BaseApi
    # Retrieves the list of customer groups of a business.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for your original query.  For more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to return in a single page. This limit is advisory. The response might
    # contain more or fewer results. If the limit is less than 1 or greater than
    # 50, Square returns a `400 VALUE_TOO_LOW` or `400 VALUE_TOO_HIGH` error.
    # The default value is 50.  For more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_customer_groups(cursor: nil,
                             limit: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/customers/groups',
                                     'default')
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates a new customer group for a business.
    # The request must include the `name` value of the group.
    # @param [CreateCustomerGroupRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_customer_group(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/customers/groups',
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

    # Deletes a customer group as identified by the `group_id` value.
    # @param [String] group_id Required parameter: The ID of the customer group
    # to delete.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def delete_customer_group(group_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/customers/groups/{group_id}',
                                     'default')
                   .template_param(new_parameter(group_id, key: 'group_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves a specific customer group as identified by the `group_id` value.
    # @param [String] group_id Required parameter: The ID of the customer group
    # to retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_customer_group(group_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/customers/groups/{group_id}',
                                     'default')
                   .template_param(new_parameter(group_id, key: 'group_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates a customer group as identified by the `group_id` value.
    # @param [String] group_id Required parameter: The ID of the customer group
    # to update.
    # @param [UpdateCustomerGroupRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def update_customer_group(group_id:,
                              body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/customers/groups/{group_id}',
                                     'default')
                   .template_param(new_parameter(group_id, key: 'group_id')
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
