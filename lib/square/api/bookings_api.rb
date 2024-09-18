module Square
  # BookingsApi
  class BookingsApi < BaseApi
    # Retrieve a collection of bookings.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_READ` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
    # @param [Integer] limit Optional parameter: The maximum number of results
    # per page to return in a paged response.
    # @param [String] cursor Optional parameter: The pagination cursor from the
    # preceding response to return the next page of the results. Do not set this
    # when retrieving the first page of the results.
    # @param [String] customer_id Optional parameter: The
    # [customer](entity:Customer) for whom to retrieve bookings. If this is not
    # set, bookings for all customers are retrieved.
    # @param [String] team_member_id Optional parameter: The team member for
    # whom to retrieve bookings. If this is not set, bookings of all members are
    # retrieved.
    # @param [String] location_id Optional parameter: The location for which to
    # retrieve bookings. If this is not set, all locations' bookings are
    # retrieved.
    # @param [String] start_at_min Optional parameter: The RFC 3339 timestamp
    # specifying the earliest of the start time. If this is not set, the current
    # time is used.
    # @param [String] start_at_max Optional parameter: The RFC 3339 timestamp
    # specifying the latest of the start time. If this is not set, the time of
    # 31 days after `start_at_min` is used.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_bookings(limit: nil,
                      cursor: nil,
                      customer_id: nil,
                      team_member_id: nil,
                      location_id: nil,
                      start_at_min: nil,
                      start_at_max: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/bookings',
                                     'default')
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(customer_id, key: 'customer_id'))
                   .query_param(new_parameter(team_member_id, key: 'team_member_id'))
                   .query_param(new_parameter(location_id, key: 'location_id'))
                   .query_param(new_parameter(start_at_min, key: 'start_at_min'))
                   .query_param(new_parameter(start_at_max, key: 'start_at_max'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates a booking.
    # The required input must include the following:
    # - `Booking.location_id`
    # - `Booking.start_at`
    # - `Booking.AppointmentSegment.team_member_id`
    # - `Booking.AppointmentSegment.service_variation_id`
    # - `Booking.AppointmentSegment.service_variation_version`
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_WRITE` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
    # For calls to this endpoint with seller-level permissions to succeed, the
    # seller must have subscribed to *Appointments Plus*
    # or *Appointments Premium*.
    # @param [CreateBookingRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_booking(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/bookings',
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

    # Searches for availabilities for booking.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_READ` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
    # @param [SearchAvailabilityRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def search_availability(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/bookings/availability/search',
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

    # Bulk-Retrieves a list of bookings by booking IDs.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_READ` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
    # @param [BulkRetrieveBookingsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def bulk_retrieve_bookings(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/bookings/bulk-retrieve',
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

    # Retrieves a seller's booking profile.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_business_booking_profile
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/bookings/business-booking-profile',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Lists location booking profiles of a seller.
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to return in a paged response.
    # @param [String] cursor Optional parameter: The pagination cursor from the
    # preceding response to return the next page of the results. Do not set this
    # when retrieving the first page of the results.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_location_booking_profiles(limit: nil,
                                       cursor: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/bookings/location-booking-profiles',
                                     'default')
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

    # Retrieves a seller's location booking profile.
    # @param [String] location_id Required parameter: The ID of the location to
    # retrieve the booking profile.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_location_booking_profile(location_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/bookings/location-booking-profiles/{location_id}',
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

    # Lists booking profiles for team members.
    # @param [TrueClass | FalseClass] bookable_only Optional parameter:
    # Indicates whether to include only bookable team members in the returned
    # result (`true`) or not (`false`).
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to return in a paged response.
    # @param [String] cursor Optional parameter: The pagination cursor from the
    # preceding response to return the next page of the results. Do not set this
    # when retrieving the first page of the results.
    # @param [String] location_id Optional parameter: Indicates whether to
    # include only team members enabled at the given location in the returned
    # result.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_team_member_booking_profiles(bookable_only: false,
                                          limit: nil,
                                          cursor: nil,
                                          location_id: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/bookings/team-member-booking-profiles',
                                     'default')
                   .query_param(new_parameter(bookable_only, key: 'bookable_only'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(location_id, key: 'location_id'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves one or more team members' booking profiles.
    # @param [BulkRetrieveTeamMemberBookingProfilesRequest] body Required
    # parameter: An object containing the fields to POST for the request.  See
    # the corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def bulk_retrieve_team_member_booking_profiles(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/bookings/team-member-booking-profiles/bulk-retrieve',
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

    # Retrieves a team member's booking profile.
    # @param [String] team_member_id Required parameter: The ID of the team
    # member to retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_team_member_booking_profile(team_member_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/bookings/team-member-booking-profiles/{team_member_id}',
                                     'default')
                   .template_param(new_parameter(team_member_id, key: 'team_member_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves a booking.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_READ` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
    # @param [String] booking_id Required parameter: The ID of the
    # [Booking](entity:Booking) object representing the to-be-retrieved
    # booking.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_booking(booking_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/bookings/{booking_id}',
                                     'default')
                   .template_param(new_parameter(booking_id, key: 'booking_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates a booking.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_WRITE` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
    # For calls to this endpoint with seller-level permissions to succeed, the
    # seller must have subscribed to *Appointments Plus*
    # or *Appointments Premium*.
    # @param [String] booking_id Required parameter: The ID of the
    # [Booking](entity:Booking) object representing the to-be-updated booking.
    # @param [UpdateBookingRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def update_booking(booking_id:,
                       body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/bookings/{booking_id}',
                                     'default')
                   .template_param(new_parameter(booking_id, key: 'booking_id')
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

    # Cancels an existing booking.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_WRITE` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
    # For calls to this endpoint with seller-level permissions to succeed, the
    # seller must have subscribed to *Appointments Plus*
    # or *Appointments Premium*.
    # @param [String] booking_id Required parameter: The ID of the
    # [Booking](entity:Booking) object representing the to-be-cancelled
    # booking.
    # @param [CancelBookingRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def cancel_booking(booking_id:,
                       body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/bookings/{booking_id}/cancel',
                                     'default')
                   .template_param(new_parameter(booking_id, key: 'booking_id')
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
