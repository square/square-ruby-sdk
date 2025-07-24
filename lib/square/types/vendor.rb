# frozen_string_literal: true
require_relative "address"
require_relative "vendor_contact"
require_relative "vendor_status"
require "ostruct"
require "json"

module square.rb
# Represents a supplier to a seller.
  class Vendor
  # @return [String] A unique Square-generated ID for the [Vendor](entity:Vendor).
#  This field is required when attempting to update a [Vendor](entity:Vendor).
    attr_reader :id
  # @return [String] An RFC 3339-formatted timestamp that indicates when the
#  [Vendor](entity:Vendor) was created.
    attr_reader :created_at
  # @return [String] An RFC 3339-formatted timestamp that indicates when the
#  [Vendor](entity:Vendor) was last updated.
    attr_reader :updated_at
  # @return [String] The name of the [Vendor](entity:Vendor).
#  This field is required when attempting to create or update a
#  [Vendor](entity:Vendor).
    attr_reader :name
  # @return [square.rb::Address] The address of the [Vendor](entity:Vendor).
    attr_reader :address
  # @return [Array<square.rb::VendorContact>] The contacts of the [Vendor](entity:Vendor).
    attr_reader :contacts
  # @return [String] The account number of the [Vendor](entity:Vendor).
    attr_reader :account_number
  # @return [String] A note detailing information about the [Vendor](entity:Vendor).
    attr_reader :note
  # @return [Integer] The version of the [Vendor](entity:Vendor).
    attr_reader :version
  # @return [square.rb::VendorStatus] The status of the [Vendor](entity:Vendor).
#  See [Status](#type-status) for possible values
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique Square-generated ID for the [Vendor](entity:Vendor).
#  This field is required when attempting to update a [Vendor](entity:Vendor).
    # @param created_at [String] An RFC 3339-formatted timestamp that indicates when the
#  [Vendor](entity:Vendor) was created.
    # @param updated_at [String] An RFC 3339-formatted timestamp that indicates when the
#  [Vendor](entity:Vendor) was last updated.
    # @param name [String] The name of the [Vendor](entity:Vendor).
#  This field is required when attempting to create or update a
#  [Vendor](entity:Vendor).
    # @param address [square.rb::Address] The address of the [Vendor](entity:Vendor).
    # @param contacts [Array<square.rb::VendorContact>] The contacts of the [Vendor](entity:Vendor).
    # @param account_number [String] The account number of the [Vendor](entity:Vendor).
    # @param note [String] A note detailing information about the [Vendor](entity:Vendor).
    # @param version [Integer] The version of the [Vendor](entity:Vendor).
    # @param status [square.rb::VendorStatus] The status of the [Vendor](entity:Vendor).
#  See [Status](#type-status) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::Vendor]
    def initialize(id: OMIT, created_at: OMIT, updated_at: OMIT, name: OMIT, address: OMIT, contacts: OMIT, account_number: OMIT, note: OMIT, version: OMIT, status: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @name = name if name != OMIT
      @address = address if address != OMIT
      @contacts = contacts if contacts != OMIT
      @account_number = account_number if account_number != OMIT
      @note = note if note != OMIT
      @version = version if version != OMIT
      @status = status if status != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "name": name, "address": address, "contacts": contacts, "account_number": account_number, "note": note, "version": version, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Vendor
    #
    # @param json_object [String] 
    # @return [square.rb::Vendor]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      name = parsed_json["name"]
      unless parsed_json["address"].nil?
        address = parsed_json["address"].to_json
        address = square.rb::Address.from_json(json_object: address)
      else
        address = nil
      end
      contacts = parsed_json["contacts"]&.map do | item |
  item = item.to_json
  square.rb::VendorContact.from_json(json_object: item)
end
      account_number = parsed_json["account_number"]
      note = parsed_json["note"]
      version = parsed_json["version"]
      status = parsed_json["status"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        address: address,
        contacts: contacts,
        account_number: account_number,
        note: note,
        version: version,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of Vendor to a JSON object
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
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.address.nil? || square.rb::Address.validate_raw(obj: obj.address)
      obj.contacts&.is_a?(Array) != false || raise("Passed value for field obj.contacts is not the expected type, validation failed.")
      obj.account_number&.is_a?(String) != false || raise("Passed value for field obj.account_number is not the expected type, validation failed.")
      obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
      obj.version&.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.status&.is_a?(square.rb::VendorStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end