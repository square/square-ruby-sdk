# frozen_string_literal: true

require_relative "wiremock_test_case"

class TerminalCheckoutsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_terminal_checkouts_create_with_wiremock
    test_id = "terminal.checkouts.create.0"

    result = @client.terminal.checkouts.create(
      idempotency_key: "28a0c3bc-7839-11ea-bc55-0242ac130003",
      checkout: {
        amount_money: {
          amount: 2610,
          currency: "USD"
        },
        reference_id: "id11572",
        note: "A brief note",
        device_options: {
          device_id: "dbb5d83a-7838-11ea-bc55-0242ac130003"
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "terminal.checkouts.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/checkouts",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/checkouts",
      expected: {
        "/checkout/amount_money/amount" => 2610
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/checkout/amount_money/amount" => 2610,
        "/checkout/app_fee_money/amount" => 1000000,
        "/checkout/tip_money/amount" => 1000000
      }
    )
  end

  def test_terminal_checkouts_search_with_wiremock
    test_id = "terminal.checkouts.search.0"

    result = @client.terminal.checkouts.search(
      query: {
        filter: {
          status: "COMPLETED"
        }
      },
      limit: 2,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "terminal.checkouts.search.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/checkouts/search",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/checkouts/search",
      expected: {
        "/limit" => 2
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/checkouts/0/amount_money/amount" => 2610,
        "/checkouts/1/amount_money/amount" => 2610
      }
    )
  end

  def test_terminal_checkouts_get_with_wiremock
    test_id = "terminal.checkouts.get.0"

    result = @client.terminal.checkouts.get(
      checkout_id: "checkout_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "terminal.checkouts.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/terminals/checkouts/checkout_id",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/checkout/amount_money/amount" => 2610,
        "/checkout/app_fee_money/amount" => 1000000,
        "/checkout/tip_money/amount" => 1000000
      }
    )
  end

  def test_terminal_checkouts_cancel_with_wiremock
    test_id = "terminal.checkouts.cancel.0"

    result = @client.terminal.checkouts.cancel(
      checkout_id: "checkout_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "terminal.checkouts.cancel.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/checkouts/checkout_id/cancel",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/checkout/amount_money/amount" => 123,
        "/checkout/app_fee_money/amount" => 1000000,
        "/checkout/tip_money/amount" => 1000000
      }
    )
  end
end
