# frozen_string_literal: true

require_relative "wiremock_test_case"

class EmployeesWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_employees_list_with_wiremock
    test_id = "employees.list.0"

    result = @client.employees.list(
      location_id: "location_id",
      status: "ACTIVE",
      limit: 1,
      cursor: "cursor",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "employees.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/employees",
      query_params: nil,
      expected: 1
    )
  end

  def test_employees_get_with_wiremock
    test_id = "employees.get.0"

    @client.employees.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "employees.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/employees/id",
      query_params: nil,
      expected: 1
    )
  end
end
