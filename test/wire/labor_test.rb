# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class LaborWireTest < Minitest::Test
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

  def test_labor_create_scheduled_shift_with_wiremock
    test_id = "labor.create_scheduled_shift.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.create_scheduled_shift(
      idempotency_key: "HIDSNG5KS478L",
      scheduled_shift: {
        draft_shift_details: {
          team_member_id: "ormj0jJJZ5OZIzxrZYJI",
          location_id: "PAA1RJZZKXBFG",
          job_id: "FzbJAtt9qEWncK1BWgVCxQ6M",
          start_at: "2019-01-25T03:11:00-05:00",
          end_at: "2019-01-25T13:11:00-05:00",
          notes: "Dont forget to prep the vegetables",
          is_deleted: false
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.create_scheduled_shift.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/labor/scheduled-shifts",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_bulk_publish_scheduled_shifts_with_wiremock
    test_id = "labor.bulk_publish_scheduled_shifts.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.bulk_publish_scheduled_shifts(
      scheduled_shifts: {
        key: {}
      },
      scheduled_shift_notification_audience: "AFFECTED",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.bulk_publish_scheduled_shifts.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/labor/scheduled-shifts/bulk-publish",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_search_scheduled_shifts_with_wiremock
    test_id = "labor.search_scheduled_shifts.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.search_scheduled_shifts(
      query: {
        filter: {
          assignment_status: "ASSIGNED"
        },
        sort: {
          field: "CREATED_AT",
          order: "ASC"
        }
      },
      limit: 2,
      cursor: "xoxp-1234-5678-90123",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.search_scheduled_shifts.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/labor/scheduled-shifts/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_retrieve_scheduled_shift_with_wiremock
    test_id = "labor.retrieve_scheduled_shift.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.retrieve_scheduled_shift(
      id: "id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.retrieve_scheduled_shift.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/labor/scheduled-shifts/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_update_scheduled_shift_with_wiremock
    test_id = "labor.update_scheduled_shift.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.update_scheduled_shift(
      id: "id",
      scheduled_shift: {
        draft_shift_details: {
          team_member_id: "ormj0jJJZ5OZIzxrZYJI",
          location_id: "PAA1RJZZKXBFG",
          job_id: "FzbJAtt9qEWncK1BWgVCxQ6M",
          start_at: "2019-03-25T03:11:00-05:00",
          end_at: "2019-03-25T13:18:00-05:00",
          notes: "Dont forget to prep the vegetables",
          is_deleted: false
        },
        version: 1
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.update_scheduled_shift.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/labor/scheduled-shifts/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_publish_scheduled_shift_with_wiremock
    test_id = "labor.publish_scheduled_shift.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.publish_scheduled_shift(
      id: "id",
      idempotency_key: "HIDSNG5KS478L",
      version: 2,
      scheduled_shift_notification_audience: "ALL",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.publish_scheduled_shift.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/labor/scheduled-shifts/id/publish",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_create_timecard_with_wiremock
    test_id = "labor.create_timecard.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.create_timecard(
      idempotency_key: "HIDSNG5KS478L",
      timecard: {
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
                           "X-Test-Id" => "labor.create_timecard.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/labor/timecards",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_search_timecards_with_wiremock
    test_id = "labor.search_timecards.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.search_timecards(
      query: {
        filter: {
          workday: {
            date_range: {
              start_date: "2019-01-20",
              end_date: "2019-02-03"
            },
            match_timecards_by: "START_AT",
            default_timezone: "America/Los_Angeles"
          }
        }
      },
      limit: 100,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.search_timecards.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/labor/timecards/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_retrieve_timecard_with_wiremock
    test_id = "labor.retrieve_timecard.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.retrieve_timecard(
      id: "id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.retrieve_timecard.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/labor/timecards/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_update_timecard_with_wiremock
    test_id = "labor.update_timecard.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.update_timecard(
      id: "id",
      timecard: {
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
        status: "CLOSED",
        version: 1,
        team_member_id: "ormj0jJJZ5OZIzxrZYJI",
        declared_cash_tip_money: {
          amount: 500,
          currency: "USD"
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.update_timecard.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/labor/timecards/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_delete_timecard_with_wiremock
    test_id = "labor.delete_timecard.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.delete_timecard(
      id: "id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.delete_timecard.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/labor/timecards/id",
      query_params: nil,
      expected: 1
    )
  end
end
