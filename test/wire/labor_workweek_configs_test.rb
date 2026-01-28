# frozen_string_literal: true

require_relative "wiremock_test_case"

class LaborWorkweekConfigsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_labor_workweek_configs_list_with_wiremock
    test_id = "labor.workweek_configs.list.0"

    result = @client.labor.workweek_configs.list(
      limit: 1,
      cursor: "cursor",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labor.workweek_configs.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/labor/workweek-configs",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_workweek_configs_get_with_wiremock
    test_id = "labor.workweek_configs.get.0"

    @client.labor.workweek_configs.get(
      id: "id",
      workweek_config: {
        start_of_week: "MON",
        start_of_day_local_time: "10:00",
        version: 10
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "labor.workweek_configs.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/labor/workweek-configs/id",
      query_params: nil,
      expected: 1
    )
  end
end
