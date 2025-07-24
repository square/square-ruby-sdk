# frozen_string_literal: true
require_relative "error"
require_relative "inventory_change"
require "ostruct"
require "json"

module square.rb
  class GetInventoryChangesResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<square.rb::InventoryChange>] The set of inventory changes for the requested object and locations.
    attr_reader :changes
  # @return [String] The pagination cursor to be used in a subsequent request. If unset,
#  this is the final response.
#  See the
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination)
#  guide for more information.
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param changes [Array<square.rb::InventoryChange>] The set of inventory changes for the requested object and locations.
    # @param cursor [String] The pagination cursor to be used in a subsequent request. If unset,
#  this is the final response.
#  See the
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination)
#  guide for more information.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GetInventoryChangesResponse]
    def initialize(errors: OMIT, changes: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @changes = changes if changes != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "changes": changes, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetInventoryChangesResponse
    #
    # @param json_object [String] 
    # @return [square.rb::GetInventoryChangesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      changes = parsed_json["changes"]&.map do | item |
  item = item.to_json
  square.rb::InventoryChange.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        changes: changes,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of GetInventoryChangesResponse to a JSON object
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
      obj.changes&.is_a?(Array) != false || raise("Passed value for field obj.changes is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end