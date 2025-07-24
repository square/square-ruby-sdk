# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Information about a merge operation, which creates a new customer using
#  aggregated properties from two or more existing customers.
  class CustomerCreatedEventEventContextMerge
  # @return [Array<String>] The IDs of the existing customers that were merged and then deleted.
    attr_reader :from_customer_ids
  # @return [String] The ID of the new customer created by the merge.
    attr_reader :to_customer_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param from_customer_ids [Array<String>] The IDs of the existing customers that were merged and then deleted.
    # @param to_customer_id [String] The ID of the new customer created by the merge.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CustomerCreatedEventEventContextMerge]
    def initialize(from_customer_ids: OMIT, to_customer_id: OMIT, additional_properties: nil)
      @from_customer_ids = from_customer_ids if from_customer_ids != OMIT
      @to_customer_id = to_customer_id if to_customer_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "from_customer_ids": from_customer_ids, "to_customer_id": to_customer_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CustomerCreatedEventEventContextMerge
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CustomerCreatedEventEventContextMerge]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      from_customer_ids = parsed_json["from_customer_ids"]
      to_customer_id = parsed_json["to_customer_id"]
      new(
        from_customer_ids: from_customer_ids,
        to_customer_id: to_customer_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomerCreatedEventEventContextMerge to a JSON object
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
      obj.from_customer_ids&.is_a?(Array) != false || raise("Passed value for field obj.from_customer_ids is not the expected type, validation failed.")
      obj.to_customer_id&.is_a?(String) != false || raise("Passed value for field obj.to_customer_id is not the expected type, validation failed.")
    end
  end
end