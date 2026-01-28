# frozen_string_literal: true

require_relative "wiremock_test_case"

class ApplePayWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_apple_pay_register_domain_with_wiremock
    test_id = "apple_pay.register_domain.0"

    @client.apple_pay.register_domain(
      domain_name: "example.com",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "apple_pay.register_domain.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/apple-pay/domains",
      query_params: nil,
      expected: 1
    )
  end
end
