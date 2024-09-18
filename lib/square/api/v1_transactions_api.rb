module Square
  # V1TransactionsApi
  class V1TransactionsApi < BaseApi
    # Provides summary information for a merchant's online store orders.
    # @param [String] location_id Required parameter: The ID of the location to
    # list online store orders for.
    # @param [SortOrder] order Optional parameter: The order in which payments
    # are listed in the response.
    # @param [Integer] limit Optional parameter: The maximum number of payments
    # to return in a single response. This value cannot exceed 200.
    # @param [String] batch_token Optional parameter: A pagination cursor to
    # retrieve the next set of results for your original query to the
    # endpoint.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def v1_list_orders(location_id:,
                       order: nil,
                       limit: nil,
                       batch_token: nil)
      warn 'Endpoint v1_list_orders in V1TransactionsApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v1/{location_id}/orders',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
                   .query_param(new_parameter(order, key: 'order'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(batch_token, key: 'batch_token'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create))
                    .is_response_array(true))
        .execute
    end

    # Provides comprehensive information for a single online store order,
    # including the order's history.
    # @param [String] location_id Required parameter: The ID of the order's
    # associated location.
    # @param [String] order_id Required parameter: The order's Square-issued ID.
    # You obtain this value from Order objects returned by the List Orders
    # endpoint
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def v1_retrieve_order(location_id:,
                          order_id:)
      warn 'Endpoint v1_retrieve_order in V1TransactionsApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v1/{location_id}/orders/{order_id}',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
                   .template_param(new_parameter(order_id, key: 'order_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates the details of an online store order. Every update you perform on
    # an order corresponds to one of three actions:
    # @param [String] location_id Required parameter: The ID of the order's
    # associated location.
    # @param [String] order_id Required parameter: The order's Square-issued ID.
    # You obtain this value from Order objects returned by the List Orders
    # endpoint
    # @param [V1UpdateOrderRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def v1_update_order(location_id:,
                        order_id:,
                        body:)
      warn 'Endpoint v1_update_order in V1TransactionsApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v1/{location_id}/orders/{order_id}',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
                   .template_param(new_parameter(order_id, key: 'order_id')
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
