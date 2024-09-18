module Square
  # GiftCardActivitiesApi
  class GiftCardActivitiesApi < BaseApi
    # Lists gift card activities. By default, you get gift card activities for
    # all
    # gift cards in the seller's account. You can optionally specify query
    # parameters to
    # filter the list. For example, you can get a list of gift card activities
    # for a gift card,
    # for all gift cards in a specific region, or for activities within a time
    # window.
    # @param [String] gift_card_id Optional parameter: If a gift card ID is
    # provided, the endpoint returns activities related  to the specified gift
    # card. Otherwise, the endpoint returns all gift card activities for  the
    # seller.
    # @param [String] type Optional parameter: If a
    # [type](entity:GiftCardActivityType) is provided, the endpoint returns gift
    # card activities of the specified type.  Otherwise, the endpoint returns
    # all types of gift card activities.
    # @param [String] location_id Optional parameter: If a location ID is
    # provided, the endpoint returns gift card activities for the specified
    # location.  Otherwise, the endpoint returns gift card activities for all
    # locations.
    # @param [String] begin_time Optional parameter: The timestamp for the
    # beginning of the reporting period, in RFC 3339 format. This start time is
    # inclusive. The default value is the current time minus one year.
    # @param [String] end_time Optional parameter: The timestamp for the end of
    # the reporting period, in RFC 3339 format. This end time is inclusive. The
    # default value is the current time.
    # @param [Integer] limit Optional parameter: If a limit is provided, the
    # endpoint returns the specified number  of results (or fewer) per page. The
    # maximum value is 100. The default value is 50. For more information, see
    # [Pagination](https://developer.squareup.com/docs/working-with-apis/paginat
    # ion).
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for the original query. If a cursor is not provided, the
    # endpoint returns the first page of the results. For more information, see
    # [Pagination](https://developer.squareup.com/docs/working-with-apis/paginat
    # ion).
    # @param [String] sort_order Optional parameter: The order in which the
    # endpoint returns the activities, based on `created_at`. - `ASC` - Oldest
    # to newest. - `DESC` - Newest to oldest (default).
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_gift_card_activities(gift_card_id: nil,
                                  type: nil,
                                  location_id: nil,
                                  begin_time: nil,
                                  end_time: nil,
                                  limit: nil,
                                  cursor: nil,
                                  sort_order: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/gift-cards/activities',
                                     'default')
                   .query_param(new_parameter(gift_card_id, key: 'gift_card_id'))
                   .query_param(new_parameter(type, key: 'type'))
                   .query_param(new_parameter(location_id, key: 'location_id'))
                   .query_param(new_parameter(begin_time, key: 'begin_time'))
                   .query_param(new_parameter(end_time, key: 'end_time'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(sort_order, key: 'sort_order'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates a gift card activity to manage the balance or state of a [gift
    # card]($m/GiftCard).
    # For example, create an `ACTIVATE` activity to activate a gift card with an
    # initial balance before first use.
    # @param [CreateGiftCardActivityRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_gift_card_activity(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/gift-cards/activities',
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
  end
end
