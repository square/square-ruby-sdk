module Square
  # BookingsApi
  class BookingsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

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
    # @return [ListBookingsResponse Hash] response from the API call
    def list_bookings(limit: nil,
                      cursor: nil,
                      team_member_id: nil,
                      location_id: nil,
                      start_at_min: nil,
                      start_at_max: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'limit' => limit,
        'cursor' => cursor,
        'team_member_id' => team_member_id,
        'location_id' => location_id,
        'start_at_min' => start_at_min,
        'start_at_max' => start_at_max
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Creates a booking.
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
    # @return [CreateBookingResponse Hash] response from the API call
    def create_booking(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Searches for availabilities for booking.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_READ` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
    # @param [SearchAvailabilityRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [SearchAvailabilityResponse Hash] response from the API call
    def search_availability(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/availability/search'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves a seller's booking profile.
    # @return [RetrieveBusinessBookingProfileResponse Hash] response from the API call
    def retrieve_business_booking_profile
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/business-booking-profile'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Lists booking profiles for team members.
    # @param [Boolean] bookable_only Optional parameter: Indicates whether to
    # include only bookable team members in the returned result (`true`) or not
    # (`false`).
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to return in a paged response.
    # @param [String] cursor Optional parameter: The pagination cursor from the
    # preceding response to return the next page of the results. Do not set this
    # when retrieving the first page of the results.
    # @param [String] location_id Optional parameter: Indicates whether to
    # include only team members enabled at the given location in the returned
    # result.
    # @return [ListTeamMemberBookingProfilesResponse Hash] response from the API call
    def list_team_member_booking_profiles(bookable_only: false,
                                          limit: nil,
                                          cursor: nil,
                                          location_id: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/team-member-booking-profiles'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'bookable_only' => bookable_only,
        'limit' => limit,
        'cursor' => cursor,
        'location_id' => location_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves a team member's booking profile.
    # @param [String] team_member_id Required parameter: The ID of the team
    # member to retrieve.
    # @return [RetrieveTeamMemberBookingProfileResponse Hash] response from the API call
    def retrieve_team_member_booking_profile(team_member_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/team-member-booking-profiles/{team_member_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'team_member_id' => { 'value' => team_member_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves a booking.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_READ` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
    # @param [String] booking_id Required parameter: The ID of the
    # [Booking]($m/Booking) object representing the to-be-retrieved booking.
    # @return [RetrieveBookingResponse Hash] response from the API call
    def retrieve_booking(booking_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/{booking_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'booking_id' => { 'value' => booking_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
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
    # [Booking]($m/Booking) object representing the to-be-updated booking.
    # @param [UpdateBookingRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdateBookingResponse Hash] response from the API call
    def update_booking(booking_id:,
                       body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/{booking_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'booking_id' => { 'value' => booking_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
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
    # [Booking]($m/Booking) object representing the to-be-cancelled booking.
    # @param [CancelBookingRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CancelBookingResponse Hash] response from the API call
    def cancel_booking(booking_id:,
                       body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/{booking_id}/cancel'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'booking_id' => { 'value' => booking_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end
  end
end
