# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module SquareApiClient
# Represents an additional recipient (other than the merchant) receiving a portion
#  of this tender.
  class AdditionalRecipient
  # @return [String] The location ID for a recipient (other than the merchant) receiving a portion of
#  this tender.
    attr_reader :location_id
  # @return [String] The description of the additional recipient.
    attr_reader :description
  # @return [SquareApiClient::Money] The amount of money distributed to the recipient.
    attr_reader :amount_money
  # @return [String] The unique ID for the RETIRED `AdditionalRecipientReceivable` object. This field
#  should be empty for any `AdditionalRecipient` objects created after the
#  retirement.
    attr_reader :receivable_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param location_id [String] The location ID for a recipient (other than the merchant) receiving a portion of
#  this tender.
    # @param description [String] The description of the additional recipient.
    # @param amount_money [SquareApiClient::Money] The amount of money distributed to the recipient.
    # @param receivable_id [String] The unique ID for the RETIRED `AdditionalRecipientReceivable` object. This field
#  should be empty for any `AdditionalRecipient` objects created after the
#  retirement.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::AdditionalRecipient]
    def initialize(location_id:, description: OMIT, amount_money:, receivable_id: OMIT, additional_properties: nil)
      @location_id = location_id
      @description = description if description != OMIT
      @amount_money = amount_money
      @receivable_id = receivable_id if receivable_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "location_id": location_id, "description": description, "amount_money": amount_money, "receivable_id": receivable_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AdditionalRecipient
    #
    # @param json_object [String] 
    # @return [SquareApiClient::AdditionalRecipient]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      location_id = parsed_json["location_id"]
      description = parsed_json["description"]
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = SquareApiClient::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      receivable_id = parsed_json["receivable_id"]
      new(
        location_id: location_id,
        description: description,
        amount_money: amount_money,
        receivable_id: receivable_id,
        additional_properties: struct
      )
    end
# Serialize an instance of AdditionalRecipient to a JSON object
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
      obj.location_id.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      SquareApiClient::Money.validate_raw(obj: obj.amount_money)
      obj.receivable_id&.is_a?(String) != false || raise("Passed value for field obj.receivable_id is not the expected type, validation failed.")
    end
  end
end