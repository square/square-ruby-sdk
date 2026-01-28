# frozen_string_literal: true

require_relative "wiremock_test_case"

class BookingsTeamMemberProfilesWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_bookings_team_member_profiles_list_with_wiremock
    test_id = "bookings.team_member_profiles.list.0"

    result = @client.bookings.team_member_profiles.list(
      bookable_only: true,
      limit: 1,
      cursor: "cursor",
      location_id: "location_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.team_member_profiles.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/bookings/team-member-booking-profiles",
      query_params: nil,
      expected: 1
    )
  end

  def test_bookings_team_member_profiles_get_with_wiremock
    test_id = "bookings.team_member_profiles.get.0"

    @client.bookings.team_member_profiles.get(
      team_member_id: "team_member_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bookings.team_member_profiles.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/bookings/team-member-booking-profiles/team_member_id",
      query_params: nil,
      expected: 1
    )
  end
end
