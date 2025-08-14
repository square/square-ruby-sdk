# frozen_string_literal: true

module Square
    module Types
        # Price and inventory alerting overrides for a `CatalogItemVariation` at a specific `Location`.
        class ItemVariationLocationOverrides < Square::Internal::Types::Model
            field :location_id, String, optional: true, nullable: false
            field :price_money, Square::Money, optional: true, nullable: false
            field :pricing_type, Square::CatalogPricingType, optional: true, nullable: false
            field :track_inventory, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :inventory_alert_type, Square::InventoryAlertType, optional: true, nullable: false
            field :inventory_alert_threshold, Integer, optional: true, nullable: false
            field :sold_out, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :sold_out_valid_until, String, optional: true, nullable: false
        end
    end
end
