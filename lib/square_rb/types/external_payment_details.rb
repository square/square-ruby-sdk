# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module SquareApiClient
# Stores details about an external payment. Contains only non-confidential
#  information.
#  For more information, see
#  [Take External
#  tps://developer.squareup.com/docs/payments-api/take-payments/external-payments).
  class ExternalPaymentDetails
  # @return [String] The type of external payment the seller received. It can be one of the
#  following:
#  - CHECK - Paid using a physical check.
#  - BANK_TRANSFER - Paid using external bank transfer.
#  - OTHER\_GIFT\_CARD - Paid using a non-Square gift card.
#  - CRYPTO - Paid using a crypto currency.
#  - SQUARE_CASH - Paid using Square Cash App.
#  - SOCIAL - Paid using peer-to-peer payment applications.
#  - EXTERNAL - A third-party application gathered this payment outside of Square.
#  - EMONEY - Paid using an E-money provider.
#  - CARD - A credit or debit card that Square does not support.
#  - STORED_BALANCE - Use for house accounts, store credit, and so forth.
#  - FOOD_VOUCHER - Restaurant voucher provided by employers to employees to pay
#  for meals
#  - OTHER - A type not listed here.
    attr_reader :type
  # @return [String] A description of the external payment source. For example,
#  "Food Delivery Service".
    attr_reader :source
  # @return [String] An ID to associate the payment to its originating source.
    attr_reader :source_id
  # @return [SquareApiClient::Money] The fees paid to the source. The `amount_money` minus this field is
#  the net amount seller receives.
    attr_reader :source_fee_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] The type of external payment the seller received. It can be one of the
#  following:
#  - CHECK - Paid using a physical check.
#  - BANK_TRANSFER - Paid using external bank transfer.
#  - OTHER\_GIFT\_CARD - Paid using a non-Square gift card.
#  - CRYPTO - Paid using a crypto currency.
#  - SQUARE_CASH - Paid using Square Cash App.
#  - SOCIAL - Paid using peer-to-peer payment applications.
#  - EXTERNAL - A third-party application gathered this payment outside of Square.
#  - EMONEY - Paid using an E-money provider.
#  - CARD - A credit or debit card that Square does not support.
#  - STORED_BALANCE - Use for house accounts, store credit, and so forth.
#  - FOOD_VOUCHER - Restaurant voucher provided by employers to employees to pay
#  for meals
#  - OTHER - A type not listed here.
    # @param source [String] A description of the external payment source. For example,
#  "Food Delivery Service".
    # @param source_id [String] An ID to associate the payment to its originating source.
    # @param source_fee_money [SquareApiClient::Money] The fees paid to the source. The `amount_money` minus this field is
#  the net amount seller receives.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ExternalPaymentDetails]
    def initialize(type:, source:, source_id: OMIT, source_fee_money: OMIT, additional_properties: nil)
      @type = type
      @source = source
      @source_id = source_id if source_id != OMIT
      @source_fee_money = source_fee_money if source_fee_money != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "source": source, "source_id": source_id, "source_fee_money": source_fee_money }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ExternalPaymentDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ExternalPaymentDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      source = parsed_json["source"]
      source_id = parsed_json["source_id"]
      unless parsed_json["source_fee_money"].nil?
        source_fee_money = parsed_json["source_fee_money"].to_json
        source_fee_money = SquareApiClient::Money.from_json(json_object: source_fee_money)
      else
        source_fee_money = nil
      end
      new(
        type: type,
        source: source,
        source_id: source_id,
        source_fee_money: source_fee_money,
        additional_properties: struct
      )
    end
# Serialize an instance of ExternalPaymentDetails to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.source.is_a?(String) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
      obj.source_id&.is_a?(String) != false || raise("Passed value for field obj.source_id is not the expected type, validation failed.")
      obj.source_fee_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.source_fee_money)
    end
  end
end