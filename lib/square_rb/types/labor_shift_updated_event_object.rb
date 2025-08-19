# frozen_string_literal: true
require_relative "shift"
require "ostruct"
require "json"

module SquareApiClient
  class LaborShiftUpdatedEventObject
  # @return [SquareApiClient::Shift] The updated `Shift`.
    attr_reader :shift
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param shift [SquareApiClient::Shift] The updated `Shift`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LaborShiftUpdatedEventObject]
    def initialize(shift: OMIT, additional_properties: nil)
      @shift = shift if shift != OMIT
      @additional_properties = additional_properties
      @_field_set = { "shift": shift }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LaborShiftUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LaborShiftUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["shift"].nil?
        shift = parsed_json["shift"].to_json
        shift = SquareApiClient::Shift.from_json(json_object: shift)
      else
        shift = nil
      end
      new(shift: shift, additional_properties: struct)
    end
# Serialize an instance of LaborShiftUpdatedEventObject to a JSON object
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
      obj.shift.nil? || SquareApiClient::Shift.validate_raw(obj: obj.shift)
    end
  end
end