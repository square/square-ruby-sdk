# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module square.rb
# Represents an additional recipient (other than the merchant) entitled to a
#  portion of the tender.
#  Support is currently limited to USD, CAD and GBP currencies
  class ChargeRequestAdditionalRecipient
  # @return [String] The location ID for a recipient (other than the merchant) receiving a portion of
#  the tender.
    attr_reader :location_id
  # @return [String] The description of the additional recipient.
    attr_reader :description
  # @return [square.rb::Money] The amount of money distributed to the recipient.
    attr_reader :amount_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param location_id [String] The location ID for a recipient (other than the merchant) receiving a portion of
#  the tender.
    # @param description [String] The description of the additional recipient.
    # @param amount_money [square.rb::Money] The amount of money distributed to the recipient.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ChargeRequestAdditionalRecipient]
    def initialize(location_id:, description:, amount_money:, additional_properties: nil)
      @location_id = location_id
      @description = description
      @amount_money = amount_money
      @additional_properties = additional_properties
      @_field_set = { "location_id": location_id, "description": description, "amount_money": amount_money }
    end
# Deserialize a JSON object to an instance of ChargeRequestAdditionalRecipient
    #
    # @param json_object [String] 
    # @return [square.rb::ChargeRequestAdditionalRecipient]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      location_id = parsed_json["location_id"]
      description = parsed_json["description"]
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = square.rb::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      new(
        location_id: location_id,
        description: description,
        amount_money: amount_money,
        additional_properties: struct
      )
    end
# Serialize an instance of ChargeRequestAdditionalRecipient to a JSON object
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
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      square.rb::Money.validate_raw(obj: obj.amount_money)
    end
  end
end