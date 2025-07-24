# frozen_string_literal: true
require_relative "error"
require_relative "inventory_count"
require "ostruct"
require "json"

module square.rb
  class GetInventoryCountResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<square.rb::InventoryCount>] The current calculated inventory counts for the requested object and
#  locations.
    attr_reader :counts
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
    # @param counts [Array<square.rb::InventoryCount>] The current calculated inventory counts for the requested object and
#  locations.
    # @param cursor [String] The pagination cursor to be used in a subsequent request. If unset,
#  this is the final response.
#  See the
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination)
#  guide for more information.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GetInventoryCountResponse]
    def initialize(errors: OMIT, counts: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @counts = counts if counts != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "counts": counts, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetInventoryCountResponse
    #
    # @param json_object [String] 
    # @return [square.rb::GetInventoryCountResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      counts = parsed_json["counts"]&.map do | item |
  item = item.to_json
  square.rb::InventoryCount.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        counts: counts,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of GetInventoryCountResponse to a JSON object
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
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end