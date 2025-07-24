# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Response payload for bulk retrieval of bookings.
  class BulkRetrieveBookingsResponse
  # @return [Hash{String => square.rb::GetBookingResponse}] Requested bookings returned as a map containing `booking_id` as the key and
#  `RetrieveBookingResponse` as the value.
    attr_reader :bookings
  # @return [Array<square.rb::Error>] Errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param bookings [Hash{String => square.rb::GetBookingResponse}] Requested bookings returned as a map containing `booking_id` as the key and
#  `RetrieveBookingResponse` as the value.
    # @param errors [Array<square.rb::Error>] Errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BulkRetrieveBookingsResponse]
    def initialize(bookings: OMIT, errors: OMIT, additional_properties: nil)
      @bookings = bookings if bookings != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "bookings": bookings, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BulkRetrieveBookingsResponse
    #
    # @param json_object [String] 
    # @return [square.rb::BulkRetrieveBookingsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      bookings = parsed_json["bookings"]&.transform_values do | value |
  value = value.to_json
  square.rb::GetBookingResponse.from_json(json_object: value)
end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        bookings: bookings,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of BulkRetrieveBookingsResponse to a JSON object
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
      obj.bookings&.is_a?(Hash) != false || raise("Passed value for field obj.bookings is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end