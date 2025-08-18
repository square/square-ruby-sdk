# frozen_string_literal: true

require_relative "../../test_helper"

describe Square::Catalog::Client do
  describe "#batch_upsert" do
    it "creates multiple catalog objects" do

      # The new client should work with SDK types, not plain hashes
      # Let's try creating the request object properly
      request = Square::Catalog::Types::BatchUpsertCatalogObjectsRequest.new(
        idempotency_key: SecureRandom.uuid,
        batches: [
          Square::Types::CatalogObjectBatch.new(
            objects: [
              Square::Types::CatalogObjectItem.new(
                item_data: Square::Types::CatalogItem.new(
                  name: "Coffee",
                  description: "Strong coffee",
                  abbreviation: "C",
                  variations: [
                    Square::Types::CatalogObjectItemVariation.new(
                      item_variation_data: Square::Types::CatalogItemVariation.new(
                        name: "Kona Coffee",
                        track_inventory: false,
                        pricing_type: Square::Types::CatalogPricingType::FIXED_PRICING,
                        price_money: Square::Types::Money.new(
                          amount: 1000,
                          currency: Square::Types::Country::US
                        )
                      )
                    )
                  ]
                )
              ),
              Square::Types::CatalogObjectItem.new(
                item_data: Square::Types::CatalogItem.new(
                  name: "Tea",
                  description: "Strong tea",
                  abbreviation: "T",
                  variations: [
                    Square::Types::CatalogObjectItemVariation.new(
                      item_variation_data: Square::Types::CatalogItemVariation.new(
                        name: "Gunpowder Green",
                        track_inventory: false,
                        pricing_type: Square::Types::CatalogPricingType::FIXED_PRICING,
                        price_money: Square::Types::Money.new(
                          amount: 2000,
                          currency: Square::Types::Country::US
                        )
                      )
                    )
                  ]
                )
              )
            ]
          )
        ]
      )

      # Try calling with the request object
      response = client.catalog.batch_upsert(request: request)

      refute_nil response
    end
  end
end
