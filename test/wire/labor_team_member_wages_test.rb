# frozen_string_literal: true

require_relative "wiremock_test_case"

class LaborTeamMemberWagesWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_labor_team_member_wages_list_with_wiremock
    test_id = "labor.team_member_wages.list.0"

    result = @client.labor.team_member_wages.list(
      team_member_id: "team_member_id",
      limit: 1,
      cursor: "cursor",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labor.team_member_wages.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/labor/team-member-wages",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_team_member_wages_get_with_wiremock
    test_id = "labor.team_member_wages.get.0"

    @client.labor.team_member_wages.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labor.team_member_wages.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/labor/team-member-wages/id",
      query_params: nil,
      expected: 1
    )
  end
end
