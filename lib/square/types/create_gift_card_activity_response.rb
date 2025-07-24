# frozen_string_literal: true
require_relative "error"
require_relative "gift_card_activity"
require "ostruct"
require "json"

module SquareApiClient
# A response that contains a `GiftCardActivity` that was created.
#  The response might contain a set of `Error` objects if the request resulted in
#  errors.
  class CreateGiftCardActivityResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [SquareApiClient::GiftCardActivity] The gift card activity that was created.
    attr_reader :gift_card_activity
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param gift_card_activity [SquareApiClient::GiftCardActivity] The gift card activity that was created.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CreateGiftCardActivityResponse]
    def initialize(errors: OMIT, gift_card_activity: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @gift_card_activity = gift_card_activity if gift_card_activity != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "gift_card_activity": gift_card_activity }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateGiftCardActivityResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CreateGiftCardActivityResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["gift_card_activity"].nil?
        gift_card_activity = parsed_json["gift_card_activity"].to_json
        gift_card_activity = SquareApiClient::GiftCardActivity.from_json(json_object: gift_card_activity)
      else
        gift_card_activity = nil
      end
      new(
        errors: errors,
        gift_card_activity: gift_card_activity,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateGiftCardActivityResponse to a JSON object
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
      obj.gift_card_activity.nil? || SquareApiClient::GiftCardActivity.validate_raw(obj: obj.gift_card_activity)
    end
  end
end