# frozen_string_literal: true
require_relative "error"
require_relative "payment"
require "ostruct"
require "json"

module SquareApiClient
# Defines the response returned
#  by[CompletePayment](api-endpoint:Payments-CompletePayment).
  class CompletePaymentResponse
  # @return [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    attr_reader :errors
  # @return [SquareApiClient::Payment] The successfully completed payment.
    attr_reader :payment
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    # @param payment [SquareApiClient::Payment] The successfully completed payment.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CompletePaymentResponse]
    def initialize(errors: OMIT, payment: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @payment = payment if payment != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "payment": payment }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CompletePaymentResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CompletePaymentResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["payment"].nil?
        payment = parsed_json["payment"].to_json
        payment = SquareApiClient::Payment.from_json(json_object: payment)
      else
        payment = nil
      end
      new(
        errors: errors,
        payment: payment,
        additional_properties: struct
      )
    end
# Serialize an instance of CompletePaymentResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.payment.nil? || SquareApiClient::Payment.validate_raw(obj: obj.payment)
    end
  end
end