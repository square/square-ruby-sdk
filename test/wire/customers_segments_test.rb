# frozen_string_literal: true

require_relative "wiremock_test_case"

class CustomersSegmentsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_customers_segments_list_with_wiremock
    test_id = "customers.segments.list.0"

    result = @client.customers.segments.list(
      cursor: "cursor",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.segments.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/customers/segments",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_segments_get_with_wiremock
    test_id = "customers.segments.get.0"

    @client.customers.segments.get(
      segment_id: "segment_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.segments.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/customers/segments/segment_id",
      query_params: nil,
      expected: 1
    )
  end
end
