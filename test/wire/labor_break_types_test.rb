# frozen_string_literal: true

require_relative "wiremock_test_case"

class LaborBreakTypesWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_labor_break_types_list_with_wiremock
    test_id = "labor.break_types.list.0"

    result = @client.labor.break_types.list(
      location_id: "location_id",
      limit: 1,
      cursor: "cursor",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labor.break_types.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/labor/break-types",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_break_types_create_with_wiremock
    test_id = "labor.break_types.create.0"

    @client.labor.break_types.create(
      idempotency_key: "PAD3NG5KSN2GL",
      break_type: {
        location_id: "CGJN03P1D08GF",
        break_name: "Lunch Break",
        expected_duration: "PT30M",
        is_paid: true
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labor.break_types.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/labor/break-types",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_break_types_get_with_wiremock
    test_id = "labor.break_types.get.0"

    @client.labor.break_types.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labor.break_types.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/labor/break-types/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_break_types_update_with_wiremock
    test_id = "labor.break_types.update.0"

    @client.labor.break_types.update(
      id: "id",
      break_type: {
        location_id: "26M7H24AZ9N6R",
        break_name: "Lunch",
        expected_duration: "PT50M",
        is_paid: true,
        version: 1
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labor.break_types.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/labor/break-types/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_break_types_delete_with_wiremock
    test_id = "labor.break_types.delete.0"

    @client.labor.break_types.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labor.break_types.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/labor/break-types/id",
      query_params: nil,
      expected: 1
    )
  end
end
