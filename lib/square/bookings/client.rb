# frozen_string_literal: true
require_relative "../../requests"
require_relative "custom_attribute_definitions/client"
require_relative "custom_attributes/client"
require_relative "location_profiles/client"
require_relative "team_member_profiles/client"
require_relative "../types/list_bookings_response"
require_relative "../types/booking"
require_relative "../types/create_booking_response"
require_relative "../types/search_availability_query"
require_relative "../types/search_availability_response"
require_relative "../types/bulk_retrieve_bookings_response"
require_relative "../types/get_business_booking_profile_response"
require_relative "../types/retrieve_location_booking_profile_response"
require_relative "../types/bulk_retrieve_team_member_booking_profiles_response"
require_relative "../types/get_booking_response"
require_relative "../types/update_booking_response"
require_relative "../types/cancel_booking_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module square.rb
  class BookingsClient
  # @return [square.rb::RequestClient] 
    attr_reader :request_client
  # @return [square.rb::Bookings::CustomAttributeDefinitionsClient] 
    attr_reader :custom_attribute_definitions
  # @return [square.rb::Bookings::CustomAttributesClient] 
    attr_reader :custom_attributes
  # @return [square.rb::Bookings::LocationProfilesClient] 
    attr_reader :location_profiles
  # @return [square.rb::Bookings::TeamMemberProfilesClient] 
    attr_reader :team_member_profiles


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::BookingsClient]
    def initialize(request_client:)
      @request_client = request_client
      @custom_attribute_definitions = square.rb::Bookings::CustomAttributeDefinitionsClient.new(request_client: request_client)
      @custom_attributes = square.rb::Bookings::CustomAttributesClient.new(request_client: request_client)
      @location_profiles = square.rb::Bookings::LocationProfilesClient.new(request_client: request_client)
      @team_member_profiles = square.rb::Bookings::TeamMemberProfilesClient.new(request_client: request_client)
    end
# Retrieve a collection of bookings.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ`
#  and `APPOINTMENTS_READ` for the OAuth scope.
    #
    # @param limit [Integer] The maximum number of results per page to return in a paged response.
    # @param cursor [String] The pagination cursor from the preceding response to return the next page of the
#  results. Do not set this when retrieving the first page of the results.
    # @param customer_id [String] The [customer](entity:Customer) for whom to retrieve bookings. If this is not
#  set, bookings for all customers are retrieved.
    # @param team_member_id [String] The team member for whom to retrieve bookings. If this is not set, bookings of
#  all members are retrieved.
    # @param location_id [String] The location for which to retrieve bookings. If this is not set, all locations'
#  bookings are retrieved.
    # @param start_at_min [String] The RFC 3339 timestamp specifying the earliest of the start time. If this is not
#  set, the current time is used.
    # @param start_at_max [String] The RFC 3339 timestamp specifying the latest of the start time. If this is not
#  set, the time of 31 days after `start_at_min` is used.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListBookingsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.list
    def list(limit: nil, cursor: nil, customer_id: nil, team_member_id: nil, location_id: nil, start_at_min: nil, start_at_max: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "cursor": cursor, "customer_id": customer_id, "team_member_id": team_member_id, "location_id": location_id, "start_at_min": start_at_min, "start_at_max": start_at_max }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings"
end
      square.rb::ListBookingsResponse.from_json(json_object: response.body)
    end
# Creates a booking.
#  The required input must include the following:
#  - `Booking.location_id`
#  - `Booking.start_at`
#  - `Booking.AppointmentSegment.team_member_id`
#  - `Booking.AppointmentSegment.service_variation_id`
#  - `Booking.AppointmentSegment.service_variation_version`
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set
#  `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
#  For calls to this endpoint with seller-level permissions to succeed, the seller
#  must have subscribed to *Appointments Plus*
#  or *Appointments Premium*.
    #
    # @param idempotency_key [String] A unique key to make this request an idempotent operation.
    # @param booking [Hash] The details of the booking to be created.Request of type square.rb::Booking, as a Hash
    #   * :id (String) 
    #   * :version (Integer) 
    #   * :status (square.rb::BookingStatus) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :start_at (String) 
    #   * :location_id (String) 
    #   * :customer_id (String) 
    #   * :customer_note (String) 
    #   * :seller_note (String) 
    #   * :appointment_segments (Array<square.rb::AppointmentSegment>) 
    #   * :transition_time_minutes (Integer) 
    #   * :all_day (Boolean) 
    #   * :location_type (square.rb::BusinessAppointmentSettingsBookingLocationType) 
    #   * :creator_details (Hash)
    #     * :creator_type (square.rb::BookingCreatorDetailsCreatorType) 
    #     * :team_member_id (String) 
    #     * :customer_id (String) 
    #   * :source (square.rb::BookingBookingSource) 
    #   * :address (Hash)
    #     * :address_line_1 (String) 
    #     * :address_line_2 (String) 
    #     * :address_line_3 (String) 
    #     * :locality (String) 
    #     * :sublocality (String) 
    #     * :sublocality_2 (String) 
    #     * :sublocality_3 (String) 
    #     * :administrative_district_level_1 (String) 
    #     * :administrative_district_level_2 (String) 
    #     * :administrative_district_level_3 (String) 
    #     * :postal_code (String) 
    #     * :country (square.rb::Country) 
    #     * :first_name (String) 
    #     * :last_name (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CreateBookingResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.create(booking: {  })
    def create(idempotency_key: nil, booking:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, booking: booking }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings"
end
      square.rb::CreateBookingResponse.from_json(json_object: response.body)
    end
# Searches for availabilities for booking.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ`
#  and `APPOINTMENTS_READ` for the OAuth scope.
    #
    # @param query [Hash] Query conditions used to filter buyer-accessible booking availabilities.Request of type square.rb::SearchAvailabilityQuery, as a Hash
    #   * :filter (Hash)
    #     * :start_at_range (Hash)
    #       * :start_at (String) 
    #       * :end_at (String) 
    #     * :location_id (String) 
    #     * :segment_filters (Array<square.rb::SegmentFilter>) 
    #     * :booking_id (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::SearchAvailabilityResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.search_availability(query: { filter: { start_at_range: {  } } })
    def search_availability(query:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), query: query }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/availability/search"
end
      square.rb::SearchAvailabilityResponse.from_json(json_object: response.body)
    end
# Bulk-Retrieves a list of bookings by booking IDs.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ`
#  and `APPOINTMENTS_READ` for the OAuth scope.
    #
    # @param booking_ids [Array<String>] A non-empty list of [Booking](entity:Booking) IDs specifying bookings to
#  retrieve.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::BulkRetrieveBookingsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.bulk_retrieve_bookings(booking_ids: ["booking_ids"])
    def bulk_retrieve_bookings(booking_ids:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), booking_ids: booking_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/bulk-retrieve"
end
      square.rb::BulkRetrieveBookingsResponse.from_json(json_object: response.body)
    end
# Retrieves a seller's booking profile.
    #
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetBusinessBookingProfileResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.get_business_profile
    def get_business_profile(request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/business-booking-profile"
end
      square.rb::GetBusinessBookingProfileResponse.from_json(json_object: response.body)
    end
# Retrieves a seller's location booking profile.
    #
    # @param location_id [String] The ID of the location to retrieve the booking profile.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::RetrieveLocationBookingProfileResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.retrieve_location_booking_profile(location_id: "location_id")
    def retrieve_location_booking_profile(location_id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/location-booking-profiles/#{location_id}"
end
      square.rb::RetrieveLocationBookingProfileResponse.from_json(json_object: response.body)
    end
# Retrieves one or more team members' booking profiles.
    #
    # @param team_member_ids [Array<String>] A non-empty list of IDs of team members whose booking profiles you want to
#  retrieve.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::BulkRetrieveTeamMemberBookingProfilesResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.bulk_retrieve_team_member_booking_profiles(team_member_ids: ["team_member_ids"])
    def bulk_retrieve_team_member_booking_profiles(team_member_ids:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), team_member_ids: team_member_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/team-member-booking-profiles/bulk-retrieve"
end
      square.rb::BulkRetrieveTeamMemberBookingProfilesResponse.from_json(json_object: response.body)
    end
# Retrieves a booking.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ`
#  and `APPOINTMENTS_READ` for the OAuth scope.
    #
    # @param booking_id [String] The ID of the [Booking](entity:Booking) object representing the to-be-retrieved
#  booking.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetBookingResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.get(booking_id: "booking_id")
    def get(booking_id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/#{booking_id}"
end
      square.rb::GetBookingResponse.from_json(json_object: response.body)
    end
# Updates a booking.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set
#  `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
#  For calls to this endpoint with seller-level permissions to succeed, the seller
#  must have subscribed to *Appointments Plus*
#  or *Appointments Premium*.
    #
    # @param booking_id [String] The ID of the [Booking](entity:Booking) object representing the to-be-updated
#  booking.
    # @param idempotency_key [String] A unique key to make this request an idempotent operation.
    # @param booking [Hash] The booking to be updated. Individual attributes explicitly specified here
#  override the corresponding values of the existing booking.Request of type square.rb::Booking, as a Hash
    #   * :id (String) 
    #   * :version (Integer) 
    #   * :status (square.rb::BookingStatus) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :start_at (String) 
    #   * :location_id (String) 
    #   * :customer_id (String) 
    #   * :customer_note (String) 
    #   * :seller_note (String) 
    #   * :appointment_segments (Array<square.rb::AppointmentSegment>) 
    #   * :transition_time_minutes (Integer) 
    #   * :all_day (Boolean) 
    #   * :location_type (square.rb::BusinessAppointmentSettingsBookingLocationType) 
    #   * :creator_details (Hash)
    #     * :creator_type (square.rb::BookingCreatorDetailsCreatorType) 
    #     * :team_member_id (String) 
    #     * :customer_id (String) 
    #   * :source (square.rb::BookingBookingSource) 
    #   * :address (Hash)
    #     * :address_line_1 (String) 
    #     * :address_line_2 (String) 
    #     * :address_line_3 (String) 
    #     * :locality (String) 
    #     * :sublocality (String) 
    #     * :sublocality_2 (String) 
    #     * :sublocality_3 (String) 
    #     * :administrative_district_level_1 (String) 
    #     * :administrative_district_level_2 (String) 
    #     * :administrative_district_level_3 (String) 
    #     * :postal_code (String) 
    #     * :country (square.rb::Country) 
    #     * :first_name (String) 
    #     * :last_name (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::UpdateBookingResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.update(booking_id: "booking_id", booking: {  })
    def update(booking_id:, idempotency_key: nil, booking:, request_options: nil)
      response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, booking: booking }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/#{booking_id}"
end
      square.rb::UpdateBookingResponse.from_json(json_object: response.body)
    end
# Cancels an existing booking.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set
#  `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
#  For calls to this endpoint with seller-level permissions to succeed, the seller
#  must have subscribed to *Appointments Plus*
#  or *Appointments Premium*.
    #
    # @param booking_id [String] The ID of the [Booking](entity:Booking) object representing the to-be-cancelled
#  booking.
    # @param idempotency_key [String] A unique key to make this request an idempotent operation.
    # @param booking_version [Integer] The revision number for the booking used for optimistic concurrency.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CancelBookingResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.cancel(booking_id: "booking_id")
    def cancel(booking_id:, idempotency_key: nil, booking_version: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, booking_version: booking_version }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/#{booking_id}/cancel"
end
      square.rb::CancelBookingResponse.from_json(json_object: response.body)
    end
  end
  class AsyncBookingsClient
  # @return [square.rb::AsyncRequestClient] 
    attr_reader :request_client
  # @return [square.rb::Bookings::CustomAttributeDefinitionsClient] 
    attr_reader :custom_attribute_definitions
  # @return [square.rb::Bookings::CustomAttributesClient] 
    attr_reader :custom_attributes
  # @return [square.rb::Bookings::LocationProfilesClient] 
    attr_reader :location_profiles
  # @return [square.rb::Bookings::TeamMemberProfilesClient] 
    attr_reader :team_member_profiles


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::AsyncBookingsClient]
    def initialize(request_client:)
      @request_client = request_client
      @custom_attribute_definitions = square.rb::Bookings::AsyncCustomAttributeDefinitionsClient.new(request_client: request_client)
      @custom_attributes = square.rb::Bookings::AsyncCustomAttributesClient.new(request_client: request_client)
      @location_profiles = square.rb::Bookings::AsyncLocationProfilesClient.new(request_client: request_client)
      @team_member_profiles = square.rb::Bookings::AsyncTeamMemberProfilesClient.new(request_client: request_client)
    end
# Retrieve a collection of bookings.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ`
#  and `APPOINTMENTS_READ` for the OAuth scope.
    #
    # @param limit [Integer] The maximum number of results per page to return in a paged response.
    # @param cursor [String] The pagination cursor from the preceding response to return the next page of the
#  results. Do not set this when retrieving the first page of the results.
    # @param customer_id [String] The [customer](entity:Customer) for whom to retrieve bookings. If this is not
#  set, bookings for all customers are retrieved.
    # @param team_member_id [String] The team member for whom to retrieve bookings. If this is not set, bookings of
#  all members are retrieved.
    # @param location_id [String] The location for which to retrieve bookings. If this is not set, all locations'
#  bookings are retrieved.
    # @param start_at_min [String] The RFC 3339 timestamp specifying the earliest of the start time. If this is not
#  set, the current time is used.
    # @param start_at_max [String] The RFC 3339 timestamp specifying the latest of the start time. If this is not
#  set, the time of 31 days after `start_at_min` is used.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListBookingsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.list
    def list(limit: nil, cursor: nil, customer_id: nil, team_member_id: nil, location_id: nil, start_at_min: nil, start_at_max: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "cursor": cursor, "customer_id": customer_id, "team_member_id": team_member_id, "location_id": location_id, "start_at_min": start_at_min, "start_at_max": start_at_max }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings"
end
        square.rb::ListBookingsResponse.from_json(json_object: response.body)
      end
    end
# Creates a booking.
#  The required input must include the following:
#  - `Booking.location_id`
#  - `Booking.start_at`
#  - `Booking.AppointmentSegment.team_member_id`
#  - `Booking.AppointmentSegment.service_variation_id`
#  - `Booking.AppointmentSegment.service_variation_version`
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set
#  `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
#  For calls to this endpoint with seller-level permissions to succeed, the seller
#  must have subscribed to *Appointments Plus*
#  or *Appointments Premium*.
    #
    # @param idempotency_key [String] A unique key to make this request an idempotent operation.
    # @param booking [Hash] The details of the booking to be created.Request of type square.rb::Booking, as a Hash
    #   * :id (String) 
    #   * :version (Integer) 
    #   * :status (square.rb::BookingStatus) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :start_at (String) 
    #   * :location_id (String) 
    #   * :customer_id (String) 
    #   * :customer_note (String) 
    #   * :seller_note (String) 
    #   * :appointment_segments (Array<square.rb::AppointmentSegment>) 
    #   * :transition_time_minutes (Integer) 
    #   * :all_day (Boolean) 
    #   * :location_type (square.rb::BusinessAppointmentSettingsBookingLocationType) 
    #   * :creator_details (Hash)
    #     * :creator_type (square.rb::BookingCreatorDetailsCreatorType) 
    #     * :team_member_id (String) 
    #     * :customer_id (String) 
    #   * :source (square.rb::BookingBookingSource) 
    #   * :address (Hash)
    #     * :address_line_1 (String) 
    #     * :address_line_2 (String) 
    #     * :address_line_3 (String) 
    #     * :locality (String) 
    #     * :sublocality (String) 
    #     * :sublocality_2 (String) 
    #     * :sublocality_3 (String) 
    #     * :administrative_district_level_1 (String) 
    #     * :administrative_district_level_2 (String) 
    #     * :administrative_district_level_3 (String) 
    #     * :postal_code (String) 
    #     * :country (square.rb::Country) 
    #     * :first_name (String) 
    #     * :last_name (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CreateBookingResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.create(booking: {  })
    def create(idempotency_key: nil, booking:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, booking: booking }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings"
end
        square.rb::CreateBookingResponse.from_json(json_object: response.body)
      end
    end
# Searches for availabilities for booking.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ`
#  and `APPOINTMENTS_READ` for the OAuth scope.
    #
    # @param query [Hash] Query conditions used to filter buyer-accessible booking availabilities.Request of type square.rb::SearchAvailabilityQuery, as a Hash
    #   * :filter (Hash)
    #     * :start_at_range (Hash)
    #       * :start_at (String) 
    #       * :end_at (String) 
    #     * :location_id (String) 
    #     * :segment_filters (Array<square.rb::SegmentFilter>) 
    #     * :booking_id (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::SearchAvailabilityResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.search_availability(query: { filter: { start_at_range: {  } } })
    def search_availability(query:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), query: query }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/availability/search"
end
        square.rb::SearchAvailabilityResponse.from_json(json_object: response.body)
      end
    end
# Bulk-Retrieves a list of bookings by booking IDs.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ`
#  and `APPOINTMENTS_READ` for the OAuth scope.
    #
    # @param booking_ids [Array<String>] A non-empty list of [Booking](entity:Booking) IDs specifying bookings to
#  retrieve.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::BulkRetrieveBookingsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.bulk_retrieve_bookings(booking_ids: ["booking_ids"])
    def bulk_retrieve_bookings(booking_ids:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), booking_ids: booking_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/bulk-retrieve"
end
        square.rb::BulkRetrieveBookingsResponse.from_json(json_object: response.body)
      end
    end
# Retrieves a seller's booking profile.
    #
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetBusinessBookingProfileResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.get_business_profile
    def get_business_profile(request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/business-booking-profile"
end
        square.rb::GetBusinessBookingProfileResponse.from_json(json_object: response.body)
      end
    end
# Retrieves a seller's location booking profile.
    #
    # @param location_id [String] The ID of the location to retrieve the booking profile.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::RetrieveLocationBookingProfileResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.retrieve_location_booking_profile(location_id: "location_id")
    def retrieve_location_booking_profile(location_id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/location-booking-profiles/#{location_id}"
end
        square.rb::RetrieveLocationBookingProfileResponse.from_json(json_object: response.body)
      end
    end
# Retrieves one or more team members' booking profiles.
    #
    # @param team_member_ids [Array<String>] A non-empty list of IDs of team members whose booking profiles you want to
#  retrieve.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::BulkRetrieveTeamMemberBookingProfilesResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.bulk_retrieve_team_member_booking_profiles(team_member_ids: ["team_member_ids"])
    def bulk_retrieve_team_member_booking_profiles(team_member_ids:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), team_member_ids: team_member_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/team-member-booking-profiles/bulk-retrieve"
end
        square.rb::BulkRetrieveTeamMemberBookingProfilesResponse.from_json(json_object: response.body)
      end
    end
# Retrieves a booking.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ`
#  and `APPOINTMENTS_READ` for the OAuth scope.
    #
    # @param booking_id [String] The ID of the [Booking](entity:Booking) object representing the to-be-retrieved
#  booking.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetBookingResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.get(booking_id: "booking_id")
    def get(booking_id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/#{booking_id}"
end
        square.rb::GetBookingResponse.from_json(json_object: response.body)
      end
    end
# Updates a booking.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set
#  `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
#  For calls to this endpoint with seller-level permissions to succeed, the seller
#  must have subscribed to *Appointments Plus*
#  or *Appointments Premium*.
    #
    # @param booking_id [String] The ID of the [Booking](entity:Booking) object representing the to-be-updated
#  booking.
    # @param idempotency_key [String] A unique key to make this request an idempotent operation.
    # @param booking [Hash] The booking to be updated. Individual attributes explicitly specified here
#  override the corresponding values of the existing booking.Request of type square.rb::Booking, as a Hash
    #   * :id (String) 
    #   * :version (Integer) 
    #   * :status (square.rb::BookingStatus) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :start_at (String) 
    #   * :location_id (String) 
    #   * :customer_id (String) 
    #   * :customer_note (String) 
    #   * :seller_note (String) 
    #   * :appointment_segments (Array<square.rb::AppointmentSegment>) 
    #   * :transition_time_minutes (Integer) 
    #   * :all_day (Boolean) 
    #   * :location_type (square.rb::BusinessAppointmentSettingsBookingLocationType) 
    #   * :creator_details (Hash)
    #     * :creator_type (square.rb::BookingCreatorDetailsCreatorType) 
    #     * :team_member_id (String) 
    #     * :customer_id (String) 
    #   * :source (square.rb::BookingBookingSource) 
    #   * :address (Hash)
    #     * :address_line_1 (String) 
    #     * :address_line_2 (String) 
    #     * :address_line_3 (String) 
    #     * :locality (String) 
    #     * :sublocality (String) 
    #     * :sublocality_2 (String) 
    #     * :sublocality_3 (String) 
    #     * :administrative_district_level_1 (String) 
    #     * :administrative_district_level_2 (String) 
    #     * :administrative_district_level_3 (String) 
    #     * :postal_code (String) 
    #     * :country (square.rb::Country) 
    #     * :first_name (String) 
    #     * :last_name (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::UpdateBookingResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.update(booking_id: "booking_id", booking: {  })
    def update(booking_id:, idempotency_key: nil, booking:, request_options: nil)
      Async do
        response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, booking: booking }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/#{booking_id}"
end
        square.rb::UpdateBookingResponse.from_json(json_object: response.body)
      end
    end
# Cancels an existing booking.
#  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for
#  the OAuth scope.
#  To call this endpoint with seller-level permissions, set
#  `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
#  For calls to this endpoint with seller-level permissions to succeed, the seller
#  must have subscribed to *Appointments Plus*
#  or *Appointments Premium*.
    #
    # @param booking_id [String] The ID of the [Booking](entity:Booking) object representing the to-be-cancelled
#  booking.
    # @param idempotency_key [String] A unique key to make this request an idempotent operation.
    # @param booking_version [Integer] The revision number for the booking used for optimistic concurrency.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CancelBookingResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.cancel(booking_id: "booking_id")
    def cancel(booking_id:, idempotency_key: nil, booking_version: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, booking_version: booking_version }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/#{booking_id}/cancel"
end
        square.rb::CancelBookingResponse.from_json(json_object: response.body)
      end
    end
  end
end