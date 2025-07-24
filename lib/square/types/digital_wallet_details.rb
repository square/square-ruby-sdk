# frozen_string_literal: true
require_relative "cash_app_details"
require "ostruct"
require "json"

module square.rb
# Additional details about `WALLET` type payments. Contains only non-confidential
#  information.
  class DigitalWalletDetails
  # @return [String] The status of the `WALLET` payment. The status can be `AUTHORIZED`, `CAPTURED`,
#  `VOIDED`, or
#  `FAILED`.
    attr_reader :status
  # @return [String] The brand used for the `WALLET` payment. The brand can be `CASH_APP`, `PAYPAY`,
#  `ALIPAY`,
#  `RAKUTEN_PAY`, `AU_PAY`, `D_BARAI`, `MERPAY`, `WECHAT_PAY` or `UNKNOWN`.
    attr_reader :brand
  # @return [square.rb::CashAppDetails] Brand-specific details for payments with the `brand` of `CASH_APP`.
    attr_reader :cash_app_details
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param status [String] The status of the `WALLET` payment. The status can be `AUTHORIZED`, `CAPTURED`,
#  `VOIDED`, or
#  `FAILED`.
    # @param brand [String] The brand used for the `WALLET` payment. The brand can be `CASH_APP`, `PAYPAY`,
#  `ALIPAY`,
#  `RAKUTEN_PAY`, `AU_PAY`, `D_BARAI`, `MERPAY`, `WECHAT_PAY` or `UNKNOWN`.
    # @param cash_app_details [square.rb::CashAppDetails] Brand-specific details for payments with the `brand` of `CASH_APP`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::DigitalWalletDetails]
    def initialize(status: OMIT, brand: OMIT, cash_app_details: OMIT, additional_properties: nil)
      @status = status if status != OMIT
      @brand = brand if brand != OMIT
      @cash_app_details = cash_app_details if cash_app_details != OMIT
      @additional_properties = additional_properties
      @_field_set = { "status": status, "brand": brand, "cash_app_details": cash_app_details }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DigitalWalletDetails
    #
    # @param json_object [String] 
    # @return [square.rb::DigitalWalletDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      status = parsed_json["status"]
      brand = parsed_json["brand"]
      unless parsed_json["cash_app_details"].nil?
        cash_app_details = parsed_json["cash_app_details"].to_json
        cash_app_details = square.rb::CashAppDetails.from_json(json_object: cash_app_details)
      else
        cash_app_details = nil
      end
      new(
        status: status,
        brand: brand,
        cash_app_details: cash_app_details,
        additional_properties: struct
      )
    end
# Serialize an instance of DigitalWalletDetails to a JSON object
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
      obj.status&.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.brand&.is_a?(String) != false || raise("Passed value for field obj.brand is not the expected type, validation failed.")
      obj.cash_app_details.nil? || square.rb::CashAppDetails.validate_raw(obj: obj.cash_app_details)
    end
  end
end