# frozen_string_literal: true
require_relative "error"
require_relative "checkout_location_settings"
require "ostruct"
require "json"

module SquareApiClient
  class UpdateLocationSettingsResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred when updating the location settings.
    attr_reader :errors
  # @return [SquareApiClient::CheckoutLocationSettings] The updated location settings.
    attr_reader :location_settings
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred when updating the location settings.
    # @param location_settings [SquareApiClient::CheckoutLocationSettings] The updated location settings.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::UpdateLocationSettingsResponse]
    def initialize(errors: OMIT, location_settings: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @location_settings = location_settings if location_settings != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "location_settings": location_settings }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateLocationSettingsResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::UpdateLocationSettingsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["location_settings"].nil?
        location_settings = parsed_json["location_settings"].to_json
        location_settings = SquareApiClient::CheckoutLocationSettings.from_json(json_object: location_settings)
      else
        location_settings = nil
      end
      new(
        errors: errors,
        location_settings: location_settings,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateLocationSettingsResponse to a JSON object
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
      obj.location_settings.nil? || SquareApiClient::CheckoutLocationSettings.validate_raw(obj: obj.location_settings)
    end
  end
end