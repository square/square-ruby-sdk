# frozen_string_literal: true
require_relative "address"
require_relative "customer_tax_ids"
require "ostruct"
require "json"

module square.rb
# Defines the customer data provided in individual update requests for a
#  [BulkUpdateCustomers](api-endpoint:Customers-BulkUpdateCustomers) operation.
  class BulkUpdateCustomerData
  # @return [String] The given name (that is, the first name) associated with the customer profile.
    attr_reader :given_name
  # @return [String] The family name (that is, the last name) associated with the customer profile.
    attr_reader :family_name
  # @return [String] A business name associated with the customer profile.
    attr_reader :company_name
  # @return [String] A nickname for the customer profile.
    attr_reader :nickname
  # @return [String] The email address associated with the customer profile.
    attr_reader :email_address
  # @return [square.rb::Address] The physical address associated with the customer profile. For maximum length
#  constraints,
#  see [Customer
#  s://developer.squareup.com/docs/customers-api/use-the-api/keep-records#address).
#  The `first_name` and `last_name` fields are ignored if they are present in the
#  request.
    attr_reader :address
  # @return [String] The phone number associated with the customer profile. The phone number must be
#  valid
#  and can contain 9–16 digits, with an optional `+` prefix and country code. For
#  more information,
#  see [Customer phone
#  eveloper.squareup.com/docs/customers-api/use-the-api/keep-records#phone-number).
    attr_reader :phone_number
  # @return [String] An optional second ID used to associate the customer profile with an
#  entity in another system.
    attr_reader :reference_id
  # @return [String] An custom note associates with the customer profile.
    attr_reader :note
  # @return [String] The birthday associated with the customer profile, in `YYYY-MM-DD` or `MM-DD`
#  format.
#  For example, specify `1998-09-21` for September 21, 1998, or `09-21` for
#  September 21.
#  Birthdays are returned in `YYYY-MM-DD` format, where `YYYY` is the specified
#  birth year or
#  `0000` if a birth year is not specified.
    attr_reader :birthday
  # @return [square.rb::CustomerTaxIds] The tax ID associated with the customer profile. This field is available only
#  for
#  customers of sellers in EU countries or the United Kingdom. For more
#  information, see
#  [Customer tax
#  ttps://developer.squareup.com/docs/customers-api/what-it-does#customer-tax-ids).
    attr_reader :tax_ids
  # @return [Long] The current version of the customer profile.
#  As a best practice, you should include this field to enable
#  [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control.
    attr_reader :version
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param given_name [String] The given name (that is, the first name) associated with the customer profile.
    # @param family_name [String] The family name (that is, the last name) associated with the customer profile.
    # @param company_name [String] A business name associated with the customer profile.
    # @param nickname [String] A nickname for the customer profile.
    # @param email_address [String] The email address associated with the customer profile.
    # @param address [square.rb::Address] The physical address associated with the customer profile. For maximum length
#  constraints,
#  see [Customer
#  s://developer.squareup.com/docs/customers-api/use-the-api/keep-records#address).
#  The `first_name` and `last_name` fields are ignored if they are present in the
#  request.
    # @param phone_number [String] The phone number associated with the customer profile. The phone number must be
#  valid
#  and can contain 9–16 digits, with an optional `+` prefix and country code. For
#  more information,
#  see [Customer phone
#  eveloper.squareup.com/docs/customers-api/use-the-api/keep-records#phone-number).
    # @param reference_id [String] An optional second ID used to associate the customer profile with an
#  entity in another system.
    # @param note [String] An custom note associates with the customer profile.
    # @param birthday [String] The birthday associated with the customer profile, in `YYYY-MM-DD` or `MM-DD`
#  format.
#  For example, specify `1998-09-21` for September 21, 1998, or `09-21` for
#  September 21.
#  Birthdays are returned in `YYYY-MM-DD` format, where `YYYY` is the specified
#  birth year or
#  `0000` if a birth year is not specified.
    # @param tax_ids [square.rb::CustomerTaxIds] The tax ID associated with the customer profile. This field is available only
#  for
#  customers of sellers in EU countries or the United Kingdom. For more
#  information, see
#  [Customer tax
#  ttps://developer.squareup.com/docs/customers-api/what-it-does#customer-tax-ids).
    # @param version [Long] The current version of the customer profile.
#  As a best practice, you should include this field to enable
#  [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BulkUpdateCustomerData]
    def initialize(given_name: OMIT, family_name: OMIT, company_name: OMIT, nickname: OMIT, email_address: OMIT, address: OMIT, phone_number: OMIT, reference_id: OMIT, note: OMIT, birthday: OMIT, tax_ids: OMIT, version: OMIT, additional_properties: nil)
      @given_name = given_name if given_name != OMIT
      @family_name = family_name if family_name != OMIT
      @company_name = company_name if company_name != OMIT
      @nickname = nickname if nickname != OMIT
      @email_address = email_address if email_address != OMIT
      @address = address if address != OMIT
      @phone_number = phone_number if phone_number != OMIT
      @reference_id = reference_id if reference_id != OMIT
      @note = note if note != OMIT
      @birthday = birthday if birthday != OMIT
      @tax_ids = tax_ids if tax_ids != OMIT
      @version = version if version != OMIT
      @additional_properties = additional_properties
      @_field_set = { "given_name": given_name, "family_name": family_name, "company_name": company_name, "nickname": nickname, "email_address": email_address, "address": address, "phone_number": phone_number, "reference_id": reference_id, "note": note, "birthday": birthday, "tax_ids": tax_ids, "version": version }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BulkUpdateCustomerData
    #
    # @param json_object [String] 
    # @return [square.rb::BulkUpdateCustomerData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      given_name = parsed_json["given_name"]
      family_name = parsed_json["family_name"]
      company_name = parsed_json["company_name"]
      nickname = parsed_json["nickname"]
      email_address = parsed_json["email_address"]
      unless parsed_json["address"].nil?
        address = parsed_json["address"].to_json
        address = square.rb::Address.from_json(json_object: address)
      else
        address = nil
      end
      phone_number = parsed_json["phone_number"]
      reference_id = parsed_json["reference_id"]
      note = parsed_json["note"]
      birthday = parsed_json["birthday"]
      unless parsed_json["tax_ids"].nil?
        tax_ids = parsed_json["tax_ids"].to_json
        tax_ids = square.rb::CustomerTaxIds.from_json(json_object: tax_ids)
      else
        tax_ids = nil
      end
      version = parsed_json["version"]
      new(
        given_name: given_name,
        family_name: family_name,
        company_name: company_name,
        nickname: nickname,
        email_address: email_address,
        address: address,
        phone_number: phone_number,
        reference_id: reference_id,
        note: note,
        birthday: birthday,
        tax_ids: tax_ids,
        version: version,
        additional_properties: struct
      )
    end
# Serialize an instance of BulkUpdateCustomerData to a JSON object
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
      obj.given_name&.is_a?(String) != false || raise("Passed value for field obj.given_name is not the expected type, validation failed.")
      obj.family_name&.is_a?(String) != false || raise("Passed value for field obj.family_name is not the expected type, validation failed.")
      obj.company_name&.is_a?(String) != false || raise("Passed value for field obj.company_name is not the expected type, validation failed.")
      obj.nickname&.is_a?(String) != false || raise("Passed value for field obj.nickname is not the expected type, validation failed.")
      obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
      obj.address.nil? || square.rb::Address.validate_raw(obj: obj.address)
      obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
      obj.reference_id&.is_a?(String) != false || raise("Passed value for field obj.reference_id is not the expected type, validation failed.")
      obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
      obj.birthday&.is_a?(String) != false || raise("Passed value for field obj.birthday is not the expected type, validation failed.")
      obj.tax_ids.nil? || square.rb::CustomerTaxIds.validate_raw(obj: obj.tax_ids)
      obj.version&.is_a?(Long) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
    end
  end
end