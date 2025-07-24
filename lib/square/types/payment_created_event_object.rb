# frozen_string_literal: true
require_relative "payment"
require "ostruct"
require "json"

module SquareApiClient
  class PaymentCreatedEventObject
  # @return [SquareApiClient::Payment] The created payment.
    attr_reader :payment
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param payment [SquareApiClient::Payment] The created payment.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::PaymentCreatedEventObject]
    def initialize(payment: OMIT, additional_properties: nil)
      @payment = payment if payment != OMIT
      @additional_properties = additional_properties
      @_field_set = { "payment": payment }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PaymentCreatedEventObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::PaymentCreatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["payment"].nil?
        payment = parsed_json["payment"].to_json
        payment = SquareApiClient::Payment.from_json(json_object: payment)
      else
        payment = nil
      end
      new(payment: payment, additional_properties: struct)
    end
# Serialize an instance of PaymentCreatedEventObject to a JSON object
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
      obj.payment.nil? || SquareApiClient::Payment.validate_raw(obj: obj.payment)
    end
  end
end