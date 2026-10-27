# frozen_string_literal: true

require_relative "wiremock_test_case"

class V1TransactionsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_v_1_transactions_v_1_list_orders_with_wiremock
    test_id = "v_1_transactions.v_1_list_orders.0"

    result = @client.v_1_transactions.v_1_list_orders(
      location_id: "location_id",
      order: "DESC",
      limit: 1,
      batch_token: "batch_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "v_1_transactions.v_1_list_orders.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/location_id/orders",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/0/subtotal_money/amount" => 1,
        "/0/total_shipping_money/amount" => 1,
        "/0/total_tax_money/amount" => 1,
        "/0/total_price_money/amount" => 1,
        "/0/total_discount_money/amount" => 1,
        "/0/btc_price_satoshi" => 1.1
      }
    )
  end

  def test_v_1_transactions_v_1_retrieve_order_with_wiremock
    test_id = "v_1_transactions.v_1_retrieve_order.0"

    result = @client.v_1_transactions.v_1_retrieve_order(
      location_id: "location_id",
      order_id: "order_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "v_1_transactions.v_1_retrieve_order.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v1/location_id/orders/order_id",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/subtotal_money/amount" => 1,
        "/total_shipping_money/amount" => 1,
        "/total_tax_money/amount" => 1,
        "/total_price_money/amount" => 1,
        "/total_discount_money/amount" => 1,
        "/tender/total_money/amount" => 1,
        "/tender/tendered_money/amount" => 1,
        "/tender/change_back_money/amount" => 1,
        "/tender/refunded_money/amount" => 1,
        "/btc_price_satoshi" => 1.1
      }
    )
  end

  def test_v_1_transactions_v_1_update_order_with_wiremock
    test_id = "v_1_transactions.v_1_update_order.0"

    result = @client.v_1_transactions.v_1_update_order(
      location_id: "location_id",
      order_id: "order_id",
      action: "COMPLETE",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "v_1_transactions.v_1_update_order.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v1/location_id/orders/order_id",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/subtotal_money/amount" => 1,
        "/total_shipping_money/amount" => 1,
        "/total_tax_money/amount" => 1,
        "/total_price_money/amount" => 1,
        "/total_discount_money/amount" => 1,
        "/tender/total_money/amount" => 1,
        "/tender/tendered_money/amount" => 1,
        "/tender/change_back_money/amount" => 1,
        "/tender/refunded_money/amount" => 1,
        "/btc_price_satoshi" => 1.1
      }
    )
  end
end
