# frozen_string_literal: true

require_relative "wiremock_test_case"

class BookingsLocationProfilesWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_bookings_location_profiles_list_with_wiremock
    test_id = "bookings.location_profiles.list.0"

    result = @client.bookings.location_profiles.list(
      limit: 1,
      cursor: "cursor",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.location_profiles.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/bookings/location-booking-profiles",
      query_params: nil,
      expected: 1
    )
  end
end
