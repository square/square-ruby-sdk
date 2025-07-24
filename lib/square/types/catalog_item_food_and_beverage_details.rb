# frozen_string_literal: true
require_relative "catalog_item_food_and_beverage_details_dietary_preference"
require_relative "catalog_item_food_and_beverage_details_ingredient"
require "ostruct"
require "json"

module square.rb
# The food and beverage-specific details of a `FOOD_AND_BEV` item.
  class CatalogItemFoodAndBeverageDetails
  # @return [Integer] The calorie count (in the unit of kcal) for the `FOOD_AND_BEV` type of items.
    attr_reader :calorie_count
  # @return [Array<square.rb::CatalogItemFoodAndBeverageDetailsDietaryPreference>] The dietary preferences for the `FOOD_AND_BEV` item.
    attr_reader :dietary_preferences
  # @return [Array<square.rb::CatalogItemFoodAndBeverageDetailsIngredient>] The ingredients for the `FOOD_AND_BEV` type item.
    attr_reader :ingredients
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param calorie_count [Integer] The calorie count (in the unit of kcal) for the `FOOD_AND_BEV` type of items.
    # @param dietary_preferences [Array<square.rb::CatalogItemFoodAndBeverageDetailsDietaryPreference>] The dietary preferences for the `FOOD_AND_BEV` item.
    # @param ingredients [Array<square.rb::CatalogItemFoodAndBeverageDetailsIngredient>] The ingredients for the `FOOD_AND_BEV` type item.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogItemFoodAndBeverageDetails]
    def initialize(calorie_count: OMIT, dietary_preferences: OMIT, ingredients: OMIT, additional_properties: nil)
      @calorie_count = calorie_count if calorie_count != OMIT
      @dietary_preferences = dietary_preferences if dietary_preferences != OMIT
      @ingredients = ingredients if ingredients != OMIT
      @additional_properties = additional_properties
      @_field_set = { "calorie_count": calorie_count, "dietary_preferences": dietary_preferences, "ingredients": ingredients }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogItemFoodAndBeverageDetails
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogItemFoodAndBeverageDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      calorie_count = parsed_json["calorie_count"]
      dietary_preferences = parsed_json["dietary_preferences"]&.map do | item |
  item = item.to_json
  square.rb::CatalogItemFoodAndBeverageDetailsDietaryPreference.from_json(json_object: item)
end
      ingredients = parsed_json["ingredients"]&.map do | item |
  item = item.to_json
  square.rb::CatalogItemFoodAndBeverageDetailsIngredient.from_json(json_object: item)
end
      new(
        calorie_count: calorie_count,
        dietary_preferences: dietary_preferences,
        ingredients: ingredients,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogItemFoodAndBeverageDetails to a JSON object
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
      obj.calorie_count&.is_a?(Integer) != false || raise("Passed value for field obj.calorie_count is not the expected type, validation failed.")
      obj.dietary_preferences&.is_a?(Array) != false || raise("Passed value for field obj.dietary_preferences is not the expected type, validation failed.")
      obj.ingredients&.is_a?(Array) != false || raise("Passed value for field obj.ingredients is not the expected type, validation failed.")
    end
  end
end