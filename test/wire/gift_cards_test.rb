# frozen_string_literal: true

require_relative "wiremock_test_case"

class GiftCardsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_gift_cards_list_with_wiremock
    test_id = "gift_cards.list.0"

    result = @client.gift_cards.list(
      type: "type",
      state: "state",
      limit: 1,
      cursor: "cursor",
      customer_id: "customer_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "gift_cards.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/gift-cards",
      query_params: nil,
      expected: 1
    )
  end

  def test_gift_cards_create_with_wiremock
    test_id = "gift_cards.create.0"

    @client.gift_cards.create(
      idempotency_key: "NC9Tm69EjbjtConu",
      location_id: "81FN9BNFZTKS4",
      gift_card: {
        type: "DIGITAL"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "gift_cards.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/gift-cards",
      query_params: nil,
      expected: 1
    )
  end

  def test_gift_cards_get_from_gan_with_wiremock
    test_id = "gift_cards.get_from_gan.0"

    @client.gift_cards.get_from_gan(
      gan: "7783320001001635",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "gift_cards.get_from_gan.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/gift-cards/from-gan",
      query_params: nil,
      expected: 1
    )
  end

  def test_gift_cards_get_from_nonce_with_wiremock
    test_id = "gift_cards.get_from_nonce.0"

    @client.gift_cards.get_from_nonce(
      nonce: "cnon:7783322135245171",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "gift_cards.get_from_nonce.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/gift-cards/from-nonce",
      query_params: nil,
      expected: 1
    )
  end

  def test_gift_cards_link_customer_with_wiremock
    test_id = "gift_cards.link_customer.0"

    @client.gift_cards.link_customer(
      gift_card_id: "gift_card_id",
      customer_id: "GKY0FZ3V717AH8Q2D821PNT2ZW",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "gift_cards.link_customer.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/gift-cards/gift_card_id/link-customer",
      query_params: nil,
      expected: 1
    )
  end

  def test_gift_cards_unlink_customer_with_wiremock
    test_id = "gift_cards.unlink_customer.0"

    @client.gift_cards.unlink_customer(
      gift_card_id: "gift_card_id",
      customer_id: "GKY0FZ3V717AH8Q2D821PNT2ZW",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "gift_cards.unlink_customer.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/gift-cards/gift_card_id/unlink-customer",
      query_params: nil,
      expected: 1
    )
  end

  def test_gift_cards_get_with_wiremock
    test_id = "gift_cards.get.0"

    @client.gift_cards.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "gift_cards.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/gift-cards/id",
      query_params: nil,
      expected: 1
    )
  end
end
