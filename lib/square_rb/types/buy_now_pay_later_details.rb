# frozen_string_literal: true
require_relative "afterpay_details"
require_relative "clearpay_details"
require "ostruct"
require "json"

module SquareApiClient
# Additional details about a Buy Now Pay Later payment type.
  class BuyNowPayLaterDetails
  # @return [String] The brand used for the Buy Now Pay Later payment.
#  The brand can be `AFTERPAY`, `CLEARPAY` or `UNKNOWN`.
    attr_reader :brand
  # @return [SquareApiClient::AfterpayDetails] Details about an Afterpay payment. These details are only populated if the
#  `brand` is
#  `AFTERPAY`.
    attr_reader :afterpay_details
  # @return [SquareApiClient::ClearpayDetails] Details about a Clearpay payment. These details are only populated if the
#  `brand` is
#  `CLEARPAY`.
    attr_reader :clearpay_details
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param brand [String] The brand used for the Buy Now Pay Later payment.
#  The brand can be `AFTERPAY`, `CLEARPAY` or `UNKNOWN`.
    # @param afterpay_details [SquareApiClient::AfterpayDetails] Details about an Afterpay payment. These details are only populated if the
#  `brand` is
#  `AFTERPAY`.
    # @param clearpay_details [SquareApiClient::ClearpayDetails] Details about a Clearpay payment. These details are only populated if the
#  `brand` is
#  `CLEARPAY`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::BuyNowPayLaterDetails]
    def initialize(brand: OMIT, afterpay_details: OMIT, clearpay_details: OMIT, additional_properties: nil)
      @brand = brand if brand != OMIT
      @afterpay_details = afterpay_details if afterpay_details != OMIT
      @clearpay_details = clearpay_details if clearpay_details != OMIT
      @additional_properties = additional_properties
      @_field_set = { "brand": brand, "afterpay_details": afterpay_details, "clearpay_details": clearpay_details }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BuyNowPayLaterDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::BuyNowPayLaterDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      brand = parsed_json["brand"]
      unless parsed_json["afterpay_details"].nil?
        afterpay_details = parsed_json["afterpay_details"].to_json
        afterpay_details = SquareApiClient::AfterpayDetails.from_json(json_object: afterpay_details)
      else
        afterpay_details = nil
      end
      unless parsed_json["clearpay_details"].nil?
        clearpay_details = parsed_json["clearpay_details"].to_json
        clearpay_details = SquareApiClient::ClearpayDetails.from_json(json_object: clearpay_details)
      else
        clearpay_details = nil
      end
      new(
        brand: brand,
        afterpay_details: afterpay_details,
        clearpay_details: clearpay_details,
        additional_properties: struct
      )
    end
# Serialize an instance of BuyNowPayLaterDetails to a JSON object
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
      obj.brand&.is_a?(String) != false || raise("Passed value for field obj.brand is not the expected type, validation failed.")
      obj.afterpay_details.nil? || SquareApiClient::AfterpayDetails.validate_raw(obj: obj.afterpay_details)
      obj.clearpay_details.nil? || SquareApiClient::ClearpayDetails.validate_raw(obj: obj.clearpay_details)
    end
  end
end