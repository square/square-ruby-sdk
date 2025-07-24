# frozen_string_literal: true
require_relative "shift"
require_relative "error"
require "ostruct"
require "json"

module square.rb
# A response to a request to get a `Shift`. The response contains
#  the requested `Shift` object and might contain a set of `Error` objects if
#  the request resulted in errors.
  class GetShiftResponse
  # @return [square.rb::Shift] The requested `Shift`.
    attr_reader :shift
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param shift [square.rb::Shift] The requested `Shift`.
    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GetShiftResponse]
    def initialize(shift: OMIT, errors: OMIT, additional_properties: nil)
      @shift = shift if shift != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "shift": shift, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetShiftResponse
    #
    # @param json_object [String] 
    # @return [square.rb::GetShiftResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["shift"].nil?
        shift = parsed_json["shift"].to_json
        shift = square.rb::Shift.from_json(json_object: shift)
      else
        shift = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        shift: shift,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of GetShiftResponse to a JSON object
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
      obj.shift.nil? || square.rb::Shift.validate_raw(obj: obj.shift)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end