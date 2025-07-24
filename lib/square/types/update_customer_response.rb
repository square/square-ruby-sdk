# frozen_string_literal: true
require_relative "error"
require_relative "customer"
require "ostruct"
require "json"

module square.rb
# Defines the fields that are included in the response body of
#  a request to the [UpdateCustomer](api-endpoint:Customers-UpdateCustomer) or
#  [BulkUpdateCustomers](api-endpoint:Customers-BulkUpdateCustomers) endpoint.
#  Either `errors` or `customer` is present in a given response (never both).
  class UpdateCustomerResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [square.rb::Customer] The updated customer.
    attr_reader :customer
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param customer [square.rb::Customer] The updated customer.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::UpdateCustomerResponse]
    def initialize(errors: OMIT, customer: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @customer = customer if customer != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "customer": customer }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateCustomerResponse
    #
    # @param json_object [String] 
    # @return [square.rb::UpdateCustomerResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["customer"].nil?
        customer = parsed_json["customer"].to_json
        customer = square.rb::Customer.from_json(json_object: customer)
      else
        customer = nil
      end
      new(
        errors: errors,
        customer: customer,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateCustomerResponse to a JSON object
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
      obj.customer.nil? || square.rb::Customer.validate_raw(obj: obj.customer)
    end
  end
end