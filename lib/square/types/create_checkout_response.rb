# frozen_string_literal: true
require_relative "checkout"
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Defines the fields that are included in the response body of
#  a request to the `CreateCheckout` endpoint.
  class CreateCheckoutResponse
  # @return [square.rb::Checkout] The newly created `checkout` object associated with the provided idempotency
#  key.
    attr_reader :checkout
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param checkout [square.rb::Checkout] The newly created `checkout` object associated with the provided idempotency
#  key.
    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CreateCheckoutResponse]
    def initialize(checkout: OMIT, errors: OMIT, additional_properties: nil)
      @checkout = checkout if checkout != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "checkout": checkout, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateCheckoutResponse
    #
    # @param json_object [String] 
    # @return [square.rb::CreateCheckoutResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["checkout"].nil?
        checkout = parsed_json["checkout"].to_json
        checkout = square.rb::Checkout.from_json(json_object: checkout)
      else
        checkout = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        checkout: checkout,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateCheckoutResponse to a JSON object
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
      obj.checkout.nil? || square.rb::Checkout.validate_raw(obj: obj.checkout)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end