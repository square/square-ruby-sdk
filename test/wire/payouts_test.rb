# frozen_string_literal: true

require_relative "wiremock_test_case"

class PayoutsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_payouts_list_with_wiremock
    test_id = "payouts.list.0"

    result = @client.payouts.list(
      location_id: "location_id",
      status: "SENT",
      begin_time: "begin_time",
      end_time: "end_time",
      sort_order: "DESC",
      cursor: "cursor",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payouts.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/payouts",
      query_params: nil,
      expected: 1
    )
  end

  def test_payouts_get_with_wiremock
    test_id = "payouts.get.0"

    result = @client.payouts.get(
      payout_id: "payout_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payouts.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/payouts/payout_id",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/payout/amount_money/amount" => -103,
        "/payout/version" => 1
      }
    )
  end

  def test_payouts_list_entries_with_wiremock
    test_id = "payouts.list_entries.0"

    result = @client.payouts.list_entries(
      payout_id: "payout_id",
      sort_order: "DESC",
      cursor: "cursor",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payouts.list_entries.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/payouts/payout_id/payout-entries",
      query_params: nil,
      expected: 1
    )
  end
end
