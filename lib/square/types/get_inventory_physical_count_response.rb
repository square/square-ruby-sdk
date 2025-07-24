# frozen_string_literal: true
require_relative "error"
require_relative "inventory_physical_count"
require "ostruct"
require "json"

module square.rb
  class GetInventoryPhysicalCountResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [square.rb::InventoryPhysicalCount] The requested [InventoryPhysicalCount](entity:InventoryPhysicalCount).
    attr_reader :count
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param count [square.rb::InventoryPhysicalCount] The requested [InventoryPhysicalCount](entity:InventoryPhysicalCount).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GetInventoryPhysicalCountResponse]
    def initialize(errors: OMIT, count: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @count = count if count != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "count": count }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetInventoryPhysicalCountResponse
    #
    # @param json_object [String] 
    # @return [square.rb::GetInventoryPhysicalCountResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["count"].nil?
        count = parsed_json["count"].to_json
        count = square.rb::InventoryPhysicalCount.from_json(json_object: count)
      else
        count = nil
      end
      new(
        errors: errors,
        count: count,
        additional_properties: struct
      )
    end
# Serialize an instance of GetInventoryPhysicalCountResponse to a JSON object
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
      obj.count.nil? || square.rb::InventoryPhysicalCount.validate_raw(obj: obj.count)
    end
  end
end