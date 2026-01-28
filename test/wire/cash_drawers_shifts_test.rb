# frozen_string_literal: true

require_relative "wiremock_test_case"

class CashDrawersShiftsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_cash_drawers_shifts_list_with_wiremock
    test_id = "cash_drawers.shifts.list.0"

    result = @client.cash_drawers.shifts.list(
      location_id: "location_id",
      sort_order: "DESC",
      begin_time: "begin_time",
      end_time: "end_time",
      limit: 1,
      cursor: "cursor",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "cash_drawers.shifts.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/cash-drawers/shifts",
      query_params: { "location_id" => "location_id" },
      expected: 1
    )
  end

  def test_cash_drawers_shifts_get_with_wiremock
    test_id = "cash_drawers.shifts.get.0"

    @client.cash_drawers.shifts.get(
      shift_id: "shift_id",
      location_id: "location_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "cash_drawers.shifts.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/cash-drawers/shifts/shift_id",
      query_params: { "location_id" => "location_id" },
      expected: 1
    )
  end

  def test_cash_drawers_shifts_list_events_with_wiremock
    test_id = "cash_drawers.shifts.list_events.0"

    result = @client.cash_drawers.shifts.list_events(
      shift_id: "shift_id",
      location_id: "location_id",
      limit: 1,
      cursor: "cursor",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "cash_drawers.shifts.list_events.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/cash-drawers/shifts/shift_id/events",
      query_params: { "location_id" => "location_id" },
      expected: 1
    )
  end
end
