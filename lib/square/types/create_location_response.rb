# frozen_string_literal: true
require_relative "error"
require_relative "location"
require "ostruct"
require "json"

module SquareApiClient
# The response object returned by the
#  [CreateLocation](api-endpoint:Locations-CreateLocation) endpoint.
  class CreateLocationResponse
  # @return [Array<SquareApiClient::Error>] Information about
#  [errors](https://developer.squareup.com/docs/build-basics/handling-errors)
#  encountered during the request.
    attr_reader :errors
  # @return [SquareApiClient::Location] The newly created `Location` object.
    attr_reader :location
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Information about
#  [errors](https://developer.squareup.com/docs/build-basics/handling-errors)
#  encountered during the request.
    # @param location [SquareApiClient::Location] The newly created `Location` object.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CreateLocationResponse]
    def initialize(errors: OMIT, location: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @location = location if location != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "location": location }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateLocationResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CreateLocationResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["location"].nil?
        location = parsed_json["location"].to_json
        location = SquareApiClient::Location.from_json(json_object: location)
      else
        location = nil
      end
      new(
        errors: errors,
        location: location,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateLocationResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.location.nil? || SquareApiClient::Location.validate_raw(obj: obj.location)
    end
  end
end