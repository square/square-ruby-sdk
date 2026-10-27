# frozen_string_literal: true

require_relative "wiremock_test_case"

class CheckoutPaymentLinksWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_checkout_payment_links_list_with_wiremock
    test_id = "checkout.payment_links.list.0"

    result = @client.checkout.payment_links.list(
      cursor: "cursor",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "checkout.payment_links.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/online-checkout/payment-links",
      query_params: nil,
      expected: 1
    )
  end

  def test_checkout_payment_links_create_with_wiremock
    test_id = "checkout.payment_links.create.0"

    result = @client.checkout.payment_links.create(
      idempotency_key: "cd9e25dc-d9f2-4430-aedb-61605070e95f",
      quick_pay: {
        name: "Auto Detailing",
        price_money: {
          amount: 10000,
          currency: "USD"
        },
        location_id: "A9Y43N9ABXZBP"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "checkout.payment_links.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/online-checkout/payment-links",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/online-checkout/payment-links",
      expected: {
        "/quick_pay/price_money/amount" => 10000
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/payment_link/version" => 1,
        "/related_resources/orders/0/line_items/0/base_price_money/amount" => 12500,
        "/related_resources/orders/0/line_items/0/variation_total_price_money/amount" => 12500,
        "/related_resources/orders/0/line_items/0/gross_sales_money/amount" => 12500,
        "/related_resources/orders/0/line_items/0/total_tax_money/amount" => 0,
        "/related_resources/orders/0/line_items/0/total_discount_money/amount" => 0,
        "/related_resources/orders/0/line_items/0/total_money/amount" => 12500,
        "/related_resources/orders/0/net_amounts/total_money/amount" => 12500,
        "/related_resources/orders/0/net_amounts/tax_money/amount" => 0,
        "/related_resources/orders/0/net_amounts/discount_money/amount" => 0,
        "/related_resources/orders/0/net_amounts/tip_money/amount" => 0,
        "/related_resources/orders/0/net_amounts/service_charge_money/amount" => 0,
        "/related_resources/orders/0/version" => 1,
        "/related_resources/orders/0/total_money/amount" => 12500,
        "/related_resources/orders/0/total_tax_money/amount" => 0,
        "/related_resources/orders/0/total_discount_money/amount" => 0,
        "/related_resources/orders/0/total_tip_money/amount" => 0,
        "/related_resources/orders/0/total_service_charge_money/amount" => 0
      }
    )
  end

  def test_checkout_payment_links_get_with_wiremock
    test_id = "checkout.payment_links.get.0"

    result = @client.checkout.payment_links.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "checkout.payment_links.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/online-checkout/payment-links/id",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/payment_link/version" => 1
      }
    )
  end

  def test_checkout_payment_links_update_with_wiremock
    test_id = "checkout.payment_links.update.0"

    result = @client.checkout.payment_links.update(
      id: "id",
      payment_link: {
        version: 1,
        checkout_options: {
          ask_for_shipping_address: true
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "checkout.payment_links.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/online-checkout/payment-links/id",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/online-checkout/payment-links/id",
      expected: {
        "/payment_link/version" => 1
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/payment_link/version" => 2
      }
    )
  end

  def test_checkout_payment_links_delete_with_wiremock
    test_id = "checkout.payment_links.delete.0"

    @client.checkout.payment_links.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "checkout.payment_links.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/online-checkout/payment-links/id",
      query_params: nil,
      expected: 1
    )
  end
end
