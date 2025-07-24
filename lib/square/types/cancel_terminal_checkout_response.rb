# frozen_string_literal: true
require_relative "error"
require_relative "terminal_checkout"
require "ostruct"
require "json"

module SquareApiClient
  class CancelTerminalCheckoutResponse
  # @return [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    attr_reader :errors
  # @return [SquareApiClient::TerminalCheckout] The canceled `TerminalCheckout`.
    attr_reader :checkout
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    # @param checkout [SquareApiClient::TerminalCheckout] The canceled `TerminalCheckout`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CancelTerminalCheckoutResponse]
    def initialize(errors: OMIT, checkout: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @checkout = checkout if checkout != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "checkout": checkout }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CancelTerminalCheckoutResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CancelTerminalCheckoutResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["checkout"].nil?
        checkout = parsed_json["checkout"].to_json
        checkout = SquareApiClient::TerminalCheckout.from_json(json_object: checkout)
      else
        checkout = nil
      end
      new(
        errors: errors,
        checkout: checkout,
        additional_properties: struct
      )
    end
# Serialize an instance of CancelTerminalCheckoutResponse to a JSON object
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
      obj.checkout.nil? || SquareApiClient::TerminalCheckout.validate_raw(obj: obj.checkout)
    end
  end
end