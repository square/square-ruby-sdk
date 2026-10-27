# frozen_string_literal: true

require_relative "wiremock_test_case"

class CheckoutWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_checkout_retrieve_location_settings_with_wiremock
    test_id = "checkout.retrieve_location_settings.0"

    result = @client.checkout.retrieve_location_settings(
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

    verify_response_numbers(
      actual: result,
      expected: {
        "/location_settings/tipping/percentages/0" => 10,
        "/location_settings/tipping/percentages/1" => 15,
        "/location_settings/tipping/percentages/2" => 20,
        "/location_settings/tipping/default_percent" => 15
      }
    )
  end

  def test_checkout_update_location_settings_with_wiremock
    test_id = "checkout.update_location_settings.0"

    result = @client.checkout.update_location_settings(
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

    verify_response_numbers(
      actual: result,
      expected: {
        "/location_settings/tipping/percentages/0" => 15,
        "/location_settings/tipping/percentages/1" => 20,
        "/location_settings/tipping/percentages/2" => 25,
        "/location_settings/tipping/default_percent" => 20
      }
    )
  end

  def test_checkout_retrieve_merchant_settings_with_wiremock
    test_id = "checkout.retrieve_merchant_settings.0"

    result = @client.checkout.retrieve_merchant_settings(request_options: {
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

    verify_response_numbers(
      actual: result,
      expected: {
        "/merchant_settings/payment_methods/afterpay_clearpay/order_eligibility_range/min/amount" => 100,
        "/merchant_settings/payment_methods/afterpay_clearpay/order_eligibility_range/max/amount" => 10000,
        "/merchant_settings/payment_methods/afterpay_clearpay/item_eligibility_range/min/amount" => 100,
        "/merchant_settings/payment_methods/afterpay_clearpay/item_eligibility_range/max/amount" => 10000
      }
    )
  end

  def test_checkout_update_merchant_settings_with_wiremock
    test_id = "checkout.update_merchant_settings.0"

    result = @client.checkout.update_merchant_settings(
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

    verify_response_numbers(
      actual: result,
      expected: {
        "/merchant_settings/payment_methods/afterpay_clearpay/order_eligibility_range/min/amount" => 100,
        "/merchant_settings/payment_methods/afterpay_clearpay/order_eligibility_range/max/amount" => 10000,
        "/merchant_settings/payment_methods/afterpay_clearpay/item_eligibility_range/min/amount" => 100,
        "/merchant_settings/payment_methods/afterpay_clearpay/item_eligibility_range/max/amount" => 10000
      }
    )
  end
end
