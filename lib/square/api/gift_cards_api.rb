module Square
  # GiftCardsApi
  class GiftCardsApi < BaseApi
    # Lists all gift cards. You can specify optional filters to retrieve
    # a subset of the gift cards. Results are sorted by `created_at` in
    # ascending order.
    # @param [String] type Optional parameter: If a [type](entity:GiftCardType)
    # is provided, the endpoint returns gift cards of the specified type.
    # Otherwise, the endpoint returns gift cards of all types.
    # @param [String] state Optional parameter: If a
    # [state](entity:GiftCardStatus) is provided, the endpoint returns the gift
    # cards in the specified state. Otherwise, the endpoint returns the gift
    # cards of all states.
    # @param [Integer] limit Optional parameter: If a limit is provided, the
    # endpoint returns only the specified number of results per page. The
    # maximum value is 200. The default value is 30. For more information, see
    # [Pagination](https://developer.squareup.com/docs/working-with-apis/paginat
    # ion).
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for the original query. If a cursor is not provided, the
    # endpoint returns the first page of the results.  For more information, see
    # [Pagination](https://developer.squareup.com/docs/working-with-apis/paginat
    # ion).
    # @param [String] customer_id Optional parameter: If a customer ID is
    # provided, the endpoint returns only the gift cards linked to the specified
    # customer.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_gift_cards(type: nil,
                        state: nil,
                        limit: nil,
                        cursor: nil,
                        customer_id: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/gift-cards',
                                     'default')
                   .query_param(new_parameter(type, key: 'type'))
                   .query_param(new_parameter(state, key: 'state'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(customer_id, key: 'customer_id'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates a digital gift card or registers a physical (plastic) gift card.
    # The resulting gift card
    # has a `PENDING` state. To activate a gift card so that it can be redeemed
    # for purchases, call
    # [CreateGiftCardActivity]($e/GiftCardActivities/CreateGiftCardActivity) and
    # create an `ACTIVATE`
    # activity with the initial balance. Alternatively, you can use
    # [RefundPayment]($e/Refunds/RefundPayment)
    # to refund a payment to the new gift card.
    # @param [CreateGiftCardRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_gift_card(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/gift-cards',
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

    # Retrieves a gift card using the gift card account number (GAN).
    # @param [RetrieveGiftCardFromGANRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_gift_card_from_gan(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/gift-cards/from-gan',
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

    # Retrieves a gift card using a secure payment token that represents the
    # gift card.
    # @param [RetrieveGiftCardFromNonceRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_gift_card_from_nonce(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/gift-cards/from-nonce',
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

    # Links a customer to a gift card, which is also referred to as adding a
    # card on file.
    # @param [String] gift_card_id Required parameter: The ID of the gift card
    # to be linked.
    # @param [LinkCustomerToGiftCardRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def link_customer_to_gift_card(gift_card_id:,
                                   body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/gift-cards/{gift_card_id}/link-customer',
                                     'default')
                   .template_param(new_parameter(gift_card_id, key: 'gift_card_id')
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

    # Unlinks a customer from a gift card, which is also referred to as removing
    # a card on file.
    # @param [String] gift_card_id Required parameter: The ID of the gift card
    # to be unlinked.
    # @param [UnlinkCustomerFromGiftCardRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def unlink_customer_from_gift_card(gift_card_id:,
                                       body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/gift-cards/{gift_card_id}/unlink-customer',
                                     'default')
                   .template_param(new_parameter(gift_card_id, key: 'gift_card_id')
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

    # Retrieves a gift card using the gift card ID.
    # @param [String] id Required parameter: The ID of the gift card to
    # retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_gift_card(id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/gift-cards/{id}',
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
