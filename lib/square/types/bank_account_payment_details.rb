# frozen_string_literal: true
require_relative "ach_details"
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Additional details about BANK_ACCOUNT type payments.
  class BankAccountPaymentDetails
  # @return [String] The name of the bank associated with the bank account.
    attr_reader :bank_name
  # @return [String] The type of the bank transfer. The type can be `ACH` or `UNKNOWN`.
    attr_reader :transfer_type
  # @return [String] The ownership type of the bank account performing the transfer.
#  The type can be `INDIVIDUAL`, `COMPANY`, or `ACCOUNT_TYPE_UNKNOWN`.
    attr_reader :account_ownership_type
  # @return [String] Uniquely identifies the bank account for this seller and can be used
#  to determine if payments are from the same bank account.
    attr_reader :fingerprint
  # @return [String] The two-letter ISO code representing the country the bank account is located in.
    attr_reader :country
  # @return [String] The statement description as sent to the bank.
    attr_reader :statement_description
  # @return [square.rb::AchDetails] ACH-specific information about the transfer. The information is only populated
#  if the `transfer_type` is `ACH`.
    attr_reader :ach_details
  # @return [Array<square.rb::Error>] Information about errors encountered during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param bank_name [String] The name of the bank associated with the bank account.
    # @param transfer_type [String] The type of the bank transfer. The type can be `ACH` or `UNKNOWN`.
    # @param account_ownership_type [String] The ownership type of the bank account performing the transfer.
#  The type can be `INDIVIDUAL`, `COMPANY`, or `ACCOUNT_TYPE_UNKNOWN`.
    # @param fingerprint [String] Uniquely identifies the bank account for this seller and can be used
#  to determine if payments are from the same bank account.
    # @param country [String] The two-letter ISO code representing the country the bank account is located in.
    # @param statement_description [String] The statement description as sent to the bank.
    # @param ach_details [square.rb::AchDetails] ACH-specific information about the transfer. The information is only populated
#  if the `transfer_type` is `ACH`.
    # @param errors [Array<square.rb::Error>] Information about errors encountered during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BankAccountPaymentDetails]
    def initialize(bank_name: OMIT, transfer_type: OMIT, account_ownership_type: OMIT, fingerprint: OMIT, country: OMIT, statement_description: OMIT, ach_details: OMIT, errors: OMIT, additional_properties: nil)
      @bank_name = bank_name if bank_name != OMIT
      @transfer_type = transfer_type if transfer_type != OMIT
      @account_ownership_type = account_ownership_type if account_ownership_type != OMIT
      @fingerprint = fingerprint if fingerprint != OMIT
      @country = country if country != OMIT
      @statement_description = statement_description if statement_description != OMIT
      @ach_details = ach_details if ach_details != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "bank_name": bank_name, "transfer_type": transfer_type, "account_ownership_type": account_ownership_type, "fingerprint": fingerprint, "country": country, "statement_description": statement_description, "ach_details": ach_details, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BankAccountPaymentDetails
    #
    # @param json_object [String] 
    # @return [square.rb::BankAccountPaymentDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      bank_name = parsed_json["bank_name"]
      transfer_type = parsed_json["transfer_type"]
      account_ownership_type = parsed_json["account_ownership_type"]
      fingerprint = parsed_json["fingerprint"]
      country = parsed_json["country"]
      statement_description = parsed_json["statement_description"]
      unless parsed_json["ach_details"].nil?
        ach_details = parsed_json["ach_details"].to_json
        ach_details = square.rb::AchDetails.from_json(json_object: ach_details)
      else
        ach_details = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        bank_name: bank_name,
        transfer_type: transfer_type,
        account_ownership_type: account_ownership_type,
        fingerprint: fingerprint,
        country: country,
        statement_description: statement_description,
        ach_details: ach_details,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of BankAccountPaymentDetails to a JSON object
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
      obj.bank_name&.is_a?(String) != false || raise("Passed value for field obj.bank_name is not the expected type, validation failed.")
      obj.transfer_type&.is_a?(String) != false || raise("Passed value for field obj.transfer_type is not the expected type, validation failed.")
      obj.account_ownership_type&.is_a?(String) != false || raise("Passed value for field obj.account_ownership_type is not the expected type, validation failed.")
      obj.fingerprint&.is_a?(String) != false || raise("Passed value for field obj.fingerprint is not the expected type, validation failed.")
      obj.country&.is_a?(String) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      obj.statement_description&.is_a?(String) != false || raise("Passed value for field obj.statement_description is not the expected type, validation failed.")
      obj.ach_details.nil? || square.rb::AchDetails.validate_raw(obj: obj.ach_details)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end