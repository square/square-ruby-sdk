# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Represents the details of a webhook subscription, including notification URL,
#  event types, and signature key.
  class SubscriptionTestResult
  # @return [String] A Square-generated unique ID for the subscription test result.
    attr_reader :id
  # @return [Integer] The status code returned by the subscription notification URL.
    attr_reader :status_code
  # @return [String] An object containing the payload of the test event. For example, a
#  `payment.created` event.
    attr_reader :payload
  # @return [String] The timestamp of when the subscription was created, in RFC 3339 format.
#  For example, "2016-09-04T23:59:33.123Z".
    attr_reader :created_at
  # @return [String] The timestamp of when the subscription was updated, in RFC 3339 format. For
#  example, "2016-09-04T23:59:33.123Z".
#  Because a subscription test result is unique, this field is the same as the
#  `created_at` field.
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A Square-generated unique ID for the subscription test result.
    # @param status_code [Integer] The status code returned by the subscription notification URL.
    # @param payload [String] An object containing the payload of the test event. For example, a
#  `payment.created` event.
    # @param created_at [String] The timestamp of when the subscription was created, in RFC 3339 format.
#  For example, "2016-09-04T23:59:33.123Z".
    # @param updated_at [String] The timestamp of when the subscription was updated, in RFC 3339 format. For
#  example, "2016-09-04T23:59:33.123Z".
#  Because a subscription test result is unique, this field is the same as the
#  `created_at` field.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SubscriptionTestResult]
    def initialize(id: OMIT, status_code: OMIT, payload: OMIT, created_at: OMIT, updated_at: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @status_code = status_code if status_code != OMIT
      @payload = payload if payload != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "status_code": status_code, "payload": payload, "created_at": created_at, "updated_at": updated_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SubscriptionTestResult
    #
    # @param json_object [String] 
    # @return [square.rb::SubscriptionTestResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      status_code = parsed_json["status_code"]
      payload = parsed_json["payload"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      new(
        id: id,
        status_code: status_code,
        payload: payload,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end
# Serialize an instance of SubscriptionTestResult to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.status_code&.is_a?(Integer) != false || raise("Passed value for field obj.status_code is not the expected type, validation failed.")
      obj.payload&.is_a?(String) != false || raise("Passed value for field obj.payload is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end