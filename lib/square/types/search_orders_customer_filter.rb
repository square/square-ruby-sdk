# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# A filter based on the order `customer_id` and any tender `customer_id`
#  associated with the order. It does not filter based on the
#  [FulfillmentRecipient](entity:FulfillmentRecipient) `customer_id`.
  class SearchOrdersCustomerFilter
  # @return [Array<String>] A list of customer IDs to filter by.
#  Max: 10 customer ids.
    attr_reader :customer_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param customer_ids [Array<String>] A list of customer IDs to filter by.
#  Max: 10 customer ids.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SearchOrdersCustomerFilter]
    def initialize(customer_ids: OMIT, additional_properties: nil)
      @customer_ids = customer_ids if customer_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "customer_ids": customer_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchOrdersCustomerFilter
    #
    # @param json_object [String] 
    # @return [square.rb::SearchOrdersCustomerFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      customer_ids = parsed_json["customer_ids"]
      new(customer_ids: customer_ids, additional_properties: struct)
    end
# Serialize an instance of SearchOrdersCustomerFilter to a JSON object
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
      obj.customer_ids&.is_a?(Array) != false || raise("Passed value for field obj.customer_ids is not the expected type, validation failed.")
    end
  end
end