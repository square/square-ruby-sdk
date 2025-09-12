# frozen_string_literal: true

require "test_helper"

describe Square::GiftCards::Client do
  # describe "#create" do
  #   it "should create and activate gift card" do
  #     location_id = "L07KDK4B0R9F1"
  #     create_request = Square::GiftCards::Types::CreateGiftCardRequest.new(
  #       idempotency_key: SecureRandom.uuid,
  #       location_id: location_id,
  #       gift_card: Square::Types::GiftCard.new(
  #         type: "DIGITAL",
  #         state: "ACTIVE",
  #       )
  #     )
  #     response = client.gift_cards.create(**create_request.to_h)
  #     puts "response #{response.inspect}"
  #     refute_nil response
  #     assert_equal response.class, Square::Types::CreateGiftCardResponse

  #     create_activity_request = Square::GiftCards::Activities::Types::CreateGiftCardActivityRequest.new(
  #       idempotency_key: SecureRandom.uuid,
  #       gift_card_activity: Square::Types::GiftCardActivity.new(
  #         gift_card_id: response.gift_card.id,
  #         type: "ACTIVATE",
  #         location_id: location_id,
  #         activate_activity_details: Square::Types::GiftCardActivityActivate.new(
  #           amount_money: Square::Types::Money.new(amount: 500, currency: "USD"),
  #           buyer_payment_instrument_ids: [SecureRandom.uuid]
  #         )
  #       )
  #     )
  #     response = client.gift_cards.activities.create(**create_activity_request.to_h)
  #     refute_nil response
  #     assert_equal response.class, Square::Types::CreateGiftCardActivityResponse
  #   end
  # end

  describe "#list" do

    it "should list no params" do
      puts "list no params"
      response = client.gift_cards.list(limit: 200)
      refute_nil response
      assert_equal response.class, Square::Types::ListGiftCardsResponse
      refute_nil response.gift_cards
      assert response.gift_cards.length > 0

      puts "response #{response.to_h}" if verbose?
      puts "num gift cards #{response.gift_cards.length}"
      puts "num active gift cards #{response.gift_cards.select { |gift_card| gift_card.state == "ACTIVE" }.length}"
      puts "num pending gift cards #{response.gift_cards.select { |gift_card| gift_card.state == "PENDING" }.length}"
      puts "--------------------------------"
      # puts "gift cards #{response.gift_cards.map(&:to_h)}"
    end

    it " should list filter with string args" do
      puts "list filter with string args"
      response = client.gift_cards.list("state" => "ACTIVE", "limit" => 200)
      refute_nil response
      assert_equal response.class, Square::Types::ListGiftCardsResponse
      refute_nil response.gift_cards
      assert response.gift_cards.length > 0

      puts "response #{response.to_h}" if verbose?
      puts "num gift cards #{response.gift_cards.length}"
      puts "num active gift cards #{response.gift_cards.select { |gift_card| gift_card.state == "ACTIVE" }.length}"
      puts "num pending gift cards #{response.gift_cards.select { |gift_card| gift_card.state == "PENDING" }.length}"
      puts "--------------------------------"
      # puts "gift cards #{response.gift_cards.map(&:to_h)}"
    end


    it "should list filter with json args" do
      puts "list filter with json args"
      response = client.gift_cards.list({"state": "ACTIVE", "limit": 200})
      refute_nil response
      assert_equal response.class, Square::Types::ListGiftCardsResponse
      refute_nil response.gift_cards
      assert response.gift_cards.length > 0

      puts "response #{response.to_h}" if verbose?
      puts "num gift cards #{response.gift_cards.length}"
      puts "num active gift cards #{response.gift_cards.select { |gift_card| gift_card.state == "ACTIVE" }.length}"
      puts "num pending gift cards #{response.gift_cards.select { |gift_card| gift_card.state == "PENDING" }.length}"
      puts "--------------------------------"
      # puts "gift cards #{response.gift_cards.map(&:to_h)}"
    end


    it "should list filter with json args as symbol" do
      puts "list filter with json args as symbol"
      response = client.gift_cards.list(**{state: "ACTIVE", limit: 200})
      refute_nil response
      assert_equal response.class, Square::Types::ListGiftCardsResponse
      refute_nil response.gift_cards
      assert response.gift_cards.length > 0

      puts "response #{response.to_h}" if verbose?
      puts "num gift cards #{response.gift_cards.length}"
      puts "num active gift cards #{response.gift_cards.select { |gift_card| gift_card.state == "ACTIVE" }.length}"
      puts "num pending gift cards #{response.gift_cards.select { |gift_card| gift_card.state == "PENDING" }.length}"
      puts "--------------------------------"
      # puts "gift cards #{response.gift_cards.map(&:to_h)}"
    end

    it " filter with symbol named params" do
      puts "filter with symbol named params"
      response = client.gift_cards.list(state: "ACTIVE", limit: 200)
      refute_nil response
      assert_equal response.class, Square::Types::ListGiftCardsResponse
      refute_nil response.gift_cards
      assert response.gift_cards.length > 0

      puts "response #{response.to_h}" if verbose?
      puts "num gift cards #{response.gift_cards.length}"
      puts "num active gift cards #{response.gift_cards.select { |gift_card| gift_card.state == "ACTIVE" }.length}"
      puts "num pending gift cards #{response.gift_cards.select { |gift_card| gift_card.state == "PENDING" }.length}"
      puts "--------------------------------"
      # puts "gift cards #{response.gift_cards.map(&:to_h)}"
    end
  end
end