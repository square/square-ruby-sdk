# frozen_string_literal: true
require_relative "catalog_object_reference"
require "ostruct"
require "json"

module square.rb
# Represents a reward tier in a loyalty program. A reward tier defines how buyers
#  can redeem points for a reward, such as the number of points required and the
#  value and scope of the discount. A loyalty program can offer multiple reward
#  tiers.
  class LoyaltyProgramRewardTier
  # @return [String] The Square-assigned ID of the reward tier.
    attr_reader :id
  # @return [Integer] The points exchanged for the reward tier.
    attr_reader :points
  # @return [String] The name of the reward tier.
    attr_reader :name
  # @return [String] The timestamp when the reward tier was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [square.rb::CatalogObjectReference] A reference to the specific version of a `PRICING_RULE` catalog object that
#  contains information about the reward tier discount.
#  Use `object_id` and `catalog_version` with the
#  [RetrieveCatalogObject](api-endpoint:Catalog-RetrieveCatalogObject) endpoint
#  to get discount details. Make sure to set `include_related_objects` to true in
#  the request to retrieve all catalog objects
#  that define the discount. For more information, see [Getting discount details
#  for a reward
#  //developer.squareup.com/docs/loyalty-api/loyalty-rewards#get-discount-details).
    attr_reader :pricing_rule_reference
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The Square-assigned ID of the reward tier.
    # @param points [Integer] The points exchanged for the reward tier.
    # @param name [String] The name of the reward tier.
    # @param created_at [String] The timestamp when the reward tier was created, in RFC 3339 format.
    # @param pricing_rule_reference [square.rb::CatalogObjectReference] A reference to the specific version of a `PRICING_RULE` catalog object that
#  contains information about the reward tier discount.
#  Use `object_id` and `catalog_version` with the
#  [RetrieveCatalogObject](api-endpoint:Catalog-RetrieveCatalogObject) endpoint
#  to get discount details. Make sure to set `include_related_objects` to true in
#  the request to retrieve all catalog objects
#  that define the discount. For more information, see [Getting discount details
#  for a reward
#  //developer.squareup.com/docs/loyalty-api/loyalty-rewards#get-discount-details).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyProgramRewardTier]
    def initialize(id: OMIT, points:, name: OMIT, created_at: OMIT, pricing_rule_reference:, additional_properties: nil)
      @id = id if id != OMIT
      @points = points
      @name = name if name != OMIT
      @created_at = created_at if created_at != OMIT
      @pricing_rule_reference = pricing_rule_reference
      @additional_properties = additional_properties
      @_field_set = { "id": id, "points": points, "name": name, "created_at": created_at, "pricing_rule_reference": pricing_rule_reference }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyProgramRewardTier
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyProgramRewardTier]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      points = parsed_json["points"]
      name = parsed_json["name"]
      created_at = parsed_json["created_at"]
      unless parsed_json["pricing_rule_reference"].nil?
        pricing_rule_reference = parsed_json["pricing_rule_reference"].to_json
        pricing_rule_reference = square.rb::CatalogObjectReference.from_json(json_object: pricing_rule_reference)
      else
        pricing_rule_reference = nil
      end
      new(
        id: id,
        points: points,
        name: name,
        created_at: created_at,
        pricing_rule_reference: pricing_rule_reference,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyProgramRewardTier to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.points.is_a?(Integer) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      square.rb::CatalogObjectReference.validate_raw(obj: obj.pricing_rule_reference)
    end
  end
end