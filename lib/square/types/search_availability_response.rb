# frozen_string_literal: true
require_relative "availability"
require_relative "error"
require "ostruct"
require "json"

module square.rb
  class SearchAvailabilityResponse
  # @return [Array<square.rb::Availability>] List of appointment slots available for booking.
    attr_reader :availabilities
  # @return [Array<square.rb::Error>] Errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param availabilities [Array<square.rb::Availability>] List of appointment slots available for booking.
    # @param errors [Array<square.rb::Error>] Errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SearchAvailabilityResponse]
    def initialize(availabilities: OMIT, errors: OMIT, additional_properties: nil)
      @availabilities = availabilities if availabilities != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "availabilities": availabilities, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchAvailabilityResponse
    #
    # @param json_object [String] 
    # @return [square.rb::SearchAvailabilityResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      availabilities = parsed_json["availabilities"]&.map do | item |
  item = item.to_json
  square.rb::Availability.from_json(json_object: item)
end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        availabilities: availabilities,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchAvailabilityResponse to a JSON object
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
      obj.availabilities&.is_a?(Array) != false || raise("Passed value for field obj.availabilities is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end