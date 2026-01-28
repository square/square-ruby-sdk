# frozen_string_literal: true

require_relative "wiremock_test_case"

class CardsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_cards_list_with_wiremock
    test_id = "cards.list.0"

    result = @client.cards.list(
      cursor: "cursor",
      customer_id: "customer_id",
      include_disabled: true,
      reference_id: "reference_id",
      sort_order: "DESC",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "cards.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/cards",
      query_params: nil,
      expected: 1
    )
  end

  def test_cards_create_with_wiremock
    test_id = "cards.create.0"

    @client.cards.create(
      idempotency_key: "4935a656-a929-4792-b97c-8848be85c27c",
      source_id: "cnon:uIbfJXhXETSP197M3GB",
      card: {
        cardholder_name: "Amelia Earhart",
        billing_address: {
          address_line_1: "500 Electric Ave",
          address_line_2: "Suite 600",
          locality: "New York",
          administrative_district_level_1: "NY",
          postal_code: "10003",
          country: "US"
        },
        customer_id: "VDKXEEKPJN48QDG3BGGFAK05P8",
        reference_id: "user-id-1"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "cards.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/cards",
      query_params: nil,
      expected: 1
    )
  end

  def test_cards_get_with_wiremock
    test_id = "cards.get.0"

    @client.cards.get(
      card_id: "card_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "cards.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/cards/card_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_cards_disable_with_wiremock
    test_id = "cards.disable.0"

    @client.cards.disable(
      card_id: "card_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "cards.disable.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/cards/card_id/disable",
      query_params: nil,
      expected: 1
    )
  end
end
