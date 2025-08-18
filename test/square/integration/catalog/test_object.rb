# frozen_string_literal: true

require "test_helper"

describe Square::Catalog::Object::Client do
  describe "#upsert" do
    it "upserts an object" do
      skip "Skipping for now."

      response = client.catalog.object.upsert(request: {
                                                idempotency_key: SecureRandom.uuid,
                                                object: {
                                                  type: "ITEM",
                                                  id: "##{SecureRandom.uuid}",
                                                  present_at_all_locations: true,
                                                  item_data: {
                                                    name: "Coffee",
                                                    description: "Strong coffee",
                                                    abbreviation: "C",
                                                    variations: [
                                                      {
                                                        type: "ITEM_VARIATION",
                                                        id: "##{SecureRandom.uuid}",
                                                        present_at_all_locations: true,
                                                        item_variation_data: {
                                                          name: "Kona Coffee",
                                                          track_inventory: false,
                                                          pricing_type: "FIXED_PRICING",
                                                          price_money: {
                                                            amount: 1000,
                                                            currency: "USD"
                                                          }
                                                        }
                                                      }
                                                    ]
                                                  }
                                                }
                                              })
      refute_nil response
    end
  end
end
