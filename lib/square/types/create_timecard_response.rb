# frozen_string_literal: true
require_relative "timecard"
require_relative "error"
require "ostruct"
require "json"

module square.rb
# The response to a request to create a `Timecard`. The response contains
#  the created `Timecard` object and might contain a set of `Error` objects if
#  the request resulted in errors.
  class CreateTimecardResponse
  # @return [square.rb::Timecard] The `Timecard` that was created on the request.
    attr_reader :timecard
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param timecard [square.rb::Timecard] The `Timecard` that was created on the request.
    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CreateTimecardResponse]
    def initialize(timecard: OMIT, errors: OMIT, additional_properties: nil)
      @timecard = timecard if timecard != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "timecard": timecard, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateTimecardResponse
    #
    # @param json_object [String] 
    # @return [square.rb::CreateTimecardResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["timecard"].nil?
        timecard = parsed_json["timecard"].to_json
        timecard = square.rb::Timecard.from_json(json_object: timecard)
      else
        timecard = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        timecard: timecard,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateTimecardResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end