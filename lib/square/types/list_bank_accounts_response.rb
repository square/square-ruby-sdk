# frozen_string_literal: true
require_relative "error"
require_relative "bank_account"
require "ostruct"
require "json"

module square.rb
# Response object returned by ListBankAccounts.
  class ListBankAccountsResponse
  # @return [Array<square.rb::Error>] Information on errors encountered during the request.
    attr_reader :errors
  # @return [Array<square.rb::BankAccount>] List of BankAccounts associated with this account.
    attr_reader :bank_accounts
  # @return [String] When a response is truncated, it includes a cursor that you can
#  use in a subsequent request to fetch next set of bank accounts.
#  If empty, this is the final response.
#  For more information, see
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Information on errors encountered during the request.
    # @param bank_accounts [Array<square.rb::BankAccount>] List of BankAccounts associated with this account.
    # @param cursor [String] When a response is truncated, it includes a cursor that you can
#  use in a subsequent request to fetch next set of bank accounts.
#  If empty, this is the final response.
#  For more information, see
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ListBankAccountsResponse]
    def initialize(errors: OMIT, bank_accounts: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @bank_accounts = bank_accounts if bank_accounts != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "bank_accounts": bank_accounts, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListBankAccountsResponse
    #
    # @param json_object [String] 
    # @return [square.rb::ListBankAccountsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      bank_accounts = parsed_json["bank_accounts"]&.map do | item |
  item = item.to_json
  square.rb::BankAccount.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        bank_accounts: bank_accounts,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of ListBankAccountsResponse to a JSON object
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
      obj.bank_accounts&.is_a?(Array) != false || raise("Passed value for field obj.bank_accounts is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end