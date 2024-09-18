module Square
  # LocationsApi
  class LocationsApi < BaseApi
    # Provides details about all of the seller's
    # [locations](https://developer.squareup.com/docs/locations-api),
    # including those with an inactive status. Locations are listed
    # alphabetically by `name`.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_locations
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/locations',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates a [location](https://developer.squareup.com/docs/locations-api).
    # Creating new locations allows for separate configuration of receipt
    # layouts, item prices,
    # and sales reports. Developers can use locations to separate sales activity
    # through applications
    # that integrate with Square from sales activity elsewhere in a seller's
    # account.
    # Locations created programmatically with the Locations API last forever and
    # are visible to the seller for their own management. Therefore, ensure that
    # each location has a sensible and unique name.
    # @param [CreateLocationRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_location(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/locations',
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

    # Retrieves details of a single location. Specify "main"
    # as the location ID to retrieve details of the [main
    # location](https://developer.squareup.com/docs/locations-api#about-the-main
    # -location).
    # @param [String] location_id Required parameter: The ID of the location to
    # retrieve. Specify the string "main" to return the main location.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_location(location_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/locations/{location_id}',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates a [location](https://developer.squareup.com/docs/locations-api).
    # @param [String] location_id Required parameter: The ID of the location to
    # update.
    # @param [UpdateLocationRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def update_location(location_id:,
                        body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/locations/{location_id}',
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
  end
end
