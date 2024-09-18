module Square
  # EventsApi
  class EventsApi < BaseApi
    # Search for Square API events that occur within a 28-day timeframe.
    # @param [SearchEventsRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def search_events(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/events',
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

    # Disables events to prevent them from being searchable.
    # All events are disabled by default. You must enable events to make them
    # searchable.
    # Disabling events for a specific time period prevents them from being
    # searchable, even if you re-enable them later.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def disable_events
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/events/disable',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Enables events to make them searchable. Only events that occur while in
    # the enabled state are searchable.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def enable_events
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/events/enable',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Lists all event types that you can subscribe to as webhooks or query using
    # the Events API.
    # @param [String] api_version Optional parameter: The API version for which
    # to list event types. Setting this field overrides the default version used
    # by the application.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_event_types(api_version: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/events/types',
                                     'default')
                   .query_param(new_parameter(api_version, key: 'api_version'))
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
