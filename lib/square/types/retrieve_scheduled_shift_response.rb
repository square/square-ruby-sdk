# frozen_string_literal: true
require_relative "scheduled_shift"
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Represents a [RetrieveScheduledShift](api-endpoint:Labor-RetrieveScheduledShift)
#  response.
#  Either `scheduled_shift` or `errors` is present in the response.
  class RetrieveScheduledShiftResponse
  # @return [square.rb::ScheduledShift] The requested scheduled shift.
    attr_reader :scheduled_shift
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param scheduled_shift [square.rb::ScheduledShift] The requested scheduled shift.
    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::RetrieveScheduledShiftResponse]
    def initialize(scheduled_shift: OMIT, errors: OMIT, additional_properties: nil)
      @scheduled_shift = scheduled_shift if scheduled_shift != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "scheduled_shift": scheduled_shift, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of RetrieveScheduledShiftResponse
    #
    # @param json_object [String] 
    # @return [square.rb::RetrieveScheduledShiftResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["scheduled_shift"].nil?
        scheduled_shift = parsed_json["scheduled_shift"].to_json
        scheduled_shift = square.rb::ScheduledShift.from_json(json_object: scheduled_shift)
      else
        scheduled_shift = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        scheduled_shift: scheduled_shift,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of RetrieveScheduledShiftResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end