# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents the rule of conversion between a stockable
#  [CatalogItemVariation](entity:CatalogItemVariation)
#  and a non-stockable sell-by or receive-by `CatalogItemVariation` that
#  share the same underlying stock.
  class CatalogStockConversion
  # @return [String] References to the stockable [CatalogItemVariation](entity:CatalogItemVariation)
#  for this stock conversion. Selling, receiving or recounting the non-stockable
#  `CatalogItemVariation`
#  defined with a stock conversion results in adjustments of this stockable
#  `CatalogItemVariation`.
#  This immutable field must reference a stockable `CatalogItemVariation`
#  that shares the parent [CatalogItem](entity:CatalogItem) of the converted
#  `CatalogItemVariation.`
    attr_reader :stockable_item_variation_id
  # @return [String] The quantity of the stockable item variation (as identified by
#  `stockable_item_variation_id`)
#  equivalent to the non-stockable item variation quantity (as specified in
#  `nonstockable_quantity`)
#  as defined by this stock conversion.  It accepts a decimal number in a string
#  format that can take
#  up to 10 digits before the decimal point and up to 5 digits after the decimal
#  point.
    attr_reader :stockable_quantity
  # @return [String] The converted equivalent quantity of the non-stockable
#  [CatalogItemVariation](entity:CatalogItemVariation)
#  in its measurement unit. The `stockable_quantity` value and this
#  `nonstockable_quantity` value together
#  define the conversion ratio between stockable item variation and the
#  non-stockable item variation.
#  It accepts a decimal number in a string format that can take up to 10 digits
#  before the decimal point
#  and up to 5 digits after the decimal point.
    attr_reader :nonstockable_quantity
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param stockable_item_variation_id [String] References to the stockable [CatalogItemVariation](entity:CatalogItemVariation)
#  for this stock conversion. Selling, receiving or recounting the non-stockable
#  `CatalogItemVariation`
#  defined with a stock conversion results in adjustments of this stockable
#  `CatalogItemVariation`.
#  This immutable field must reference a stockable `CatalogItemVariation`
#  that shares the parent [CatalogItem](entity:CatalogItem) of the converted
#  `CatalogItemVariation.`
    # @param stockable_quantity [String] The quantity of the stockable item variation (as identified by
#  `stockable_item_variation_id`)
#  equivalent to the non-stockable item variation quantity (as specified in
#  `nonstockable_quantity`)
#  as defined by this stock conversion.  It accepts a decimal number in a string
#  format that can take
#  up to 10 digits before the decimal point and up to 5 digits after the decimal
#  point.
    # @param nonstockable_quantity [String] The converted equivalent quantity of the non-stockable
#  [CatalogItemVariation](entity:CatalogItemVariation)
#  in its measurement unit. The `stockable_quantity` value and this
#  `nonstockable_quantity` value together
#  define the conversion ratio between stockable item variation and the
#  non-stockable item variation.
#  It accepts a decimal number in a string format that can take up to 10 digits
#  before the decimal point
#  and up to 5 digits after the decimal point.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogStockConversion]
    def initialize(stockable_item_variation_id:, stockable_quantity:, nonstockable_quantity:, additional_properties: nil)
      @stockable_item_variation_id = stockable_item_variation_id
      @stockable_quantity = stockable_quantity
      @nonstockable_quantity = nonstockable_quantity
      @additional_properties = additional_properties
      @_field_set = { "stockable_item_variation_id": stockable_item_variation_id, "stockable_quantity": stockable_quantity, "nonstockable_quantity": nonstockable_quantity }
    end
# Deserialize a JSON object to an instance of CatalogStockConversion
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogStockConversion]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      stockable_item_variation_id = parsed_json["stockable_item_variation_id"]
      stockable_quantity = parsed_json["stockable_quantity"]
      nonstockable_quantity = parsed_json["nonstockable_quantity"]
      new(
        stockable_item_variation_id: stockable_item_variation_id,
        stockable_quantity: stockable_quantity,
        nonstockable_quantity: nonstockable_quantity,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogStockConversion to a JSON object
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
      obj.stockable_item_variation_id.is_a?(String) != false || raise("Passed value for field obj.stockable_item_variation_id is not the expected type, validation failed.")
      obj.stockable_quantity.is_a?(String) != false || raise("Passed value for field obj.stockable_quantity is not the expected type, validation failed.")
      obj.nonstockable_quantity.is_a?(String) != false || raise("Passed value for field obj.nonstockable_quantity is not the expected type, validation failed.")
    end
  end
end