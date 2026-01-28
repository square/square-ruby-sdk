# frozen_string_literal: true

require_relative "wiremock_test_case"

class BookingsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_bookings_list_with_wiremock
    test_id = "bookings.list.0"

    result = @client.bookings.list(
      limit: 1,
      cursor: "cursor",
      customer_id: "customer_id",
      team_member_id: "team_member_id",
      location_id: "location_id",
      start_at_min: "start_at_min",
      start_at_max: "start_at_max",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.list.0"
        }
      }
    )

    result.pages.next_page

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

    @client.bookings.create(
      booking: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.create.0"
        }
      }
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

    @client.bookings.search_availability(
      query: {
        filter: {
          start_at_range: {}
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.search_availability.0"
        }
      }
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

    @client.bookings.bulk_retrieve_bookings(
      booking_ids: ["booking_ids"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.bulk_retrieve_bookings.0"
        }
      }
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

    @client.bookings.get_business_profile(request_options: {
                                            additional_headers: {
                                              "X-Test-Id" => "bookings.get_business_profile.0"
                                            }
                                          })

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

    @client.bookings.retrieve_location_booking_profile(
      location_id: "location_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.retrieve_location_booking_profile.0"
        }
      }
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

    @client.bookings.bulk_retrieve_team_member_booking_profiles(
      team_member_ids: ["team_member_ids"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.bulk_retrieve_team_member_booking_profiles.0"
        }
      }
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

    @client.bookings.get(
      booking_id: "booking_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.get.0"
        }
      }
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

    @client.bookings.update(
      booking_id: "booking_id",
      booking: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.update.0"
        }
      }
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

    @client.bookings.cancel(
      booking_id: "booking_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.cancel.0"
        }
      }
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
