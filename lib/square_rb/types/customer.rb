# frozen_string_literal: true
require_relative "address"
require_relative "customer_preferences"
require_relative "customer_creation_source"
require_relative "customer_tax_ids"
require "ostruct"
require "json"

module SquareApiClient
# Represents a Square customer profile in the Customer Directory of a Square
#  seller.
  class Customer
  # @return [String] A unique Square-assigned ID for the customer profile.
#  If you need this ID for an API request, use the ID returned when you created the
#  customer profile or call the
#  [SearchCustomers](api-endpoint:Customers-SearchCustomers)
#  or [ListCustomers](api-endpoint:Customers-ListCustomers) endpoint.
    attr_reader :id
  # @return [String] The timestamp when the customer profile was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The timestamp when the customer profile was last updated, in RFC 3339 format.
    attr_reader :updated_at
  # @return [String] The given name (that is, the first name) associated with the customer profile.
    attr_reader :given_name
  # @return [String] The family name (that is, the last name) associated with the customer profile.
    attr_reader :family_name
  # @return [String] A nickname for the customer profile.
    attr_reader :nickname
  # @return [String] A business name associated with the customer profile.
    attr_reader :company_name
  # @return [String] The email address associated with the customer profile.
    attr_reader :email_address
  # @return [SquareApiClient::Address] The physical address associated with the customer profile.
    attr_reader :address
  # @return [String] The phone number associated with the customer profile.
    attr_reader :phone_number
  # @return [String] The birthday associated with the customer profile, in `YYYY-MM-DD` format. For
#  example, `1998-09-21`
#  represents September 21, 1998, and `0000-09-21` represents September 21 (without
#  a birth year).
    attr_reader :birthday
  # @return [String] An optional second ID used to associate the customer profile with an
#  entity in another system.
    attr_reader :reference_id
  # @return [String] A custom note associated with the customer profile.
    attr_reader :note
  # @return [SquareApiClient::CustomerPreferences] Represents general customer preferences.
    attr_reader :preferences
  # @return [SquareApiClient::CustomerCreationSource] The method used to create the customer profile.
#  See [CustomerCreationSource](#type-customercreationsource) for possible values
    attr_reader :creation_source
  # @return [Array<String>] The IDs of [customer groups](entity:CustomerGroup) the customer belongs to.
    attr_reader :group_ids
  # @return [Array<String>] The IDs of [customer segments](entity:CustomerSegment) the customer belongs to.
    attr_reader :segment_ids
  # @return [Long] The Square-assigned version number of the customer profile. The version number
#  is incremented each time an update is committed to the customer profile, except
#  for changes to customer segment membership.
    attr_reader :version
  # @return [SquareApiClient::CustomerTaxIds] The tax ID associated with the customer profile. This field is present only for
#  customers of sellers in EU countries or the United Kingdom.
#  For more information, see [Customer tax
#  ttps://developer.squareup.com/docs/customers-api/what-it-does#customer-tax-ids).
    attr_reader :tax_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique Square-assigned ID for the customer profile.
#  If you need this ID for an API request, use the ID returned when you created the
#  customer profile or call the
#  [SearchCustomers](api-endpoint:Customers-SearchCustomers)
#  or [ListCustomers](api-endpoint:Customers-ListCustomers) endpoint.
    # @param created_at [String] The timestamp when the customer profile was created, in RFC 3339 format.
    # @param updated_at [String] The timestamp when the customer profile was last updated, in RFC 3339 format.
    # @param given_name [String] The given name (that is, the first name) associated with the customer profile.
    # @param family_name [String] The family name (that is, the last name) associated with the customer profile.
    # @param nickname [String] A nickname for the customer profile.
    # @param company_name [String] A business name associated with the customer profile.
    # @param email_address [String] The email address associated with the customer profile.
    # @param address [SquareApiClient::Address] The physical address associated with the customer profile.
    # @param phone_number [String] The phone number associated with the customer profile.
    # @param birthday [String] The birthday associated with the customer profile, in `YYYY-MM-DD` format. For
#  example, `1998-09-21`
#  represents September 21, 1998, and `0000-09-21` represents September 21 (without
#  a birth year).
    # @param reference_id [String] An optional second ID used to associate the customer profile with an
#  entity in another system.
    # @param note [String] A custom note associated with the customer profile.
    # @param preferences [SquareApiClient::CustomerPreferences] Represents general customer preferences.
    # @param creation_source [SquareApiClient::CustomerCreationSource] The method used to create the customer profile.
#  See [CustomerCreationSource](#type-customercreationsource) for possible values
    # @param group_ids [Array<String>] The IDs of [customer groups](entity:CustomerGroup) the customer belongs to.
    # @param segment_ids [Array<String>] The IDs of [customer segments](entity:CustomerSegment) the customer belongs to.
    # @param version [Long] The Square-assigned version number of the customer profile. The version number
#  is incremented each time an update is committed to the customer profile, except
#  for changes to customer segment membership.
    # @param tax_ids [SquareApiClient::CustomerTaxIds] The tax ID associated with the customer profile. This field is present only for
#  customers of sellers in EU countries or the United Kingdom.
#  For more information, see [Customer tax
#  ttps://developer.squareup.com/docs/customers-api/what-it-does#customer-tax-ids).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::Customer]
    def initialize(id: OMIT, created_at: OMIT, updated_at: OMIT, given_name: OMIT, family_name: OMIT, nickname: OMIT, company_name: OMIT, email_address: OMIT, address: OMIT, phone_number: OMIT, birthday: OMIT, reference_id: OMIT, note: OMIT, preferences: OMIT, creation_source: OMIT, group_ids: OMIT, segment_ids: OMIT, version: OMIT, tax_ids: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @given_name = given_name if given_name != OMIT
      @family_name = family_name if family_name != OMIT
      @nickname = nickname if nickname != OMIT
      @company_name = company_name if company_name != OMIT
      @email_address = email_address if email_address != OMIT
      @address = address if address != OMIT
      @phone_number = phone_number if phone_number != OMIT
      @birthday = birthday if birthday != OMIT
      @reference_id = reference_id if reference_id != OMIT
      @note = note if note != OMIT
      @preferences = preferences if preferences != OMIT
      @creation_source = creation_source if creation_source != OMIT
      @group_ids = group_ids if group_ids != OMIT
      @segment_ids = segment_ids if segment_ids != OMIT
      @version = version if version != OMIT
      @tax_ids = tax_ids if tax_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "given_name": given_name, "family_name": family_name, "nickname": nickname, "company_name": company_name, "email_address": email_address, "address": address, "phone_number": phone_number, "birthday": birthday, "reference_id": reference_id, "note": note, "preferences": preferences, "creation_source": creation_source, "group_ids": group_ids, "segment_ids": segment_ids, "version": version, "tax_ids": tax_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Customer
    #
    # @param json_object [String] 
    # @return [SquareApiClient::Customer]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      given_name = parsed_json["given_name"]
      family_name = parsed_json["family_name"]
      nickname = parsed_json["nickname"]
      company_name = parsed_json["company_name"]
      email_address = parsed_json["email_address"]
      unless parsed_json["address"].nil?
        address = parsed_json["address"].to_json
        address = SquareApiClient::Address.from_json(json_object: address)
      else
        address = nil
      end
      phone_number = parsed_json["phone_number"]
      birthday = parsed_json["birthday"]
      reference_id = parsed_json["reference_id"]
      note = parsed_json["note"]
      unless parsed_json["preferences"].nil?
        preferences = parsed_json["preferences"].to_json
        preferences = SquareApiClient::CustomerPreferences.from_json(json_object: preferences)
      else
        preferences = nil
      end
      creation_source = parsed_json["creation_source"]
      group_ids = parsed_json["group_ids"]
      segment_ids = parsed_json["segment_ids"]
      version = parsed_json["version"]
      unless parsed_json["tax_ids"].nil?
        tax_ids = parsed_json["tax_ids"].to_json
        tax_ids = SquareApiClient::CustomerTaxIds.from_json(json_object: tax_ids)
      else
        tax_ids = nil
      end
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        given_name: given_name,
        family_name: family_name,
        nickname: nickname,
        company_name: company_name,
        email_address: email_address,
        address: address,
        phone_number: phone_number,
        birthday: birthday,
        reference_id: reference_id,
        note: note,
        preferences: preferences,
        creation_source: creation_source,
        group_ids: group_ids,
        segment_ids: segment_ids,
        version: version,
        tax_ids: tax_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of Customer to a JSON object
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
      obj.given_name&.is_a?(String) != false || raise("Passed value for field obj.given_name is not the expected type, validation failed.")
      obj.family_name&.is_a?(String) != false || raise("Passed value for field obj.family_name is not the expected type, validation failed.")
      obj.nickname&.is_a?(String) != false || raise("Passed value for field obj.nickname is not the expected type, validation failed.")
      obj.company_name&.is_a?(String) != false || raise("Passed value for field obj.company_name is not the expected type, validation failed.")
      obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
      obj.address.nil? || SquareApiClient::Address.validate_raw(obj: obj.address)
      obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
      obj.birthday&.is_a?(String) != false || raise("Passed value for field obj.birthday is not the expected type, validation failed.")
      obj.reference_id&.is_a?(String) != false || raise("Passed value for field obj.reference_id is not the expected type, validation failed.")
      obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
      obj.preferences.nil? || SquareApiClient::CustomerPreferences.validate_raw(obj: obj.preferences)
      obj.creation_source&.is_a?(SquareApiClient::CustomerCreationSource) != false || raise("Passed value for field obj.creation_source is not the expected type, validation failed.")
      obj.group_ids&.is_a?(Array) != false || raise("Passed value for field obj.group_ids is not the expected type, validation failed.")
      obj.segment_ids&.is_a?(Array) != false || raise("Passed value for field obj.segment_ids is not the expected type, validation failed.")
      obj.version&.is_a?(Long) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.tax_ids.nil? || SquareApiClient::CustomerTaxIds.validate_raw(obj: obj.tax_ids)
    end
  end
end