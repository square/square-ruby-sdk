# frozen_string_literal: true

require_relative "wiremock_test_case"

class TerminalRefundsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_terminal_refunds_create_with_wiremock
    test_id = "terminal.refunds.create.0"

    @client.terminal.refunds.create(
      idempotency_key: "402a640b-b26f-401f-b406-46f839590c04",
      refund: {
        payment_id: "5O5OvgkcNUhl7JBuINflcjKqUzXZY",
        amount_money: {
          amount: 111,
          currency: "CAD"
        },
        reason: "Returning items",
        device_id: "f72dfb8e-4d65-4e56-aade-ec3fb8d33291"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "terminal.refunds.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/refunds",
      query_params: nil,
      expected: 1
    )
  end

  def test_terminal_refunds_search_with_wiremock
    test_id = "terminal.refunds.search.0"

    @client.terminal.refunds.search(
      query: {
        filter: {
          status: "COMPLETED"
        }
      },
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "terminal.refunds.search.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/refunds/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_terminal_refunds_get_with_wiremock
    test_id = "terminal.refunds.get.0"

    @client.terminal.refunds.get(
      terminal_refund_id: "terminal_refund_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "terminal.refunds.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/terminals/refunds/terminal_refund_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_terminal_refunds_cancel_with_wiremock
    test_id = "terminal.refunds.cancel.0"

    @client.terminal.refunds.cancel(
      terminal_refund_id: "terminal_refund_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "terminal.refunds.cancel.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/refunds/terminal_refund_id/cancel",
      query_params: nil,
      expected: 1
    )
  end
end
