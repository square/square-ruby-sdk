module Square
  # CardsApi
  class CardsApi < BaseApi
    # Retrieves a list of cards owned by the account making the request.
    # A max of 25 cards will be returned.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for your original query.  See
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination) for more information.
    # @param [String] customer_id Optional parameter: Limit results to cards
    # associated with the customer supplied. By default, all cards owned by the
    # merchant are returned.
    # @param [TrueClass | FalseClass] include_disabled Optional parameter:
    # Includes disabled cards. By default, all enabled cards owned by the
    # merchant are returned.
    # @param [String] reference_id Optional parameter: Limit results to cards
    # associated with the reference_id supplied.
    # @param [SortOrder] sort_order Optional parameter: Sorts the returned list
    # by when the card was created with the specified order. This field defaults
    # to ASC.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_cards(cursor: nil,
                   customer_id: nil,
                   include_disabled: false,
                   reference_id: nil,
                   sort_order: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/cards',
                                     'default')
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(customer_id, key: 'customer_id'))
                   .query_param(new_parameter(include_disabled, key: 'include_disabled'))
                   .query_param(new_parameter(reference_id, key: 'reference_id'))
                   .query_param(new_parameter(sort_order, key: 'sort_order'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Adds a card on file to an existing merchant.
    # @param [CreateCardRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_card(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/cards',
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

    # Retrieves details for a specific Card.
    # @param [String] card_id Required parameter: Unique ID for the desired
    # Card.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_card(card_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/cards/{card_id}',
                                     'default')
                   .template_param(new_parameter(card_id, key: 'card_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Disables the card, preventing any further updates or charges.
    # Disabling an already disabled card is allowed but has no effect.
    # @param [String] card_id Required parameter: Unique ID for the desired
    # Card.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def disable_card(card_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/cards/{card_id}/disable',
                                     'default')
                   .template_param(new_parameter(card_id, key: 'card_id')
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
