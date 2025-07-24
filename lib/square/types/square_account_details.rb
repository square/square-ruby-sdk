# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Additional details about Square Account payments.
  class SquareAccountDetails
  # @return [String] Unique identifier for the payment source used for this payment.
    attr_reader :payment_source_token
  # @return [Array<square.rb::Error>] Information about errors encountered during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param payment_source_token [String] Unique identifier for the payment source used for this payment.
    # @param errors [Array<square.rb::Error>] Information about errors encountered during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SquareAccountDetails]
    def initialize(payment_source_token: OMIT, errors: OMIT, additional_properties: nil)
      @payment_source_token = payment_source_token if payment_source_token != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "payment_source_token": payment_source_token, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SquareAccountDetails
    #
    # @param json_object [String] 
    # @return [square.rb::SquareAccountDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      payment_source_token = parsed_json["payment_source_token"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        payment_source_token: payment_source_token,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of SquareAccountDetails to a JSON object
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
      obj.payment_source_token&.is_a?(String) != false || raise("Passed value for field obj.payment_source_token is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end