# frozen_string_literal: true
require_relative "break_type"
require_relative "error"
require "ostruct"
require "json"

module square.rb
# A response to a request to update a `BreakType`. The response contains
#  the requested `BreakType` objects and might contain a set of `Error` objects if
#  the request resulted in errors.
  class UpdateBreakTypeResponse
  # @return [square.rb::BreakType] The response object.
    attr_reader :break_type
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param break_type [square.rb::BreakType] The response object.
    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::UpdateBreakTypeResponse]
    def initialize(break_type: OMIT, errors: OMIT, additional_properties: nil)
      @break_type = break_type if break_type != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "break_type": break_type, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateBreakTypeResponse
    #
    # @param json_object [String] 
    # @return [square.rb::UpdateBreakTypeResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["break_type"].nil?
        break_type = parsed_json["break_type"].to_json
        break_type = square.rb::BreakType.from_json(json_object: break_type)
      else
        break_type = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        break_type: break_type,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateBreakTypeResponse to a JSON object
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
      obj.break_type.nil? || square.rb::BreakType.validate_raw(obj: obj.break_type)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end