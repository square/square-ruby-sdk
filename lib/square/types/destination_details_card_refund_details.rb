# frozen_string_literal: true
require_relative "card"
require "ostruct"
require "json"

module SquareApiClient
  class DestinationDetailsCardRefundDetails
  # @return [SquareApiClient::Card] The card's non-confidential details.
    attr_reader :card
  # @return [String] The method used to enter the card's details for the refund. The method can be
#  `KEYED`, `SWIPED`, `EMV`, `ON_FILE`, or `CONTACTLESS`.
    attr_reader :entry_method
  # @return [String] The authorization code provided by the issuer when a refund is approved.
    attr_reader :auth_result_code
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param card [SquareApiClient::Card] The card's non-confidential details.
    # @param entry_method [String] The method used to enter the card's details for the refund. The method can be
#  `KEYED`, `SWIPED`, `EMV`, `ON_FILE`, or `CONTACTLESS`.
    # @param auth_result_code [String] The authorization code provided by the issuer when a refund is approved.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::DestinationDetailsCardRefundDetails]
    def initialize(card: OMIT, entry_method: OMIT, auth_result_code: OMIT, additional_properties: nil)
      @card = card if card != OMIT
      @entry_method = entry_method if entry_method != OMIT
      @auth_result_code = auth_result_code if auth_result_code != OMIT
      @additional_properties = additional_properties
      @_field_set = { "card": card, "entry_method": entry_method, "auth_result_code": auth_result_code }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DestinationDetailsCardRefundDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::DestinationDetailsCardRefundDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["card"].nil?
        card = parsed_json["card"].to_json
        card = SquareApiClient::Card.from_json(json_object: card)
      else
        card = nil
      end
      entry_method = parsed_json["entry_method"]
      auth_result_code = parsed_json["auth_result_code"]
      new(
        card: card,
        entry_method: entry_method,
        auth_result_code: auth_result_code,
        additional_properties: struct
      )
    end
# Serialize an instance of DestinationDetailsCardRefundDetails to a JSON object
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
      obj.card.nil? || SquareApiClient::Card.validate_raw(obj: obj.card)
      obj.entry_method&.is_a?(String) != false || raise("Passed value for field obj.entry_method is not the expected type, validation failed.")
      obj.auth_result_code&.is_a?(String) != false || raise("Passed value for field obj.auth_result_code is not the expected type, validation failed.")
    end
  end
end