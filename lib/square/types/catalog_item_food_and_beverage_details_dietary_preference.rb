# frozen_string_literal: true
require_relative "catalog_item_food_and_beverage_details_dietary_preference_type"
require_relative "catalog_item_food_and_beverage_details_dietary_preference_standard_dietary_preference"
require "ostruct"
require "json"

module square.rb
# Dietary preferences that can be assigned to an `FOOD_AND_BEV` item and its
#  ingredients.
  class CatalogItemFoodAndBeverageDetailsDietaryPreference
  # @return [square.rb::CatalogItemFoodAndBeverageDetailsDietaryPreferenceType] The dietary preference type. Supported values include `STANDARD` and `CUSTOM` as
#  specified in `FoodAndBeverageDetails.DietaryPreferenceType`.
#  See [DietaryPreferenceType](#type-dietarypreferencetype) for possible values
    attr_reader :type
  # @return [square.rb::CatalogItemFoodAndBeverageDetailsDietaryPreferenceStandardDietaryPreference] The name of the dietary preference from a standard pre-defined list. This should
#  be null if it's a custom dietary preference.
#  See [StandardDietaryPreference](#type-standarddietarypreference) for possible
#  values
    attr_reader :standard_name
  # @return [String] The name of a user-defined custom dietary preference. This should be null if
#  it's a standard dietary preference.
    attr_reader :custom_name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [square.rb::CatalogItemFoodAndBeverageDetailsDietaryPreferenceType] The dietary preference type. Supported values include `STANDARD` and `CUSTOM` as
#  specified in `FoodAndBeverageDetails.DietaryPreferenceType`.
#  See [DietaryPreferenceType](#type-dietarypreferencetype) for possible values
    # @param standard_name [square.rb::CatalogItemFoodAndBeverageDetailsDietaryPreferenceStandardDietaryPreference] The name of the dietary preference from a standard pre-defined list. This should
#  be null if it's a custom dietary preference.
#  See [StandardDietaryPreference](#type-standarddietarypreference) for possible
#  values
    # @param custom_name [String] The name of a user-defined custom dietary preference. This should be null if
#  it's a standard dietary preference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogItemFoodAndBeverageDetailsDietaryPreference]
    def initialize(type: OMIT, standard_name: OMIT, custom_name: OMIT, additional_properties: nil)
      @type = type if type != OMIT
      @standard_name = standard_name if standard_name != OMIT
      @custom_name = custom_name if custom_name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "standard_name": standard_name, "custom_name": custom_name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CatalogItemFoodAndBeverageDetailsDietaryPreference
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogItemFoodAndBeverageDetailsDietaryPreference]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      standard_name = parsed_json["standard_name"]
      custom_name = parsed_json["custom_name"]
      new(
        type: type,
        standard_name: standard_name,
        custom_name: custom_name,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogItemFoodAndBeverageDetailsDietaryPreference to a
#  JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.type&.is_a?(square.rb::CatalogItemFoodAndBeverageDetailsDietaryPreferenceType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.standard_name&.is_a?(square.rb::CatalogItemFoodAndBeverageDetailsDietaryPreferenceStandardDietaryPreference) != false || raise("Passed value for field obj.standard_name is not the expected type, validation failed.")
      obj.custom_name&.is_a?(String) != false || raise("Passed value for field obj.custom_name is not the expected type, validation failed.")
    end
  end
end