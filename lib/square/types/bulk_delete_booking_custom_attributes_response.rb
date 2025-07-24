# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Represents a
#  ributes](api-endpoint:BookingCustomAttributes-BulkDeleteBookingCustomAttributes)
#  response,
#  which contains a map of responses that each corresponds to an individual delete
#  request.
  class BulkDeleteBookingCustomAttributesResponse
  # @return [Hash{String => square.rb::BookingCustomAttributeDeleteResponse}] A map of responses that correspond to individual delete requests. Each response
#  has the
#  same ID as the corresponding request and contains `booking_id` and  `errors`
#  field.
    attr_reader :values
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param values [Hash{String => square.rb::BookingCustomAttributeDeleteResponse}] A map of responses that correspond to individual delete requests. Each response
#  has the
#  same ID as the corresponding request and contains `booking_id` and  `errors`
#  field.
    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BulkDeleteBookingCustomAttributesResponse]
    def initialize(values: OMIT, errors: OMIT, additional_properties: nil)
      @values = values if values != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "values": values, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  BulkDeleteBookingCustomAttributesResponse
    #
    # @param json_object [String] 
    # @return [square.rb::BulkDeleteBookingCustomAttributesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      values = parsed_json["values"]&.transform_values do | value |
  value = value.to_json
  square.rb::BookingCustomAttributeDeleteResponse.from_json(json_object: value)
end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        values: values,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of BulkDeleteBookingCustomAttributesResponse to a JSON
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
      obj.values&.is_a?(Hash) != false || raise("Passed value for field obj.values is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end