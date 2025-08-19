# frozen_string_literal: true
require_relative "customer"
require "ostruct"
require "json"

module SquareApiClient
# An object that contains the customer associated with the event.
  class CustomerUpdatedEventObject
  # @return [SquareApiClient::Customer] The updated customer.
    attr_reader :customer
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param customer [SquareApiClient::Customer] The updated customer.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CustomerUpdatedEventObject]
    def initialize(customer: OMIT, additional_properties: nil)
      @customer = customer if customer != OMIT
      @additional_properties = additional_properties
      @_field_set = { "customer": customer }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomerUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CustomerUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["customer"].nil?
        customer = parsed_json["customer"].to_json
        customer = SquareApiClient::Customer.from_json(json_object: customer)
      else
        customer = nil
      end
      new(customer: customer, additional_properties: struct)
    end
# Serialize an instance of CustomerUpdatedEventObject to a JSON object
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
      obj.customer.nil? || SquareApiClient::Customer.validate_raw(obj: obj.customer)
    end
  end
end