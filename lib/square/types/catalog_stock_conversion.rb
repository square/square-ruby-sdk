# frozen_string_literal: true

module Square
    module Types
        # Represents the rule of conversion between a stockable [CatalogItemVariation](entity:CatalogItemVariation)
        # and a non-stockable sell-by or receive-by `CatalogItemVariation` that
        # share the same underlying stock.
        class CatalogStockConversion < Internal::Types::Model
            field :stockable_item_variation_id, String, optional: false, nullable: false
            field :stockable_quantity, String, optional: false, nullable: false
            field :nonstockable_quantity, String, optional: false, nullable: false
        end
    end
end
