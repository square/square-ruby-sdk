# frozen_string_literal: true

require_relative "wiremock_test_case"

class TeamMembersWageSettingWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_team_members_wage_setting_get_with_wiremock
    test_id = "team_members.wage_setting.get.0"

    result = @client.team_members.wage_setting.get(
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

    verify_response_numbers(
      actual: result,
      expected: {
        "/wage_setting/job_assignments/0/hourly_rate/amount" => 2164,
        "/wage_setting/job_assignments/0/annual_rate/amount" => 4500000,
        "/wage_setting/job_assignments/0/weekly_hours" => 40,
        "/wage_setting/version" => 1
      }
    )
  end

  def test_team_members_wage_setting_update_with_wiremock
    test_id = "team_members.wage_setting.update.0"

    result = @client.team_members.wage_setting.update(
      team_member_id: "team_member_id",
      wage_setting: {
        job_assignments: [{
          job_title: "Manager",
          pay_type: "SALARY",
          annual_rate: {
            amount: 3000000,
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

    verify_request_body_numbers(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/team-members/team_member_id/wage-setting",
      expected: {
        "/wage_setting/job_assignments/0/annual_rate/amount" => 3000000,
        "/wage_setting/job_assignments/0/weekly_hours" => 40,
        "/wage_setting/job_assignments/1/hourly_rate/amount" => 2000
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/wage_setting/job_assignments/0/hourly_rate/amount" => 1443,
        "/wage_setting/job_assignments/0/annual_rate/amount" => 3000000,
        "/wage_setting/job_assignments/0/weekly_hours" => 40,
        "/wage_setting/job_assignments/1/hourly_rate/amount" => 2000,
        "/wage_setting/version" => 1
      }
    )
  end
end
