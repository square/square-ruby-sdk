# frozen_string_literal: true
require_relative "error"
require_relative "payment"
require "ostruct"
require "json"

module square.rb
# Defines the response returned by
#  [UpdatePayment](api-endpoint:Payments-UpdatePayment).
  class UpdatePaymentResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [square.rb::Payment] The updated payment.
    attr_reader :payment
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param payment [square.rb::Payment] The updated payment.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::UpdatePaymentResponse]
    def initialize(errors: OMIT, payment: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @payment = payment if payment != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "payment": payment }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdatePaymentResponse
    #
    # @param json_object [String] 
    # @return [square.rb::UpdatePaymentResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["payment"].nil?
        payment = parsed_json["payment"].to_json
        payment = square.rb::Payment.from_json(json_object: payment)
      else
        payment = nil
      end
      new(
        errors: errors,
        payment: payment,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdatePaymentResponse to a JSON object
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
      obj.payment.nil? || square.rb::Payment.validate_raw(obj: obj.payment)
    end
  end
end