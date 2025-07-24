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

module square.rb
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
    # @return [square.rb::CatalogObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        square.rb::CatalogObjectItem.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectItem.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectImage.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectImage.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectCategory.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectCategory.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectItemVariation.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectItemVariation.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectTax.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectTax.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectDiscount.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectDiscount.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectModifierList.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectModifierList.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectModifier.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectModifier.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectPricingRule.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectPricingRule.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectProductSet.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectProductSet.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectTimePeriod.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectTimePeriod.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectMeasurementUnit.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectMeasurementUnit.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectSubscriptionPlanVariation.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectSubscriptionPlanVariation.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectItemOption.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectItemOption.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectItemOptionValue.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectItemOptionValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectCustomAttributeDefinition.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectCustomAttributeDefinition.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectQuickAmountsSettings.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectQuickAmountsSettings.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectSubscriptionPlan.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectSubscriptionPlan.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        square.rb::CatalogObjectAvailabilityPeriod.validate_raw(obj: struct)
        unless struct.nil?
  return square.rb::CatalogObjectAvailabilityPeriod.from_json(json_object: struct)
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
        return square.rb::CatalogObjectItem.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectImage.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectCategory.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectItemVariation.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectTax.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectDiscount.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectModifierList.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectModifier.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectPricingRule.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectProductSet.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectTimePeriod.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectMeasurementUnit.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectSubscriptionPlanVariation.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectItemOption.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectItemOptionValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectCustomAttributeDefinition.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectQuickAmountsSettings.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectSubscriptionPlan.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return square.rb::CatalogObjectAvailabilityPeriod.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end