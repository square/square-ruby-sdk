# frozen_string_literal: true

require_relative "wiremock_test_case"

class LocationsTransactionsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_locations_transactions_list_with_wiremock
    test_id = "locations.transactions.list.0"

    @client.locations.transactions.list(
      location_id: "location_id",
      begin_time: "begin_time",
      end_time: "end_time",
      sort_order: "DESC",
      cursor: "cursor",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "locations.transactions.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/locations/location_id/transactions",
      query_params: nil,
      expected: 1
    )
  end

  def test_locations_transactions_get_with_wiremock
    test_id = "locations.transactions.get.0"

    @client.locations.transactions.get(
      location_id: "location_id",
      transaction_id: "transaction_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "locations.transactions.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/locations/location_id/transactions/transaction_id",
      query_params: nil,
      expected: 1
    )
  end
end
