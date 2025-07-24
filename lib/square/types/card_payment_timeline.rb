# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# The timeline for card payments.
  class CardPaymentTimeline
  # @return [String] The timestamp when the payment was authorized, in RFC 3339 format.
    attr_reader :authorized_at
  # @return [String] The timestamp when the payment was captured, in RFC 3339 format.
    attr_reader :captured_at
  # @return [String] The timestamp when the payment was voided, in RFC 3339 format.
    attr_reader :voided_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param authorized_at [String] The timestamp when the payment was authorized, in RFC 3339 format.
    # @param captured_at [String] The timestamp when the payment was captured, in RFC 3339 format.
    # @param voided_at [String] The timestamp when the payment was voided, in RFC 3339 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CardPaymentTimeline]
    def initialize(authorized_at: OMIT, captured_at: OMIT, voided_at: OMIT, additional_properties: nil)
      @authorized_at = authorized_at if authorized_at != OMIT
      @captured_at = captured_at if captured_at != OMIT
      @voided_at = voided_at if voided_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "authorized_at": authorized_at, "captured_at": captured_at, "voided_at": voided_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CardPaymentTimeline
    #
    # @param json_object [String] 
    # @return [square.rb::CardPaymentTimeline]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      authorized_at = parsed_json["authorized_at"]
      captured_at = parsed_json["captured_at"]
      voided_at = parsed_json["voided_at"]
      new(
        authorized_at: authorized_at,
        captured_at: captured_at,
        voided_at: voided_at,
        additional_properties: struct
      )
    end
# Serialize an instance of CardPaymentTimeline to a JSON object
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
      obj.authorized_at&.is_a?(String) != false || raise("Passed value for field obj.authorized_at is not the expected type, validation failed.")
      obj.captured_at&.is_a?(String) != false || raise("Passed value for field obj.captured_at is not the expected type, validation failed.")
      obj.voided_at&.is_a?(String) != false || raise("Passed value for field obj.voided_at is not the expected type, validation failed.")
    end
  end
end