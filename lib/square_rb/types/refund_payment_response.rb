# frozen_string_literal: true
require_relative "error"
require_relative "payment_refund"
require "ostruct"
require "json"

module SquareApiClient
# Defines the response returned by
#  [RefundPayment](api-endpoint:Refunds-RefundPayment).
#  If there are errors processing the request, the `refund` field might not be
#  present, or it might be present with a status of `FAILED`.
  class RefundPaymentResponse
  # @return [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    attr_reader :errors
  # @return [SquareApiClient::PaymentRefund] The successfully created `PaymentRefund`.
    attr_reader :refund
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    # @param refund [SquareApiClient::PaymentRefund] The successfully created `PaymentRefund`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::RefundPaymentResponse]
    def initialize(errors: OMIT, refund: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @refund = refund if refund != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "refund": refund }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of RefundPaymentResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::RefundPaymentResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["refund"].nil?
        refund = parsed_json["refund"].to_json
        refund = SquareApiClient::PaymentRefund.from_json(json_object: refund)
      else
        refund = nil
      end
      new(
        errors: errors,
        refund: refund,
        additional_properties: struct
      )
    end
# Serialize an instance of RefundPaymentResponse to a JSON object
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
      obj.refund.nil? || SquareApiClient::PaymentRefund.validate_raw(obj: obj.refund)
    end
  end
end