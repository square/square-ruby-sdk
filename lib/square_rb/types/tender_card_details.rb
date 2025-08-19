# frozen_string_literal: true
require_relative "tender_card_details_status"
require_relative "card"
require_relative "tender_card_details_entry_method"
require "ostruct"
require "json"

module SquareApiClient
# Represents additional details of a tender with `type` `CARD` or
#  `SQUARE_GIFT_CARD`
  class TenderCardDetails
  # @return [SquareApiClient::TenderCardDetailsStatus] The credit card payment's current state (such as `AUTHORIZED` or
#  `CAPTURED`). See [TenderCardDetailsStatus](entity:TenderCardDetailsStatus)
#  for possible values.
#  See [TenderCardDetailsStatus](#type-tendercarddetailsstatus) for possible values
    attr_reader :status
  # @return [SquareApiClient::Card] The credit card's non-confidential details.
    attr_reader :card
  # @return [SquareApiClient::TenderCardDetailsEntryMethod] The method used to enter the card's details for the transaction.
#  See [TenderCardDetailsEntryMethod](#type-tendercarddetailsentrymethod) for
#  possible values
    attr_reader :entry_method
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param status [SquareApiClient::TenderCardDetailsStatus] The credit card payment's current state (such as `AUTHORIZED` or
#  `CAPTURED`). See [TenderCardDetailsStatus](entity:TenderCardDetailsStatus)
#  for possible values.
#  See [TenderCardDetailsStatus](#type-tendercarddetailsstatus) for possible values
    # @param card [SquareApiClient::Card] The credit card's non-confidential details.
    # @param entry_method [SquareApiClient::TenderCardDetailsEntryMethod] The method used to enter the card's details for the transaction.
#  See [TenderCardDetailsEntryMethod](#type-tendercarddetailsentrymethod) for
#  possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::TenderCardDetails]
    def initialize(status: OMIT, card: OMIT, entry_method: OMIT, additional_properties: nil)
      @status = status if status != OMIT
      @card = card if card != OMIT
      @entry_method = entry_method if entry_method != OMIT
      @additional_properties = additional_properties
      @_field_set = { "status": status, "card": card, "entry_method": entry_method }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TenderCardDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::TenderCardDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      status = parsed_json["status"]
      unless parsed_json["card"].nil?
        card = parsed_json["card"].to_json
        card = SquareApiClient::Card.from_json(json_object: card)
      else
        card = nil
      end
      entry_method = parsed_json["entry_method"]
      new(
        status: status,
        card: card,
        entry_method: entry_method,
        additional_properties: struct
      )
    end
# Serialize an instance of TenderCardDetails to a JSON object
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
      obj.status&.is_a?(SquareApiClient::TenderCardDetailsStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.card.nil? || SquareApiClient::Card.validate_raw(obj: obj.card)
      obj.entry_method&.is_a?(SquareApiClient::TenderCardDetailsEntryMethod) != false || raise("Passed value for field obj.entry_method is not the expected type, validation failed.")
    end
  end
end