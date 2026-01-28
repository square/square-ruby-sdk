# frozen_string_literal: true

require_relative "wiremock_test_case"

class CheckoutPaymentLinksWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
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

    @client.checkout.payment_links.create(
      idempotency_key: "cd9e25dc-d9f2-4430-aedb-61605070e95f",
      quick_pay: {
        name: "Auto Detailing",
        price_money: {
          amount: 10_000,
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
  end

  def test_checkout_payment_links_get_with_wiremock
    test_id = "checkout.payment_links.get.0"

    @client.checkout.payment_links.get(
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
  end

  def test_checkout_payment_links_update_with_wiremock
    test_id = "checkout.payment_links.update.0"

    @client.checkout.payment_links.update(
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
