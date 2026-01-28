# frozen_string_literal: true

require_relative "wiremock_test_case"

class DevicesCodesWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_devices_codes_list_with_wiremock
    test_id = "devices.codes.list.0"

    result = @client.devices.codes.list(
      cursor: "cursor",
      location_id: "location_id",
      product_type: "TERMINAL_API",
      status: "UNKNOWN",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "devices.codes.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/devices/codes",
      query_params: nil,
      expected: 1
    )
  end

  def test_devices_codes_create_with_wiremock
    test_id = "devices.codes.create.0"

    @client.devices.codes.create(
      idempotency_key: "01bb00a6-0c86-4770-94ed-f5fca973cd56",
      device_code: {
        name: "Counter 1",
        product_type: "TERMINAL_API",
        location_id: "B5E4484SHHNYH"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "devices.codes.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/devices/codes",
      query_params: nil,
      expected: 1
    )
  end

  def test_devices_codes_get_with_wiremock
    test_id = "devices.codes.get.0"

    @client.devices.codes.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "devices.codes.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/devices/codes/id",
      query_params: nil,
      expected: 1
    )
  end
end
