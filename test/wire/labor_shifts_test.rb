# frozen_string_literal: true

require_relative "wiremock_test_case"

class LaborShiftsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_labor_shifts_create_with_wiremock
    test_id = "labor.shifts.create.0"

    @client.labor.shifts.create(
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
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labor.shifts.create.0"
        }
      }
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

    @client.labor.shifts.search(
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
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labor.shifts.search.0"
        }
      }
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

    @client.labor.shifts.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labor.shifts.get.0"
        }
      }
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

    @client.labor.shifts.update(
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
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labor.shifts.update.0"
        }
      }
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

    @client.labor.shifts.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labor.shifts.delete.0"
        }
      }
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
