# frozen_string_literal: true

require_relative "wiremock_test_case"

class DevicesWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_devices_list_with_wiremock
    test_id = "devices.list.0"

    result = @client.devices.list(
      cursor: "cursor",
      sort_order: "DESC",
      limit: 1,
      location_id: "location_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "devices.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/devices",
      query_params: nil,
      expected: 1
    )
  end

  def test_devices_get_with_wiremock
    test_id = "devices.get.0"

    @client.devices.get(
      device_id: "device_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "devices.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/devices/device_id",
      query_params: nil,
      expected: 1
    )
  end
end
