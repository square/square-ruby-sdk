# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class LaborShiftsWireTest < Minitest::Test
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

  def test_labor_shifts_create_with_wiremock
    test_id = "labor.shifts.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.shifts.create(
      idempotency_key: "HIDSNG5KS478L",
      shift: {
        location_id: "PAA1RJZZKXBFG",
        start_at: "2019-01-25T03:11:00-05:00",
        end_at: "2019-01-25T13:11:00-05:00",
        wage: {
          title: "Barista",
          hourly_rate: {
            amount: 1100,
            currency: "USD"
          },
          tip_eligible: true
        },
        breaks: [{
          start_at: "2019-01-25T06:11:00-05:00",
          end_at: "2019-01-25T06:16:00-05:00",
          break_type_id: "REGS1EQR1TPZ5",
          name: "Tea Break",
          expected_duration: "PT5M",
          is_paid: true
        }],
        team_member_id: "ormj0jJJZ5OZIzxrZYJI",
        declared_cash_tip_money: {
          amount: 500,
          currency: "USD"
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.shifts.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/labor/shifts",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_shifts_search_with_wiremock
    test_id = "labor.shifts.search.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.shifts.search(
      query: {
        filter: {
          workday: {
            date_range: {
              start_date: "2019-01-20",
              end_date: "2019-02-03"
            },
            match_shifts_by: "START_AT",
            default_timezone: "America/Los_Angeles"
          }
        }
      },
      limit: 100,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.shifts.search.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/labor/shifts/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_shifts_get_with_wiremock
    test_id = "labor.shifts.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.shifts.get(
      id: "id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.shifts.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/labor/shifts/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_shifts_update_with_wiremock
    test_id = "labor.shifts.update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.shifts.update(
      id: "id",
      shift: {
        location_id: "PAA1RJZZKXBFG",
        start_at: "2019-01-25T03:11:00-05:00",
        end_at: "2019-01-25T13:11:00-05:00",
        wage: {
          title: "Bartender",
          hourly_rate: {
            amount: 1500,
            currency: "USD"
          },
          tip_eligible: true
        },
        breaks: [{
          id: "X7GAQYVVRRG6P",
          start_at: "2019-01-25T06:11:00-05:00",
          end_at: "2019-01-25T06:16:00-05:00",
          break_type_id: "REGS1EQR1TPZ5",
          name: "Tea Break",
          expected_duration: "PT5M",
          is_paid: true
        }],
        version: 1,
        team_member_id: "ormj0jJJZ5OZIzxrZYJI",
        declared_cash_tip_money: {
          amount: 500,
          currency: "USD"
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.shifts.update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/labor/shifts/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_shifts_delete_with_wiremock
    test_id = "labor.shifts.delete.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.shifts.delete(
      id: "id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.shifts.delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/labor/shifts/id",
      query_params: nil,
      expected: 1
    )
  end
end
