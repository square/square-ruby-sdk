# frozen_string_literal: true
require_relative "error"
require_relative "inventory_count"
require_relative "inventory_change"
require "ostruct"
require "json"

module SquareApiClient
  class BatchChangeInventoryResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<SquareApiClient::InventoryCount>] The current counts for all objects referenced in the request.
    attr_reader :counts
  # @return [Array<SquareApiClient::InventoryChange>] Changes created for the request.
    attr_reader :changes
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param counts [Array<SquareApiClient::InventoryCount>] The current counts for all objects referenced in the request.
    # @param changes [Array<SquareApiClient::InventoryChange>] Changes created for the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::BatchChangeInventoryResponse]
    def initialize(errors: OMIT, counts: OMIT, changes: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @counts = counts if counts != OMIT
      @changes = changes if changes != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "counts": counts, "changes": changes }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BatchChangeInventoryResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::BatchChangeInventoryResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      counts = parsed_json["counts"]&.map do | item |
  item = item.to_json
  SquareApiClient::InventoryCount.from_json(json_object: item)
end
      changes = parsed_json["changes"]&.map do | item |
  item = item.to_json
  SquareApiClient::InventoryChange.from_json(json_object: item)
end
      new(
        errors: errors,
        counts: counts,
        changes: changes,
        additional_properties: struct
      )
    end
# Serialize an instance of BatchChangeInventoryResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.counts&.is_a?(Array) != false || raise("Passed value for field obj.counts is not the expected type, validation failed.")
      obj.changes&.is_a?(Array) != false || raise("Passed value for field obj.changes is not the expected type, validation failed.")
    end
  end
end