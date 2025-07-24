# frozen_string_literal: true
require_relative "customer_created_event_event_context_merge"
require "ostruct"
require "json"

module SquareApiClient
# Information about the change that triggered the event.
  class CustomerCreatedEventEventContext
  # @return [SquareApiClient::CustomerCreatedEventEventContextMerge] Information about the merge operation associated with the event.
    attr_reader :merge
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param merge [SquareApiClient::CustomerCreatedEventEventContextMerge] Information about the merge operation associated with the event.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CustomerCreatedEventEventContext]
    def initialize(merge: OMIT, additional_properties: nil)
      @merge = merge if merge != OMIT
      @additional_properties = additional_properties
      @_field_set = { "merge": merge }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomerCreatedEventEventContext
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CustomerCreatedEventEventContext]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["merge"].nil?
        merge = parsed_json["merge"].to_json
        merge = SquareApiClient::CustomerCreatedEventEventContextMerge.from_json(json_object: merge)
      else
        merge = nil
      end
      new(merge: merge, additional_properties: struct)
    end
# Serialize an instance of CustomerCreatedEventEventContext to a JSON object
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
      obj.merge.nil? || SquareApiClient::CustomerCreatedEventEventContextMerge.validate_raw(obj: obj.merge)
    end
  end
end