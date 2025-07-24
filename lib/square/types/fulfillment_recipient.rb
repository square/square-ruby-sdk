# frozen_string_literal: true
require_relative "address"
require "ostruct"
require "json"

module SquareApiClient
# Information about the fulfillment recipient.
  class FulfillmentRecipient
  # @return [String] The ID of the customer associated with the fulfillment.
#  If `customer_id` is provided, the fulfillment recipient's `display_name`,
#  `email_address`, and `phone_number` are automatically populated from the
#  targeted customer profile. If these fields are set in the request, the request
#  values override the information from the customer profile. If the
#  targeted customer profile does not contain the necessary information and
#  these fields are left unset, the request results in an error.
    attr_reader :customer_id
  # @return [String] The display name of the fulfillment recipient. This field is required.
#  If provided, the display name overrides the corresponding customer profile value
#  indicated by `customer_id`.
    attr_reader :display_name
  # @return [String] The email address of the fulfillment recipient.
#  If provided, the email address overrides the corresponding customer profile
#  value
#  indicated by `customer_id`.
    attr_reader :email_address
  # @return [String] The phone number of the fulfillment recipient. This field is required.
#  If provided, the phone number overrides the corresponding customer profile value
#  indicated by `customer_id`.
    attr_reader :phone_number
  # @return [SquareApiClient::Address] The address of the fulfillment recipient. This field is required.
#  If provided, the address overrides the corresponding customer profile value
#  indicated by `customer_id`.
    attr_reader :address
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param customer_id [String] The ID of the customer associated with the fulfillment.
#  If `customer_id` is provided, the fulfillment recipient's `display_name`,
#  `email_address`, and `phone_number` are automatically populated from the
#  targeted customer profile. If these fields are set in the request, the request
#  values override the information from the customer profile. If the
#  targeted customer profile does not contain the necessary information and
#  these fields are left unset, the request results in an error.
    # @param display_name [String] The display name of the fulfillment recipient. This field is required.
#  If provided, the display name overrides the corresponding customer profile value
#  indicated by `customer_id`.
    # @param email_address [String] The email address of the fulfillment recipient.
#  If provided, the email address overrides the corresponding customer profile
#  value
#  indicated by `customer_id`.
    # @param phone_number [String] The phone number of the fulfillment recipient. This field is required.
#  If provided, the phone number overrides the corresponding customer profile value
#  indicated by `customer_id`.
    # @param address [SquareApiClient::Address] The address of the fulfillment recipient. This field is required.
#  If provided, the address overrides the corresponding customer profile value
#  indicated by `customer_id`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::FulfillmentRecipient]
    def initialize(customer_id: OMIT, display_name: OMIT, email_address: OMIT, phone_number: OMIT, address: OMIT, additional_properties: nil)
      @customer_id = customer_id if customer_id != OMIT
      @display_name = display_name if display_name != OMIT
      @email_address = email_address if email_address != OMIT
      @phone_number = phone_number if phone_number != OMIT
      @address = address if address != OMIT
      @additional_properties = additional_properties
      @_field_set = { "customer_id": customer_id, "display_name": display_name, "email_address": email_address, "phone_number": phone_number, "address": address }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FulfillmentRecipient
    #
    # @param json_object [String] 
    # @return [SquareApiClient::FulfillmentRecipient]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      customer_id = parsed_json["customer_id"]
      display_name = parsed_json["display_name"]
      email_address = parsed_json["email_address"]
      phone_number = parsed_json["phone_number"]
      unless parsed_json["address"].nil?
        address = parsed_json["address"].to_json
        address = SquareApiClient::Address.from_json(json_object: address)
      else
        address = nil
      end
      new(
        customer_id: customer_id,
        display_name: display_name,
        email_address: email_address,
        phone_number: phone_number,
        address: address,
        additional_properties: struct
      )
    end
# Serialize an instance of FulfillmentRecipient to a JSON object
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
      obj.customer_id&.is_a?(String) != false || raise("Passed value for field obj.customer_id is not the expected type, validation failed.")
      obj.display_name&.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
      obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
      obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
      obj.address.nil? || SquareApiClient::Address.validate_raw(obj: obj.address)
    end
  end
end