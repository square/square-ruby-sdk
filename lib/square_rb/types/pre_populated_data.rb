# frozen_string_literal: true
require_relative "address"
require "ostruct"
require "json"

module SquareApiClient
# Describes buyer data to prepopulate in the payment form.
#  For more information,
#  see [Optional Checkout
#  ps://developer.squareup.com/docs/checkout-api/optional-checkout-configurations).
  class PrePopulatedData
  # @return [String] The buyer email to prepopulate in the payment form.
    attr_reader :buyer_email
  # @return [String] The buyer phone number to prepopulate in the payment form.
    attr_reader :buyer_phone_number
  # @return [SquareApiClient::Address] The buyer address to prepopulate in the payment form.
    attr_reader :buyer_address
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param buyer_email [String] The buyer email to prepopulate in the payment form.
    # @param buyer_phone_number [String] The buyer phone number to prepopulate in the payment form.
    # @param buyer_address [SquareApiClient::Address] The buyer address to prepopulate in the payment form.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::PrePopulatedData]
    def initialize(buyer_email: OMIT, buyer_phone_number: OMIT, buyer_address: OMIT, additional_properties: nil)
      @buyer_email = buyer_email if buyer_email != OMIT
      @buyer_phone_number = buyer_phone_number if buyer_phone_number != OMIT
      @buyer_address = buyer_address if buyer_address != OMIT
      @additional_properties = additional_properties
      @_field_set = { "buyer_email": buyer_email, "buyer_phone_number": buyer_phone_number, "buyer_address": buyer_address }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PrePopulatedData
    #
    # @param json_object [String] 
    # @return [SquareApiClient::PrePopulatedData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      buyer_email = parsed_json["buyer_email"]
      buyer_phone_number = parsed_json["buyer_phone_number"]
      unless parsed_json["buyer_address"].nil?
        buyer_address = parsed_json["buyer_address"].to_json
        buyer_address = SquareApiClient::Address.from_json(json_object: buyer_address)
      else
        buyer_address = nil
      end
      new(
        buyer_email: buyer_email,
        buyer_phone_number: buyer_phone_number,
        buyer_address: buyer_address,
        additional_properties: struct
      )
    end
# Serialize an instance of PrePopulatedData to a JSON object
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
      obj.buyer_email&.is_a?(String) != false || raise("Passed value for field obj.buyer_email is not the expected type, validation failed.")
      obj.buyer_phone_number&.is_a?(String) != false || raise("Passed value for field obj.buyer_phone_number is not the expected type, validation failed.")
      obj.buyer_address.nil? || SquareApiClient::Address.validate_raw(obj: obj.buyer_address)
    end
  end
end