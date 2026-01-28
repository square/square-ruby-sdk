# frozen_string_literal: true

require_relative "wiremock_test_case"

class CustomersCardsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_customers_cards_create_with_wiremock
    test_id = "customers.cards.create.0"

    @client.customers.cards.create(
      customer_id: "customer_id",
      card_nonce: "YOUR_CARD_NONCE",
      billing_address: {
        address_line_1: "500 Electric Ave",
        address_line_2: "Suite 600",
        locality: "New York",
        administrative_district_level_1: "NY",
        postal_code: "10003",
        country: "US"
      },
      cardholder_name: "Amelia Earhart",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.cards.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/customers/customer_id/cards",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_cards_delete_with_wiremock
    test_id = "customers.cards.delete.0"

    @client.customers.cards.delete(
      customer_id: "customer_id",
      card_id: "card_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.cards.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/customers/customer_id/cards/card_id",
      query_params: nil,
      expected: 1
    )
  end
end
