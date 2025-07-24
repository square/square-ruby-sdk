# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Represents a contact of a [Vendor](entity:Vendor).
  class VendorContact
  # @return [String] A unique Square-generated ID for the [VendorContact](entity:VendorContact).
#  This field is required when attempting to update a
#  [VendorContact](entity:VendorContact).
    attr_reader :id
  # @return [String] The name of the [VendorContact](entity:VendorContact).
#  This field is required when attempting to create a [Vendor](entity:Vendor).
    attr_reader :name
  # @return [String] The email address of the [VendorContact](entity:VendorContact).
    attr_reader :email_address
  # @return [String] The phone number of the [VendorContact](entity:VendorContact).
    attr_reader :phone_number
  # @return [Boolean] The state of the [VendorContact](entity:VendorContact).
    attr_reader :removed
  # @return [Integer] The ordinal of the [VendorContact](entity:VendorContact).
    attr_reader :ordinal
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique Square-generated ID for the [VendorContact](entity:VendorContact).
#  This field is required when attempting to update a
#  [VendorContact](entity:VendorContact).
    # @param name [String] The name of the [VendorContact](entity:VendorContact).
#  This field is required when attempting to create a [Vendor](entity:Vendor).
    # @param email_address [String] The email address of the [VendorContact](entity:VendorContact).
    # @param phone_number [String] The phone number of the [VendorContact](entity:VendorContact).
    # @param removed [Boolean] The state of the [VendorContact](entity:VendorContact).
    # @param ordinal [Integer] The ordinal of the [VendorContact](entity:VendorContact).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::VendorContact]
    def initialize(id: OMIT, name: OMIT, email_address: OMIT, phone_number: OMIT, removed: OMIT, ordinal:, additional_properties: nil)
      @id = id if id != OMIT
      @name = name if name != OMIT
      @email_address = email_address if email_address != OMIT
      @phone_number = phone_number if phone_number != OMIT
      @removed = removed if removed != OMIT
      @ordinal = ordinal
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "email_address": email_address, "phone_number": phone_number, "removed": removed, "ordinal": ordinal }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of VendorContact
    #
    # @param json_object [String] 
    # @return [square.rb::VendorContact]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      email_address = parsed_json["email_address"]
      phone_number = parsed_json["phone_number"]
      removed = parsed_json["removed"]
      ordinal = parsed_json["ordinal"]
      new(
        id: id,
        name: name,
        email_address: email_address,
        phone_number: phone_number,
        removed: removed,
        ordinal: ordinal,
        additional_properties: struct
      )
    end
# Serialize an instance of VendorContact to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
      obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
      obj.removed&.is_a?(Boolean) != false || raise("Passed value for field obj.removed is not the expected type, validation failed.")
      obj.ordinal.is_a?(Integer) != false || raise("Passed value for field obj.ordinal is not the expected type, validation failed.")
    end
  end
end