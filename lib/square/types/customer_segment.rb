# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Represents a group of customer profiles that match one or more predefined filter
#  criteria.
#  Segments (also known as Smart Groups) are defined and created within the
#  Customer Directory in the
#  Square Seller Dashboard or Point of Sale.
  class CustomerSegment
  # @return [String] A unique Square-generated ID for the segment.
    attr_reader :id
  # @return [String] The name of the segment.
    attr_reader :name
  # @return [String] The timestamp when the segment was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The timestamp when the segment was last updated, in RFC 3339 format.
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique Square-generated ID for the segment.
    # @param name [String] The name of the segment.
    # @param created_at [String] The timestamp when the segment was created, in RFC 3339 format.
    # @param updated_at [String] The timestamp when the segment was last updated, in RFC 3339 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CustomerSegment]
    def initialize(id: OMIT, name: OMIT, created_at: OMIT, updated_at: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @name = name if name != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "created_at": created_at, "updated_at": updated_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomerSegment
    #
    # @param json_object [String] 
    # @return [square.rb::CustomerSegment]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      new(
        id: id,
        name: name,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomerSegment to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end