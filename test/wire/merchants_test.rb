# frozen_string_literal: true

require_relative "wiremock_test_case"

class MerchantsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_merchants_list_with_wiremock
    test_id = "merchants.list.0"

    result = @client.merchants.list(
      cursor: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "merchants.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/merchants",
      query_params: nil,
      expected: 1
    )
  end

  def test_merchants_get_with_wiremock
    test_id = "merchants.get.0"

    @client.merchants.get(
      merchant_id: "merchant_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "merchants.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/merchants/merchant_id",
      query_params: nil,
      expected: 1
    )
  end
end
