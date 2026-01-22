# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class BookingsWireTest < Minitest::Test
  WIREMOCK_BASE_URL = "http://localhost:8080"
  WIREMOCK_ADMIN_URL = "http://localhost:8080/__admin"

  def setup
    super
    return if ENV["RUN_WIRE_TESTS"] == "true"

    skip "Wire tests are disabled by default. Set RUN_WIRE_TESTS=true to enable them."
  end

  def verify_request_count(test_id:, method:, url_path:, expected:, query_params: nil)
    uri = URI("#{WIREMOCK_ADMIN_URL}/requests/find")
    http = Net::HTTP.new(uri.host, uri.port)
    post_request = Net::HTTP::Post.new(uri.path, { "Content-Type" => "application/json" })

    request_body = { "method" => method, "urlPath" => url_path }
    request_body["headers"] = { "X-Test-Id" => { "equalTo" => test_id } }
    request_body["queryParameters"] = query_params.transform_values { |v| { "equalTo" => v } } if query_params

    post_request.body = request_body.to_json
    response = http.request(post_request)
    result = JSON.parse(response.body)
    requests = result["requests"] || []

    assert_equal expected, requests.length, "Expected #{expected} requests, found #{requests.length}"
  end

  def test_bookings_list_with_wiremock
    test_id = "bookings.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.bookings.list(
      limit: 1,
      cursor: "cursor",
      customer_id: "customer_id",
      team_member_id: "team_member_id",
      location_id: "location_id",
      start_at_min: "start_at_min",
      start_at_max: "start_at_max",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "bookings.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/bookings",
      query_params: nil,
      expected: 1
    )
  end

  def test_bookings_create_with_wiremock
    test_id = "bookings.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.bookings.create(
      booking: {},
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "bookings.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/bookings",
      query_params: nil,
      expected: 1
    )
  end

  def test_bookings_search_availability_with_wiremock
    test_id = "bookings.search_availability.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.bookings.search_availability(
      query: {
        filter: {
          start_at_range: {}
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "bookings.search_availability.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/bookings/availability/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_bookings_bulk_retrieve_bookings_with_wiremock
    test_id = "bookings.bulk_retrieve_bookings.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.bookings.bulk_retrieve_bookings(
      booking_ids: ["booking_ids"],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "bookings.bulk_retrieve_bookings.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/bookings/bulk-retrieve",
      query_params: nil,
      expected: 1
    )
  end

  def test_bookings_get_business_profile_with_wiremock
    test_id = "bookings.get_business_profile.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.bookings.get_business_profile(request_options: { base_url: WIREMOCK_BASE_URL,
                                                            additional_headers: {
                                                              "X-Test-Id" => "bookings.get_business_profile.0"
                                                            } })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/bookings/business-booking-profile",
      query_params: nil,
      expected: 1
    )
  end

  def test_bookings_retrieve_location_booking_profile_with_wiremock
    test_id = "bookings.retrieve_location_booking_profile.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.bookings.retrieve_location_booking_profile(
      location_id: "location_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "bookings.retrieve_location_booking_profile.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/bookings/location-booking-profiles/location_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_bookings_bulk_retrieve_team_member_booking_profiles_with_wiremock
    test_id = "bookings.bulk_retrieve_team_member_booking_profiles.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.bookings.bulk_retrieve_team_member_booking_profiles(
      team_member_ids: ["team_member_ids"],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "bookings.bulk_retrieve_team_member_booking_profiles.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/bookings/team-member-booking-profiles/bulk-retrieve",
      query_params: nil,
      expected: 1
    )
  end

  def test_bookings_get_with_wiremock
    test_id = "bookings.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.bookings.get(
      booking_id: "booking_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "bookings.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/bookings/booking_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_bookings_update_with_wiremock
    test_id = "bookings.update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.bookings.update(
      booking_id: "booking_id",
      booking: {},
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "bookings.update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/bookings/booking_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_bookings_cancel_with_wiremock
    test_id = "bookings.cancel.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.bookings.cancel(
      booking_id: "booking_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "bookings.cancel.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/bookings/booking_id/cancel",
      query_params: nil,
      expected: 1
    )
  end
end
