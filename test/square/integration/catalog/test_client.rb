# frozen_string_literal: true

require_relative "../../test_helper"

describe Square::Catalog::Client do
  describe "#batch_upsert" do
    it "creates multiple catalog objects" do

      _request = Square::Catalog::Types::BatchUpsertCatalogObjectsRequest.new(
        idempotency_key: SecureRandom.uuid,
        batches: [
          {
            objects: [
              {
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
              },
              {
                type: "ITEM",
                id: "##{SecureRandom.uuid}",
                present_at_all_locations: true,
                item_data: {
                  name: "Tea",
                  description: "Strong tea",
                  abbreviation: "T",
                  variations: [
                    {
                      type: "ITEM_VARIATION",
                      id: "##{SecureRandom.uuid}",
                      present_at_all_locations: true,
                      item_variation_data: {
                        name: "Gunpowder Green",
                        track_inventory: false,
                        pricing_type: "FIXED_PRICING",
                        price_money: {
                          amount: 2000,
                          currency: "USD"
                        }
                      }
                    }
                  ]
                }
              }
            ]
          }
        ]
      )

      puts "request #{_request.to_h}" if verbose?

      response = client.catalog.batch_upsert(request: _request.to_h)
      refute_nil response

      puts "response #{response.to_h}" if verbose?

    end
  end
end
