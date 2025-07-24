# frozen_string_literal: true
require_relative "catalog_quick_amount_type"
require_relative "money"
require "ostruct"
require "json"

module SquareApiClient
# Represents a Quick Amount in the Catalog.
  class CatalogQuickAmount
  # @return [SquareApiClient::CatalogQuickAmountType] Represents the type of the Quick Amount.
#  See [CatalogQuickAmountType](#type-catalogquickamounttype) for possible values
    attr_reader :type
  # @return [SquareApiClient::Money] Represents the actual amount of the Quick Amount with Money type.
    attr_reader :amount
  # @return [Long] Describes the ranking of the Quick Amount provided by machine learning model, in
#  the range [0, 100].
#  MANUAL type amount will always have score = 100.
    attr_reader :score
  # @return [Long] The order in which this Quick Amount should be displayed.
    attr_reader :ordinal
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [SquareApiClient::CatalogQuickAmountType] Represents the type of the Quick Amount.
#  See [CatalogQuickAmountType](#type-catalogquickamounttype) for possible values
    # @param amount [SquareApiClient::Money] Represents the actual amount of the Quick Amount with Money type.
    # @param score [Long] Describes the ranking of the Quick Amount provided by machine learning model, in
#  the range [0, 100].
#  MANUAL type amount will always have score = 100.
    # @param ordinal [Long] The order in which this Quick Amount should be displayed.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogQuickAmount]
    def initialize(type:, amount:, score: OMIT, ordinal: OMIT, additional_properties: nil)
      @type = type
      @amount = amount
      @score = score if score != OMIT
      @ordinal = ordinal if ordinal != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "amount": amount, "score": score, "ordinal": ordinal }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogQuickAmount
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogQuickAmount]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      unless parsed_json["amount"].nil?
        amount = parsed_json["amount"].to_json
        amount = SquareApiClient::Money.from_json(json_object: amount)
      else
        amount = nil
      end
      score = parsed_json["score"]
      ordinal = parsed_json["ordinal"]
      new(
        type: type,
        amount: amount,
        score: score,
        ordinal: ordinal,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogQuickAmount to a JSON object
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
      obj.type.is_a?(SquareApiClient::CatalogQuickAmountType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      SquareApiClient::Money.validate_raw(obj: obj.amount)
      obj.score&.is_a?(Long) != false || raise("Passed value for field obj.score is not the expected type, validation failed.")
      obj.ordinal&.is_a?(Long) != false || raise("Passed value for field obj.ordinal is not the expected type, validation failed.")
    end
  end
end