# frozen_string_literal: true

require_relative "wiremock_test_case"

class V1TransactionsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_v_1_transactions_v_1_list_orders_with_wiremock
    test_id = "v_1_transactions.v_1_list_orders.0"

    @client.v_1_transactions.v_1_list_orders(
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
  end

  def test_v_1_transactions_v_1_retrieve_order_with_wiremock
    test_id = "v_1_transactions.v_1_retrieve_order.0"

    @client.v_1_transactions.v_1_retrieve_order(
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
  end

  def test_v_1_transactions_v_1_update_order_with_wiremock
    test_id = "v_1_transactions.v_1_update_order.0"

    @client.v_1_transactions.v_1_update_order(
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
  end
end
