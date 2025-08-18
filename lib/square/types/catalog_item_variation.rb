# frozen_string_literal: true

module Square
  module Types
    # An item variation, representing a product for sale, in the Catalog object model. Each [item](entity:CatalogItem) must have at least one
    # item variation and can have at most 250 item variations.
    # 
    # An item variation can be sellable, stockable, or both if it has a unit of measure for its count for the sold number of the variation, the stocked
    # number of the variation, or both. For example, when a variation representing wine is stocked and sold by the bottle, the variation is both
    # stockable and sellable. But when a variation of the wine is sold by the glass, the sold units cannot be used as a measure of the stocked units. This by-the-glass
    # variation is sellable, but not stockable. To accurately keep track of the wine's inventory count at any time, the sellable count must be
    # converted to stockable count. Typically, the seller defines this unit conversion. For example, 1 bottle equals 5 glasses. The Square API exposes
    # the `stockable_conversion` property on the variation to specify the conversion. Thus, when two glasses of the wine are sold, the sellable count
    # decreases by 2, and the stockable count automatically decreases by 0.4 bottle according to the conversion.
    class CatalogItemVariation < Internal::Types::Model
      field :item_id, String, optional: true, nullable: false
      field :name, String, optional: true, nullable: false
      field :sku, String, optional: true, nullable: false
      field :upc, String, optional: true, nullable: false
      field :ordinal, Integer, optional: true, nullable: false
      field :pricing_type, Square::Types::CatalogPricingType, optional: true, nullable: false
      field :price_money, Square::Types::Money, optional: true, nullable: false
      field :location_overrides, Internal::Types::Array[Square::Types::ItemVariationLocationOverrides], optional: true, nullable: false
      field :track_inventory, Internal::Types::Boolean, optional: true, nullable: false
      field :inventory_alert_type, Square::Types::InventoryAlertType, optional: true, nullable: false
      field :inventory_alert_threshold, Integer, optional: true, nullable: false
      field :user_data, String, optional: true, nullable: false
      field :service_duration, Integer, optional: true, nullable: false
      field :available_for_booking, Internal::Types::Boolean, optional: true, nullable: false
      field :item_option_values, Internal::Types::Array[Square::Types::CatalogItemOptionValueForItemVariation], optional: true, nullable: false
      field :measurement_unit_id, String, optional: true, nullable: false
      field :sellable, Internal::Types::Boolean, optional: true, nullable: false
      field :stockable, Internal::Types::Boolean, optional: true, nullable: false
      field :image_ids, Internal::Types::Array[String], optional: true, nullable: false
      field :team_member_ids, Internal::Types::Array[String], optional: true, nullable: false
      field :stockable_conversion, Square::Types::CatalogStockConversion, optional: true, nullable: false

    end
  end
end
