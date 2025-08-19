# frozen_string_literal: true

module Square
  module Types
    # The wrapper object for the catalog entries of a given object type.
    # 
    # Depending on the `type` attribute value, a `CatalogObject` instance assumes a type-specific data to yield the corresponding type of catalog object.
    # 
    # For example, if `type=ITEM`, the `CatalogObject` instance must have the ITEM-specific data set on the `item_data` attribute. The resulting `CatalogObject` instance is also a `CatalogItem` instance.
    # 
    # In general, if `type=<OBJECT_TYPE>`, the `CatalogObject` instance must have the `<OBJECT_TYPE>`-specific data set on the `<object_type>_data` attribute. The resulting `CatalogObject` instance is also a `Catalog<ObjectType>` instance.
    # 
    # For a more detailed discussion of the Catalog data model, please see the
    # [Design a Catalog](https://developer.squareup.com/docs/catalog-api/design-a-catalog) guide.
    class CatalogObject < Internal::Types::Model
      extend Square::Internal::Types::Union

      discriminant :type

      member -> { Square::Types::CatalogObjectItem }, key: "ITEM"
      member -> { Square::Types::CatalogObjectImage }, key: "IMAGE"
      member -> { Square::Types::CatalogObjectCategory }, key: "CATEGORY"
      member -> { Square::Types::CatalogObjectItemVariation }, key: "ITEM_VARIATION"
      member -> { Square::Types::CatalogObjectTax }, key: "TAX"
      member -> { Square::Types::CatalogObjectDiscount }, key: "DISCOUNT"
      member -> { Square::Types::CatalogObjectModifierList }, key: "MODIFIER_LIST"
      member -> { Square::Types::CatalogObjectModifier }, key: "MODIFIER"
      member -> { Square::Types::CatalogObjectPricingRule }, key: "PRICING_RULE"
      member -> { Square::Types::CatalogObjectProductSet }, key: "PRODUCT_SET"
      member -> { Square::Types::CatalogObjectTimePeriod }, key: "TIME_PERIOD"
      member -> { Square::Types::CatalogObjectMeasurementUnit }, key: "MEASUREMENT_UNIT"
      member -> { Square::Types::CatalogObjectSubscriptionPlanVariation }, key: "SUBSCRIPTION_PLAN_VARIATION"
      member -> { Square::Types::CatalogObjectItemOption }, key: "ITEM_OPTION"
      member -> { Square::Types::CatalogObjectItemOptionValue }, key: "ITEM_OPTION_VAL"
      member -> { Square::Types::CatalogObjectCustomAttributeDefinition }, key: "CUSTOM_ATTRIBUTE_DEFINITION"
      member -> { Square::Types::CatalogObjectQuickAmountsSettings }, key: "QUICK_AMOUNTS_SETTINGS"
      member -> { Square::Types::CatalogObjectSubscriptionPlan }, key: "SUBSCRIPTION_PLAN"
      member -> { Square::Types::CatalogObjectAvailabilityPeriod }, key: "AVAILABILITY_PERIOD"
    end
  end
end
