# frozen_string_literal: true
require_relative "subscription_event_info_code"
require "ostruct"
require "json"

module SquareApiClient
# Provides information about the subscription event.
  class SubscriptionEventInfo
  # @return [String] A human-readable explanation for the event.
    attr_reader :detail
  # @return [SquareApiClient::SubscriptionEventInfoCode] An info code indicating the subscription event that occurred.
#  See [InfoCode](#type-infocode) for possible values
    attr_reader :code
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param detail [String] A human-readable explanation for the event.
    # @param code [SquareApiClient::SubscriptionEventInfoCode] An info code indicating the subscription event that occurred.
#  See [InfoCode](#type-infocode) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SubscriptionEventInfo]
    def initialize(detail: OMIT, code: OMIT, additional_properties: nil)
      @detail = detail if detail != OMIT
      @code = code if code != OMIT
      @additional_properties = additional_properties
      @_field_set = { "detail": detail, "code": code }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SubscriptionEventInfo
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SubscriptionEventInfo]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      detail = parsed_json["detail"]
      code = parsed_json["code"]
      new(
        detail: detail,
        code: code,
        additional_properties: struct
      )
    end
# Serialize an instance of SubscriptionEventInfo to a JSON object
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
      obj.detail&.is_a?(String) != false || raise("Passed value for field obj.detail is not the expected type, validation failed.")
      obj.code&.is_a?(SquareApiClient::SubscriptionEventInfoCode) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
    end
  end
end