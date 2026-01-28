# frozen_string_literal: true

require_relative "wiremock_test_case"

class TerminalWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_terminal_dismiss_terminal_action_with_wiremock
    test_id = "terminal.dismiss_terminal_action.0"

    @client.terminal.dismiss_terminal_action(
      action_id: "action_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "terminal.dismiss_terminal_action.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/actions/action_id/dismiss",
      query_params: nil,
      expected: 1
    )
  end

  def test_terminal_dismiss_terminal_checkout_with_wiremock
    test_id = "terminal.dismiss_terminal_checkout.0"

    @client.terminal.dismiss_terminal_checkout(
      checkout_id: "checkout_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "terminal.dismiss_terminal_checkout.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/checkouts/checkout_id/dismiss",
      query_params: nil,
      expected: 1
    )
  end

  def test_terminal_dismiss_terminal_refund_with_wiremock
    test_id = "terminal.dismiss_terminal_refund.0"

    @client.terminal.dismiss_terminal_refund(
      terminal_refund_id: "terminal_refund_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "terminal.dismiss_terminal_refund.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/refunds/terminal_refund_id/dismiss",
      query_params: nil,
      expected: 1
    )
  end
end
