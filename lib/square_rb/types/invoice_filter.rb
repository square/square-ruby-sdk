# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Describes query filters to apply.
  class InvoiceFilter
  # @return [Array<String>] Limits the search to the specified locations. A location is required.
#  In the current implementation, only one location can be specified.
    attr_reader :location_ids
  # @return [Array<String>] Limits the search to the specified customers, within the specified locations.
#  Specifying a customer is optional. In the current implementation,
#  a maximum of one customer can be specified.
    attr_reader :customer_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param location_ids [Array<String>] Limits the search to the specified locations. A location is required.
#  In the current implementation, only one location can be specified.
    # @param customer_ids [Array<String>] Limits the search to the specified customers, within the specified locations.
#  Specifying a customer is optional. In the current implementation,
#  a maximum of one customer can be specified.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::InvoiceFilter]
    def initialize(location_ids:, customer_ids: OMIT, additional_properties: nil)
      @location_ids = location_ids
      @customer_ids = customer_ids if customer_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "location_ids": location_ids, "customer_ids": customer_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of InvoiceFilter
    #
    # @param json_object [String] 
    # @return [SquareApiClient::InvoiceFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      location_ids = parsed_json["location_ids"]
      customer_ids = parsed_json["customer_ids"]
      new(
        location_ids: location_ids,
        customer_ids: customer_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of InvoiceFilter to a JSON object
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
      obj.location_ids.is_a?(Array) != false || raise("Passed value for field obj.location_ids is not the expected type, validation failed.")
      obj.customer_ids&.is_a?(Array) != false || raise("Passed value for field obj.customer_ids is not the expected type, validation failed.")
    end
  end
end