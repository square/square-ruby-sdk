# frozen_string_literal: true
require_relative "country"
require_relative "currency"
require_relative "bank_account_type"
require_relative "bank_account_status"
require "ostruct"
require "json"

module SquareApiClient
# Represents a bank account. For more information about
#  linking a bank account to a Square account, see
#  [Bank Accounts API](https://developer.squareup.com/docs/bank-accounts-api).
  class BankAccount
  # @return [String] The unique, Square-issued identifier for the bank account.
    attr_reader :id
  # @return [String] The last few digits of the account number.
    attr_reader :account_number_suffix
  # @return [SquareApiClient::Country] The ISO 3166 Alpha-2 country code where the bank account is based.
#  See [Country](#type-country) for possible values
    attr_reader :country
  # @return [SquareApiClient::Currency] The 3-character ISO 4217 currency code indicating the operating
#  currency of the bank account. For example, the currency code for US dollars
#  is `USD`.
#  See [Currency](#type-currency) for possible values
    attr_reader :currency
  # @return [SquareApiClient::BankAccountType] The financial purpose of the associated bank account.
#  See [BankAccountType](#type-bankaccounttype) for possible values
    attr_reader :account_type
  # @return [String] Name of the account holder. This name must match the name
#  on the targeted bank account record.
    attr_reader :holder_name
  # @return [String] Primary identifier for the bank. For more information, see
#  [Bank Accounts API](https://developer.squareup.com/docs/bank-accounts-api).
    attr_reader :primary_bank_identification_number
  # @return [String] Secondary identifier for the bank. For more information, see
#  [Bank Accounts API](https://developer.squareup.com/docs/bank-accounts-api).
    attr_reader :secondary_bank_identification_number
  # @return [String] Reference identifier that will be displayed to UK bank account owners
#  when collecting direct debit authorization. Only required for UK bank accounts.
    attr_reader :debit_mandate_reference_id
  # @return [String] Client-provided identifier for linking the banking account to an entity
#  in a third-party system (for example, a bank account number or a user
#  identifier).
    attr_reader :reference_id
  # @return [String] The location to which the bank account belongs.
    attr_reader :location_id
  # @return [SquareApiClient::BankAccountStatus] Read-only. The current verification status of this BankAccount object.
#  See [BankAccountStatus](#type-bankaccountstatus) for possible values
    attr_reader :status
  # @return [Boolean] Indicates whether it is possible for Square to send money to this bank account.
    attr_reader :creditable
  # @return [Boolean] Indicates whether it is possible for Square to take money from this
#  bank account.
    attr_reader :debitable
  # @return [String] A Square-assigned, unique identifier for the bank account based on the
#  account information. The account fingerprint can be used to compare account
#  entries and determine if the they represent the same real-world bank account.
    attr_reader :fingerprint
  # @return [Integer] The current version of the `BankAccount`.
    attr_reader :version
  # @return [String] Read only. Name of actual financial institution.
#  For example "Bank of America".
    attr_reader :bank_name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The unique, Square-issued identifier for the bank account.
    # @param account_number_suffix [String] The last few digits of the account number.
    # @param country [SquareApiClient::Country] The ISO 3166 Alpha-2 country code where the bank account is based.
#  See [Country](#type-country) for possible values
    # @param currency [SquareApiClient::Currency] The 3-character ISO 4217 currency code indicating the operating
#  currency of the bank account. For example, the currency code for US dollars
#  is `USD`.
#  See [Currency](#type-currency) for possible values
    # @param account_type [SquareApiClient::BankAccountType] The financial purpose of the associated bank account.
#  See [BankAccountType](#type-bankaccounttype) for possible values
    # @param holder_name [String] Name of the account holder. This name must match the name
#  on the targeted bank account record.
    # @param primary_bank_identification_number [String] Primary identifier for the bank. For more information, see
#  [Bank Accounts API](https://developer.squareup.com/docs/bank-accounts-api).
    # @param secondary_bank_identification_number [String] Secondary identifier for the bank. For more information, see
#  [Bank Accounts API](https://developer.squareup.com/docs/bank-accounts-api).
    # @param debit_mandate_reference_id [String] Reference identifier that will be displayed to UK bank account owners
#  when collecting direct debit authorization. Only required for UK bank accounts.
    # @param reference_id [String] Client-provided identifier for linking the banking account to an entity
#  in a third-party system (for example, a bank account number or a user
#  identifier).
    # @param location_id [String] The location to which the bank account belongs.
    # @param status [SquareApiClient::BankAccountStatus] Read-only. The current verification status of this BankAccount object.
#  See [BankAccountStatus](#type-bankaccountstatus) for possible values
    # @param creditable [Boolean] Indicates whether it is possible for Square to send money to this bank account.
    # @param debitable [Boolean] Indicates whether it is possible for Square to take money from this
#  bank account.
    # @param fingerprint [String] A Square-assigned, unique identifier for the bank account based on the
#  account information. The account fingerprint can be used to compare account
#  entries and determine if the they represent the same real-world bank account.
    # @param version [Integer] The current version of the `BankAccount`.
    # @param bank_name [String] Read only. Name of actual financial institution.
#  For example "Bank of America".
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::BankAccount]
    def initialize(id:, account_number_suffix:, country:, currency:, account_type:, holder_name:, primary_bank_identification_number:, secondary_bank_identification_number: OMIT, debit_mandate_reference_id: OMIT, reference_id: OMIT, location_id: OMIT, status:, creditable:, debitable:, fingerprint: OMIT, version: OMIT, bank_name: OMIT, additional_properties: nil)
      @id = id
      @account_number_suffix = account_number_suffix
      @country = country
      @currency = currency
      @account_type = account_type
      @holder_name = holder_name
      @primary_bank_identification_number = primary_bank_identification_number
      @secondary_bank_identification_number = secondary_bank_identification_number if secondary_bank_identification_number != OMIT
      @debit_mandate_reference_id = debit_mandate_reference_id if debit_mandate_reference_id != OMIT
      @reference_id = reference_id if reference_id != OMIT
      @location_id = location_id if location_id != OMIT
      @status = status
      @creditable = creditable
      @debitable = debitable
      @fingerprint = fingerprint if fingerprint != OMIT
      @version = version if version != OMIT
      @bank_name = bank_name if bank_name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "account_number_suffix": account_number_suffix, "country": country, "currency": currency, "account_type": account_type, "holder_name": holder_name, "primary_bank_identification_number": primary_bank_identification_number, "secondary_bank_identification_number": secondary_bank_identification_number, "debit_mandate_reference_id": debit_mandate_reference_id, "reference_id": reference_id, "location_id": location_id, "status": status, "creditable": creditable, "debitable": debitable, "fingerprint": fingerprint, "version": version, "bank_name": bank_name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BankAccount
    #
    # @param json_object [String] 
    # @return [SquareApiClient::BankAccount]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      account_number_suffix = parsed_json["account_number_suffix"]
      country = parsed_json["country"]
      currency = parsed_json["currency"]
      account_type = parsed_json["account_type"]
      holder_name = parsed_json["holder_name"]
      primary_bank_identification_number = parsed_json["primary_bank_identification_number"]
      secondary_bank_identification_number = parsed_json["secondary_bank_identification_number"]
      debit_mandate_reference_id = parsed_json["debit_mandate_reference_id"]
      reference_id = parsed_json["reference_id"]
      location_id = parsed_json["location_id"]
      status = parsed_json["status"]
      creditable = parsed_json["creditable"]
      debitable = parsed_json["debitable"]
      fingerprint = parsed_json["fingerprint"]
      version = parsed_json["version"]
      bank_name = parsed_json["bank_name"]
      new(
        id: id,
        account_number_suffix: account_number_suffix,
        country: country,
        currency: currency,
        account_type: account_type,
        holder_name: holder_name,
        primary_bank_identification_number: primary_bank_identification_number,
        secondary_bank_identification_number: secondary_bank_identification_number,
        debit_mandate_reference_id: debit_mandate_reference_id,
        reference_id: reference_id,
        location_id: location_id,
        status: status,
        creditable: creditable,
        debitable: debitable,
        fingerprint: fingerprint,
        version: version,
        bank_name: bank_name,
        additional_properties: struct
      )
    end
# Serialize an instance of BankAccount to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.account_number_suffix.is_a?(String) != false || raise("Passed value for field obj.account_number_suffix is not the expected type, validation failed.")
      obj.country.is_a?(SquareApiClient::Country) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      obj.currency.is_a?(SquareApiClient::Currency) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.account_type.is_a?(SquareApiClient::BankAccountType) != false || raise("Passed value for field obj.account_type is not the expected type, validation failed.")
      obj.holder_name.is_a?(String) != false || raise("Passed value for field obj.holder_name is not the expected type, validation failed.")
      obj.primary_bank_identification_number.is_a?(String) != false || raise("Passed value for field obj.primary_bank_identification_number is not the expected type, validation failed.")
      obj.secondary_bank_identification_number&.is_a?(String) != false || raise("Passed value for field obj.secondary_bank_identification_number is not the expected type, validation failed.")
      obj.debit_mandate_reference_id&.is_a?(String) != false || raise("Passed value for field obj.debit_mandate_reference_id is not the expected type, validation failed.")
      obj.reference_id&.is_a?(String) != false || raise("Passed value for field obj.reference_id is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.status.is_a?(SquareApiClient::BankAccountStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.creditable.is_a?(Boolean) != false || raise("Passed value for field obj.creditable is not the expected type, validation failed.")
      obj.debitable.is_a?(Boolean) != false || raise("Passed value for field obj.debitable is not the expected type, validation failed.")
      obj.fingerprint&.is_a?(String) != false || raise("Passed value for field obj.fingerprint is not the expected type, validation failed.")
      obj.version&.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.bank_name&.is_a?(String) != false || raise("Passed value for field obj.bank_name is not the expected type, validation failed.")
    end
  end
end