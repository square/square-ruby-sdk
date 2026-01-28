# frozen_string_literal: true

require_relative "wiremock_test_case"

class LaborEmployeeWagesWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_labor_employee_wages_list_with_wiremock
    test_id = "labor.employee_wages.list.0"

    result = @client.labor.employee_wages.list(
      employee_id: "employee_id",
      limit: 1,
      cursor: "cursor",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labor.employee_wages.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/labor/employee-wages",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_employee_wages_get_with_wiremock
    test_id = "labor.employee_wages.get.0"

    @client.labor.employee_wages.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labor.employee_wages.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/labor/employee-wages/id",
      query_params: nil,
      expected: 1
    )
  end
end
