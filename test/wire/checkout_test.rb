# frozen_string_literal: true

require_relative "wiremock_test_case"

class CheckoutWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_checkout_retrieve_location_settings_with_wiremock
    test_id = "checkout.retrieve_location_settings.0"

    @client.checkout.retrieve_location_settings(
      location_id: "location_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "checkout.retrieve_location_settings.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/online-checkout/location-settings/location_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_checkout_update_location_settings_with_wiremock
    test_id = "checkout.update_location_settings.0"

    @client.checkout.update_location_settings(
      location_id: "location_id",
      location_settings: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "checkout.update_location_settings.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/online-checkout/location-settings/location_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_checkout_retrieve_merchant_settings_with_wiremock
    test_id = "checkout.retrieve_merchant_settings.0"

    @client.checkout.retrieve_merchant_settings(request_options: {
                                                  additional_headers: {
                                                    "X-Test-Id" => "checkout.retrieve_merchant_settings.0"
                                                  }
                                                })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/online-checkout/merchant-settings",
      query_params: nil,
      expected: 1
    )
  end

  def test_checkout_update_merchant_settings_with_wiremock
    test_id = "checkout.update_merchant_settings.0"

    @client.checkout.update_merchant_settings(
      merchant_settings: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "checkout.update_merchant_settings.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/online-checkout/merchant-settings",
      query_params: nil,
      expected: 1
    )
  end
end
