# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents a set of query expressions (filters) to narrow the scope of targeted
#  subscriptions returned by
#  the [SearchSubscriptions](api-endpoint:Subscriptions-SearchSubscriptions)
#  endpoint.
  class SearchSubscriptionsFilter
  # @return [Array<String>] A filter to select subscriptions based on the subscribing customer IDs.
    attr_reader :customer_ids
  # @return [Array<String>] A filter to select subscriptions based on the location.
    attr_reader :location_ids
  # @return [Array<String>] A filter to select subscriptions based on the source application.
    attr_reader :source_names
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param customer_ids [Array<String>] A filter to select subscriptions based on the subscribing customer IDs.
    # @param location_ids [Array<String>] A filter to select subscriptions based on the location.
    # @param source_names [Array<String>] A filter to select subscriptions based on the source application.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchSubscriptionsFilter]
    def initialize(customer_ids: OMIT, location_ids: OMIT, source_names: OMIT, additional_properties: nil)
      @customer_ids = customer_ids if customer_ids != OMIT
      @location_ids = location_ids if location_ids != OMIT
      @source_names = source_names if source_names != OMIT
      @additional_properties = additional_properties
      @_field_set = { "customer_ids": customer_ids, "location_ids": location_ids, "source_names": source_names }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchSubscriptionsFilter
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchSubscriptionsFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      customer_ids = parsed_json["customer_ids"]
      location_ids = parsed_json["location_ids"]
      source_names = parsed_json["source_names"]
      new(
        customer_ids: customer_ids,
        location_ids: location_ids,
        source_names: source_names,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchSubscriptionsFilter to a JSON object
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
      obj.location_ids&.is_a?(Array) != false || raise("Passed value for field obj.location_ids is not the expected type, validation failed.")
      obj.source_names&.is_a?(Array) != false || raise("Passed value for field obj.source_names is not the expected type, validation failed.")
    end
  end
end