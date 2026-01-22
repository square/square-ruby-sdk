# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class TeamMembersWageSettingWireTest < Minitest::Test
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

  def test_team_members_wage_setting_get_with_wiremock
    test_id = "team_members.wage_setting.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.team_members.wage_setting.get(
      team_member_id: "team_member_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "team_members.wage_setting.get.0"
                         } }
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

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.team_members.wage_setting.update(
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
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "team_members.wage_setting.update.0"
                         } }
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
