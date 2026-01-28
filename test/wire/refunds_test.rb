# frozen_string_literal: true

require_relative "wiremock_test_case"

class RefundsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_refunds_list_with_wiremock
    test_id = "refunds.list.0"

    result = @client.refunds.list(
      begin_time: "begin_time",
      end_time: "end_time",
      sort_order: "sort_order",
      cursor: "cursor",
      location_id: "location_id",
      status: "status",
      source_type: "source_type",
      limit: 1,
      updated_at_begin_time: "updated_at_begin_time",
      updated_at_end_time: "updated_at_end_time",
      sort_field: "CREATED_AT",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "refunds.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/refunds",
      query_params: nil,
      expected: 1
    )
  end

  def test_refunds_refund_payment_with_wiremock
    test_id = "refunds.refund_payment.0"

    @client.refunds.refund_payment(
      idempotency_key: "9b7f2dcf-49da-4411-b23e-a2d6af21333a",
      amount_money: {
        amount: 1000,
        currency: "USD"
      },
      app_fee_money: {
        amount: 10,
        currency: "USD"
      },
      payment_id: "R2B3Z8WMVt3EAmzYWLZvz7Y69EbZY",
      reason: "Example",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "refunds.refund_payment.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/refunds",
      query_params: nil,
      expected: 1
    )
  end

  def test_refunds_get_with_wiremock
    test_id = "refunds.get.0"

    @client.refunds.get(
      refund_id: "refund_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "refunds.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/refunds/refund_id",
      query_params: nil,
      expected: 1
    )
  end
end
