# frozen_string_literal: true

require_relative "wiremock_test_case"

class GiftCardsActivitiesWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_gift_cards_activities_list_with_wiremock
    test_id = "gift_cards.activities.list.0"

    result = @client.gift_cards.activities.list(
      gift_card_id: "gift_card_id",
      type: "type",
      location_id: "location_id",
      begin_time: "begin_time",
      end_time: "end_time",
      limit: 1,
      cursor: "cursor",
      sort_order: "sort_order",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "gift_cards.activities.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/gift-cards/activities",
      query_params: nil,
      expected: 1
    )
  end

  def test_gift_cards_activities_create_with_wiremock
    test_id = "gift_cards.activities.create.0"

    @client.gift_cards.activities.create(
      idempotency_key: "U16kfr-kA70er-q4Rsym-7U7NnY",
      gift_card_activity: {
        type: "ACTIVATE",
        location_id: "81FN9BNFZTKS4",
        gift_card_id: "gftc:6d55a72470d940c6ba09c0ab8ad08d20",
        activate_activity_details: {
          order_id: "jJNGHm4gLI6XkFbwtiSLqK72KkAZY",
          line_item_uid: "eIWl7X0nMuO9Ewbh0ChIx"
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "gift_cards.activities.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/gift-cards/activities",
      query_params: nil,
      expected: 1
    )
  end
end
