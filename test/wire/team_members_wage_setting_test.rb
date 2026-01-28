# frozen_string_literal: true

require_relative "wiremock_test_case"

class TeamMembersWageSettingWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_team_members_wage_setting_get_with_wiremock
    test_id = "team_members.wage_setting.get.0"

    @client.team_members.wage_setting.get(
      team_member_id: "team_member_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "team_members.wage_setting.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/team-members/team_member_id/wage-setting",
      query_params: nil,
      expected: 1
    )
  end

  def test_team_members_wage_setting_update_with_wiremock
    test_id = "team_members.wage_setting.update.0"

    @client.team_members.wage_setting.update(
      team_member_id: "team_member_id",
      wage_setting: {
        job_assignments: [{
          job_title: "Manager",
          pay_type: "SALARY",
          annual_rate: {
            amount: 3_000_000,
            currency: "USD"
          },
          weekly_hours: 40
        }, {
          job_title: "Cashier",
          pay_type: "HOURLY",
          hourly_rate: {
            amount: 2000,
            currency: "USD"
          }
        }],
        is_overtime_exempt: true
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "team_members.wage_setting.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/team-members/team_member_id/wage-setting",
      query_params: nil,
      expected: 1
    )
  end
end
