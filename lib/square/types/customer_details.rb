# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Details about the customer making the payment.
  class CustomerDetails
  # @return [Boolean] Indicates whether the customer initiated the payment.
    attr_reader :customer_initiated
  # @return [Boolean] Indicates that the seller keyed in payment details on behalf of the customer.
#  This is used to flag a payment as Mail Order / Telephone Order (MOTO).
    attr_reader :seller_keyed_in
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param customer_initiated [Boolean] Indicates whether the customer initiated the payment.
    # @param seller_keyed_in [Boolean] Indicates that the seller keyed in payment details on behalf of the customer.
#  This is used to flag a payment as Mail Order / Telephone Order (MOTO).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CustomerDetails]
    def initialize(customer_initiated: OMIT, seller_keyed_in: OMIT, additional_properties: nil)
      @customer_initiated = customer_initiated if customer_initiated != OMIT
      @seller_keyed_in = seller_keyed_in if seller_keyed_in != OMIT
      @additional_properties = additional_properties
      @_field_set = { "customer_initiated": customer_initiated, "seller_keyed_in": seller_keyed_in }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomerDetails
    #
    # @param json_object [String] 
    # @return [square.rb::CustomerDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      customer_initiated = parsed_json["customer_initiated"]
      seller_keyed_in = parsed_json["seller_keyed_in"]
      new(
        customer_initiated: customer_initiated,
        seller_keyed_in: seller_keyed_in,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomerDetails to a JSON object
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
      obj.customer_initiated&.is_a?(Boolean) != false || raise("Passed value for field obj.customer_initiated is not the expected type, validation failed.")
      obj.seller_keyed_in&.is_a?(Boolean) != false || raise("Passed value for field obj.seller_keyed_in is not the expected type, validation failed.")
    end
  end
end