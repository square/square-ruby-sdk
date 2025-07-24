# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# A discount to block from applying to a line item. The discount must be
#  identified by either `discount_uid` or `discount_catalog_object_id`, but not
#  both.
  class OrderLineItemPricingBlocklistsBlockedDiscount
  # @return [String] A unique ID of the `BlockedDiscount` within the order.
    attr_reader :uid
  # @return [String] The `uid` of the discount that should be blocked. Use this field to block
#  ad hoc discounts. For catalog discounts, use the `discount_catalog_object_id`
#  field.
    attr_reader :discount_uid
  # @return [String] The `catalog_object_id` of the discount that should be blocked.
#  Use this field to block catalog discounts. For ad hoc discounts, use the
#  `discount_uid` field.
    attr_reader :discount_catalog_object_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] A unique ID of the `BlockedDiscount` within the order.
    # @param discount_uid [String] The `uid` of the discount that should be blocked. Use this field to block
#  ad hoc discounts. For catalog discounts, use the `discount_catalog_object_id`
#  field.
    # @param discount_catalog_object_id [String] The `catalog_object_id` of the discount that should be blocked.
#  Use this field to block catalog discounts. For ad hoc discounts, use the
#  `discount_uid` field.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::OrderLineItemPricingBlocklistsBlockedDiscount]
    def initialize(uid: OMIT, discount_uid: OMIT, discount_catalog_object_id: OMIT, additional_properties: nil)
      @uid = uid if uid != OMIT
      @discount_uid = discount_uid if discount_uid != OMIT
      @discount_catalog_object_id = discount_catalog_object_id if discount_catalog_object_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "discount_uid": discount_uid, "discount_catalog_object_id": discount_catalog_object_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  OrderLineItemPricingBlocklistsBlockedDiscount
    #
    # @param json_object [String] 
    # @return [SquareApiClient::OrderLineItemPricingBlocklistsBlockedDiscount]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      discount_uid = parsed_json["discount_uid"]
      discount_catalog_object_id = parsed_json["discount_catalog_object_id"]
      new(
        uid: uid,
        discount_uid: discount_uid,
        discount_catalog_object_id: discount_catalog_object_id,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderLineItemPricingBlocklistsBlockedDiscount to a JSON
#  object
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
      obj.uid&.is_a?(String) != false || raise("Passed value for field obj.uid is not the expected type, validation failed.")
      obj.discount_uid&.is_a?(String) != false || raise("Passed value for field obj.discount_uid is not the expected type, validation failed.")
      obj.discount_catalog_object_id&.is_a?(String) != false || raise("Passed value for field obj.discount_catalog_object_id is not the expected type, validation failed.")
    end
  end
end