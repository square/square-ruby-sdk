# frozen_string_literal: true
require_relative "scheduled_shift"
require "ostruct"
require "json"

module square.rb
  class LaborScheduledShiftPublishedEventObject
  # @return [square.rb::ScheduledShift] The published `ScheduledShift`.
    attr_reader :scheduled_shift
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param scheduled_shift [square.rb::ScheduledShift] The published `ScheduledShift`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LaborScheduledShiftPublishedEventObject]
    def initialize(scheduled_shift: OMIT, additional_properties: nil)
      @scheduled_shift = scheduled_shift if scheduled_shift != OMIT
      @additional_properties = additional_properties
      @_field_set = { "ScheduledShift": scheduled_shift }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  LaborScheduledShiftPublishedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::LaborScheduledShiftPublishedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["ScheduledShift"].nil?
        scheduled_shift = parsed_json["ScheduledShift"].to_json
        scheduled_shift = square.rb::ScheduledShift.from_json(json_object: scheduled_shift)
      else
        scheduled_shift = nil
      end
      new(scheduled_shift: scheduled_shift, additional_properties: struct)
    end
# Serialize an instance of LaborScheduledShiftPublishedEventObject to a JSON
#  object
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
      obj.scheduled_shift.nil? || square.rb::ScheduledShift.validate_raw(obj: obj.scheduled_shift)
    end
  end
end