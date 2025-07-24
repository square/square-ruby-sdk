# frozen_string_literal: true
require_relative "timecard"
require "ostruct"
require "json"

module square.rb
  class LaborTimecardUpdatedEventObject
  # @return [square.rb::Timecard] The updated `Timecard`.
    attr_reader :timecard
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param timecard [square.rb::Timecard] The updated `Timecard`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LaborTimecardUpdatedEventObject]
    def initialize(timecard: OMIT, additional_properties: nil)
      @timecard = timecard if timecard != OMIT
      @additional_properties = additional_properties
      @_field_set = { "timecard": timecard }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LaborTimecardUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::LaborTimecardUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["timecard"].nil?
        timecard = parsed_json["timecard"].to_json
        timecard = square.rb::Timecard.from_json(json_object: timecard)
      else
        timecard = nil
      end
      new(timecard: timecard, additional_properties: struct)
    end
# Serialize an instance of LaborTimecardUpdatedEventObject to a JSON object
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
      obj.timecard.nil? || square.rb::Timecard.validate_raw(obj: obj.timecard)
    end
  end
end