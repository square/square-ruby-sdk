# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Stores details about an external refund. Contains only non-confidential
#  information.
  class DestinationDetailsExternalRefundDetails
  # @return [String] The type of external refund the seller paid to the buyer. It can be one of the
#  following:
#  - CHECK - Refunded using a physical check.
#  - BANK_TRANSFER - Refunded using external bank transfer.
#  - OTHER\_GIFT\_CARD - Refunded using a non-Square gift card.
#  - CRYPTO - Refunded using a crypto currency.
#  - SQUARE_CASH - Refunded using Square Cash App.
#  - SOCIAL - Refunded using peer-to-peer payment applications.
#  - EXTERNAL - A third-party application gathered this refund outside of Square.
#  - EMONEY - Refunded using an E-money provider.
#  - CARD - A credit or debit card that Square does not support.
#  - STORED_BALANCE - Use for house accounts, store credit, and so forth.
#  - FOOD_VOUCHER - Restaurant voucher provided by employers to employees to pay
#  for meals
#  - OTHER - A type not listed here.
    attr_reader :type
  # @return [String] A description of the external refund source. For example,
#  "Food Delivery Service".
    attr_reader :source
  # @return [String] An ID to associate the refund to its originating source.
    attr_reader :source_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] The type of external refund the seller paid to the buyer. It can be one of the
#  following:
#  - CHECK - Refunded using a physical check.
#  - BANK_TRANSFER - Refunded using external bank transfer.
#  - OTHER\_GIFT\_CARD - Refunded using a non-Square gift card.
#  - CRYPTO - Refunded using a crypto currency.
#  - SQUARE_CASH - Refunded using Square Cash App.
#  - SOCIAL - Refunded using peer-to-peer payment applications.
#  - EXTERNAL - A third-party application gathered this refund outside of Square.
#  - EMONEY - Refunded using an E-money provider.
#  - CARD - A credit or debit card that Square does not support.
#  - STORED_BALANCE - Use for house accounts, store credit, and so forth.
#  - FOOD_VOUCHER - Restaurant voucher provided by employers to employees to pay
#  for meals
#  - OTHER - A type not listed here.
    # @param source [String] A description of the external refund source. For example,
#  "Food Delivery Service".
    # @param source_id [String] An ID to associate the refund to its originating source.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::DestinationDetailsExternalRefundDetails]
    def initialize(type:, source:, source_id: OMIT, additional_properties: nil)
      @type = type
      @source = source
      @source_id = source_id if source_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "source": source, "source_id": source_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  DestinationDetailsExternalRefundDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::DestinationDetailsExternalRefundDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      source = parsed_json["source"]
      source_id = parsed_json["source_id"]
      new(
        type: type,
        source: source,
        source_id: source_id,
        additional_properties: struct
      )
    end
# Serialize an instance of DestinationDetailsExternalRefundDetails to a JSON
#  object
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
    end
  end
end