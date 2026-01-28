# frozen_string_literal: true

require_relative "wiremock_test_case"

class TerminalActionsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_terminal_actions_create_with_wiremock
    test_id = "terminal.actions.create.0"

    @client.terminal.actions.create(
      idempotency_key: "thahn-70e75c10-47f7-4ab6-88cc-aaa4076d065e",
      action: {
        device_id: "{{DEVICE_ID}}",
        deadline_duration: "PT5M",
        type: "SAVE_CARD",
        save_card_options: {
          customer_id: "{{CUSTOMER_ID}}",
          reference_id: "user-id-1"
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "terminal.actions.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/actions",
      query_params: nil,
      expected: 1
    )
  end

  def test_terminal_actions_search_with_wiremock
    test_id = "terminal.actions.search.0"

    @client.terminal.actions.search(
      query: {
        filter: {
          created_at: {
            start_at: "2022-04-01T00:00:00.000Z"
          }
        },
        sort: {
          sort_order: "DESC"
        }
      },
      limit: 2,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "terminal.actions.search.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/actions/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_terminal_actions_get_with_wiremock
    test_id = "terminal.actions.get.0"

    @client.terminal.actions.get(
      action_id: "action_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "terminal.actions.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/terminals/actions/action_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_terminal_actions_cancel_with_wiremock
    test_id = "terminal.actions.cancel.0"

    @client.terminal.actions.cancel(
      action_id: "action_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "terminal.actions.cancel.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/actions/action_id/cancel",
      query_params: nil,
      expected: 1
    )
  end
end
