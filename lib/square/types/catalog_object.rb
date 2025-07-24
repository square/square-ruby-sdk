# frozen_string_literal: true
require "json"
require_relative "catalog_object_item"
require_relative "catalog_object_image"
require_relative "catalog_object_category"
require_relative "catalog_object_item_variation"
require_relative "catalog_object_tax"
require_relative "catalog_object_discount"
require_relative "catalog_object_modifier_list"
require_relative "catalog_object_modifier"
require_relative "catalog_object_pricing_rule"
require_relative "catalog_object_product_set"
require_relative "catalog_object_time_period"
require_relative "catalog_object_measurement_unit"
require_relative "catalog_object_subscription_plan_variation"
require_relative "catalog_object_item_option"
require_relative "catalog_object_item_option_value"
require_relative "catalog_object_custom_attribute_definition"
require_relative "catalog_object_quick_amounts_settings"
require_relative "catalog_object_subscription_plan"
require_relative "catalog_object_availability_period"

module SquareApiClient
# The wrapper object for the catalog entries of a given object type.
#  Depending on the `type` attribute value, a `CatalogObject` instance assumes a
#  type-specific data to yield the corresponding type of catalog object.
#  For example, if `type=ITEM`, the `CatalogObject` instance must have the
#  ITEM-specific data set on the `item_data` attribute. The resulting
#  `CatalogObject` instance is also a `CatalogItem` instance.
#  In general, if `type=<OBJECT_TYPE>`, the `CatalogObject` instance must have the
#  `<OBJECT_TYPE>`-specific data set on the `<object_type>_data` attribute. The
#  resulting `CatalogObject` instance is also a `Catalog<ObjectType>` instance.
#  For a more detailed discussion of the Catalog data model, please see the
#  [Design a
#  Catalog](https://developer.squareup.com/docs/catalog-api/design-a-catalog)
#  guide.
  class CatalogObject


# Deserialize a JSON object to an instance of CatalogObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        SquareApiClient::CatalogObjectItem.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectItem.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectImage.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectImage.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectCategory.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectCategory.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectItemVariation.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectItemVariation.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectTax.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectTax.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectDiscount.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectDiscount.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectModifierList.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectModifierList.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectModifier.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectModifier.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectPricingRule.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectPricingRule.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectProductSet.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectProductSet.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectTimePeriod.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectTimePeriod.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectMeasurementUnit.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectMeasurementUnit.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectSubscriptionPlanVariation.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectSubscriptionPlanVariation.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectItemOption.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectItemOption.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectItemOptionValue.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectItemOptionValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectCustomAttributeDefinition.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectCustomAttributeDefinition.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectQuickAmountsSettings.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectQuickAmountsSettings.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectSubscriptionPlan.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectSubscriptionPlan.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        SquareApiClient::CatalogObjectAvailabilityPeriod.validate_raw(obj: struct)
        unless struct.nil?
  return SquareApiClient::CatalogObjectAvailabilityPeriod.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
 return struct
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return SquareApiClient::CatalogObjectItem.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectImage.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectCategory.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectItemVariation.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectTax.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectDiscount.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectModifierList.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectModifier.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectPricingRule.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectProductSet.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectTimePeriod.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectMeasurementUnit.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectSubscriptionPlanVariation.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectItemOption.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectItemOptionValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectCustomAttributeDefinition.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectQuickAmountsSettings.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectSubscriptionPlan.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return SquareApiClient::CatalogObjectAvailabilityPeriod.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end