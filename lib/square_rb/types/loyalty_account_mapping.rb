# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents the mapping that associates a loyalty account with a buyer.
#  Currently, a loyalty account can only be mapped to a buyer by phone number. For
#  more information, see
#  [Loyalty Overview](https://developer.squareup.com/docs/loyalty/overview).
  class LoyaltyAccountMapping
  # @return [String] The Square-assigned ID of the mapping.
    attr_reader :id
  # @return [String] The timestamp when the mapping was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The phone number of the buyer, in E.164 format. For example, "+14155551111".
    attr_reader :phone_number
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The Square-assigned ID of the mapping.
    # @param created_at [String] The timestamp when the mapping was created, in RFC 3339 format.
    # @param phone_number [String] The phone number of the buyer, in E.164 format. For example, "+14155551111".
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LoyaltyAccountMapping]
    def initialize(id: OMIT, created_at: OMIT, phone_number: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @created_at = created_at if created_at != OMIT
      @phone_number = phone_number if phone_number != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "phone_number": phone_number }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyAccountMapping
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LoyaltyAccountMapping]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created_at = parsed_json["created_at"]
      phone_number = parsed_json["phone_number"]
      new(
        id: id,
        created_at: created_at,
        phone_number: phone_number,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyAccountMapping to a JSON object
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
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
    end
  end
end