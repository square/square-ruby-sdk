# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# A tax to block from applying to a line item. The tax must be
#  identified by either `tax_uid` or `tax_catalog_object_id`, but not both.
  class OrderLineItemPricingBlocklistsBlockedTax
  # @return [String] A unique ID of the `BlockedTax` within the order.
    attr_reader :uid
  # @return [String] The `uid` of the tax that should be blocked. Use this field to block
#  ad hoc taxes. For catalog, taxes use the `tax_catalog_object_id` field.
    attr_reader :tax_uid
  # @return [String] The `catalog_object_id` of the tax that should be blocked.
#  Use this field to block catalog taxes. For ad hoc taxes, use the
#  `tax_uid` field.
    attr_reader :tax_catalog_object_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] A unique ID of the `BlockedTax` within the order.
    # @param tax_uid [String] The `uid` of the tax that should be blocked. Use this field to block
#  ad hoc taxes. For catalog, taxes use the `tax_catalog_object_id` field.
    # @param tax_catalog_object_id [String] The `catalog_object_id` of the tax that should be blocked.
#  Use this field to block catalog taxes. For ad hoc taxes, use the
#  `tax_uid` field.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::OrderLineItemPricingBlocklistsBlockedTax]
    def initialize(uid: OMIT, tax_uid: OMIT, tax_catalog_object_id: OMIT, additional_properties: nil)
      @uid = uid if uid != OMIT
      @tax_uid = tax_uid if tax_uid != OMIT
      @tax_catalog_object_id = tax_catalog_object_id if tax_catalog_object_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "tax_uid": tax_uid, "tax_catalog_object_id": tax_catalog_object_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  OrderLineItemPricingBlocklistsBlockedTax
    #
    # @param json_object [String] 
    # @return [square.rb::OrderLineItemPricingBlocklistsBlockedTax]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      tax_uid = parsed_json["tax_uid"]
      tax_catalog_object_id = parsed_json["tax_catalog_object_id"]
      new(
        uid: uid,
        tax_uid: tax_uid,
        tax_catalog_object_id: tax_catalog_object_id,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderLineItemPricingBlocklistsBlockedTax to a JSON
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
      obj.tax_uid&.is_a?(String) != false || raise("Passed value for field obj.tax_uid is not the expected type, validation failed.")
      obj.tax_catalog_object_id&.is_a?(String) != false || raise("Passed value for field obj.tax_catalog_object_id is not the expected type, validation failed.")
    end
  end
end