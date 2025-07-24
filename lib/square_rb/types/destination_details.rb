# frozen_string_literal: true
require_relative "destination_details_card_refund_details"
require_relative "destination_details_cash_refund_details"
require_relative "destination_details_external_refund_details"
require "ostruct"
require "json"

module SquareApiClient
# Details about a refund's destination.
  class DestinationDetails
  # @return [SquareApiClient::DestinationDetailsCardRefundDetails] Details about a card refund. Only populated if the destination_type is `CARD`.
    attr_reader :card_details
  # @return [SquareApiClient::DestinationDetailsCashRefundDetails] Details about a cash refund. Only populated if the destination_type is `CASH`.
    attr_reader :cash_details
  # @return [SquareApiClient::DestinationDetailsExternalRefundDetails] Details about an external refund. Only populated if the destination_type is
#  `EXTERNAL`.
    attr_reader :external_details
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param card_details [SquareApiClient::DestinationDetailsCardRefundDetails] Details about a card refund. Only populated if the destination_type is `CARD`.
    # @param cash_details [SquareApiClient::DestinationDetailsCashRefundDetails] Details about a cash refund. Only populated if the destination_type is `CASH`.
    # @param external_details [SquareApiClient::DestinationDetailsExternalRefundDetails] Details about an external refund. Only populated if the destination_type is
#  `EXTERNAL`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::DestinationDetails]
    def initialize(card_details: OMIT, cash_details: OMIT, external_details: OMIT, additional_properties: nil)
      @card_details = card_details if card_details != OMIT
      @cash_details = cash_details if cash_details != OMIT
      @external_details = external_details if external_details != OMIT
      @additional_properties = additional_properties
      @_field_set = { "card_details": card_details, "cash_details": cash_details, "external_details": external_details }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DestinationDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::DestinationDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["card_details"].nil?
        card_details = parsed_json["card_details"].to_json
        card_details = SquareApiClient::DestinationDetailsCardRefundDetails.from_json(json_object: card_details)
      else
        card_details = nil
      end
      unless parsed_json["cash_details"].nil?
        cash_details = parsed_json["cash_details"].to_json
        cash_details = SquareApiClient::DestinationDetailsCashRefundDetails.from_json(json_object: cash_details)
      else
        cash_details = nil
      end
      unless parsed_json["external_details"].nil?
        external_details = parsed_json["external_details"].to_json
        external_details = SquareApiClient::DestinationDetailsExternalRefundDetails.from_json(json_object: external_details)
      else
        external_details = nil
      end
      new(
        card_details: card_details,
        cash_details: cash_details,
        external_details: external_details,
        additional_properties: struct
      )
    end
# Serialize an instance of DestinationDetails to a JSON object
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
      obj.card_details.nil? || SquareApiClient::DestinationDetailsCardRefundDetails.validate_raw(obj: obj.card_details)
      obj.cash_details.nil? || SquareApiClient::DestinationDetailsCashRefundDetails.validate_raw(obj: obj.cash_details)
      obj.external_details.nil? || SquareApiClient::DestinationDetailsExternalRefundDetails.validate_raw(obj: obj.external_details)
    end
  end
end