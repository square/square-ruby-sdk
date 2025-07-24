# frozen_string_literal: true
require_relative "error"
require_relative "payment_link"
require "ostruct"
require "json"

module SquareApiClient
  class GetPaymentLinkResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [SquareApiClient::PaymentLink] The payment link that is retrieved.
    attr_reader :payment_link
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param payment_link [SquareApiClient::PaymentLink] The payment link that is retrieved.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GetPaymentLinkResponse]
    def initialize(errors: OMIT, payment_link: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @payment_link = payment_link if payment_link != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "payment_link": payment_link }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetPaymentLinkResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GetPaymentLinkResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["payment_link"].nil?
        payment_link = parsed_json["payment_link"].to_json
        payment_link = SquareApiClient::PaymentLink.from_json(json_object: payment_link)
      else
        payment_link = nil
      end
      new(
        errors: errors,
        payment_link: payment_link,
        additional_properties: struct
      )
    end
# Serialize an instance of GetPaymentLinkResponse to a JSON object
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
      obj.payment_link.nil? || SquareApiClient::PaymentLink.validate_raw(obj: obj.payment_link)
    end
  end
end