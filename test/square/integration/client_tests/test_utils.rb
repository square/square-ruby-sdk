# frozen_string_literal: true

require_relative "../../test_helper"

describe "Client Utils" do
  describe "UUID generation" do
    it "should generate a new uuid" do
      uuid = SecureRandom.uuid
      assert_match /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/, uuid
    end
  end

  describe "Square temporary ID" do
    it "should generate a new square temporary id" do
      temp_id = "##{SecureRandom.uuid}"
      assert_match /^#[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/, temp_id
    end
  end

  describe "Money object creation" do
    it "should create a new money object" do
      amount = 1000
      money = Square::Types::Money.new(amount: amount, currency: "USD")
      expected_money = Square::Types::Money.new(amount: amount, currency: "USD")
      assert_equal expected_money.amount, money.amount
      assert_equal expected_money.currency, money.currency
    end
  end

  describe "Location helper" do
    it "should get the default location id" do
      locations_response = client.locations.list
      location_id = locations_response.locations.first.id
      refute_nil location_id
    end
  end
end