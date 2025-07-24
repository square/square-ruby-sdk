# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# A node in the path from a retrieved category to its root node.
  class CategoryPathToRootNode
  # @return [String] The category's ID.
    attr_reader :category_id
  # @return [String] The category's name.
    attr_reader :category_name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param category_id [String] The category's ID.
    # @param category_name [String] The category's name.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CategoryPathToRootNode]
    def initialize(category_id: OMIT, category_name: OMIT, additional_properties: nil)
      @category_id = category_id if category_id != OMIT
      @category_name = category_name if category_name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "category_id": category_id, "category_name": category_name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CategoryPathToRootNode
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CategoryPathToRootNode]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      category_id = parsed_json["category_id"]
      category_name = parsed_json["category_name"]
      new(
        category_id: category_id,
        category_name: category_name,
        additional_properties: struct
      )
    end
# Serialize an instance of CategoryPathToRootNode to a JSON object
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
      obj.category_id&.is_a?(String) != false || raise("Passed value for field obj.category_id is not the expected type, validation failed.")
      obj.category_name&.is_a?(String) != false || raise("Passed value for field obj.category_name is not the expected type, validation failed.")
    end
  end
end