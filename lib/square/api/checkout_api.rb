module Square
  # CheckoutApi
  class CheckoutApi < BaseApi
    # Links a `checkoutId` to a `checkout_page_url` that customers are
    # directed to in order to provide their payment information using a
    # payment processing workflow hosted on connect.squareup.com.
    # NOTE: The Checkout API has been updated with new features.
    # For more information, see [Checkout API
    # highlights](https://developer.squareup.com/docs/checkout-api#checkout-api-
    # highlights).
    # @param [String] location_id Required parameter: The ID of the business
    # location to associate the checkout with.
    # @param [CreateCheckoutRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateCheckoutResponse Hash] response from the API call
    def create_checkout(location_id:,
                        body:)
      warn 'Endpoint create_checkout in CheckoutApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/locations/{location_id}/checkouts',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
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

    # Lists all payment links.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for the original query. If a cursor is not provided, the
    # endpoint returns the first page of the results. For more  information, see
    # [Pagination](https://developer.squareup.com/docs/basics/api101/pagination)
    # .
    # @param [Integer] limit Optional parameter: A limit on the number of
    # results to return per page. The limit is advisory and the implementation
    # might return more or less results. If the supplied limit is negative,
    # zero, or greater than the maximum limit of 1000, it is ignored.  Default
    # value: `100`
    # @return [ListPaymentLinksResponse Hash] response from the API call
    def list_payment_links(cursor: nil,
                           limit: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/online-checkout/payment-links',
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

    # Creates a Square-hosted checkout page. Applications can share the
    # resulting payment link with their buyer to pay for goods and services.
    # @param [CreatePaymentLinkRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreatePaymentLinkResponse Hash] response from the API call
    def create_payment_link(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/online-checkout/payment-links',
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

    # Deletes a payment link.
    # @param [String] id Required parameter: The ID of the payment link to
    # delete.
    # @return [DeletePaymentLinkResponse Hash] response from the API call
    def delete_payment_link(id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/online-checkout/payment-links/{id}',
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

    # Retrieves a payment link.
    # @param [String] id Required parameter: The ID of link to retrieve.
    # @return [RetrievePaymentLinkResponse Hash] response from the API call
    def retrieve_payment_link(id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/online-checkout/payment-links/{id}',
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

    # Updates a payment link. You can update the `payment_link` fields such as
    # `description`, `checkout_options`, and  `pre_populated_data`.
    # You cannot update other fields such as the `order_id`, `version`, `URL`,
    # or `timestamp` field.
    # @param [String] id Required parameter: The ID of the payment link to
    # update.
    # @param [UpdatePaymentLinkRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdatePaymentLinkResponse Hash] response from the API call
    def update_payment_link(id:,
                            body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/online-checkout/payment-links/{id}',
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
