# frozen_string_literal: true
require_relative "error"
require_relative "bank_account"
require "ostruct"
require "json"

module square.rb
# Response object returned by GetBankAccountByV1Id.
  class GetBankAccountByV1IdResponse
  # @return [Array<square.rb::Error>] Information on errors encountered during the request.
    attr_reader :errors
  # @return [square.rb::BankAccount] The requested `BankAccount` object.
    attr_reader :bank_account
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Information on errors encountered during the request.
    # @param bank_account [square.rb::BankAccount] The requested `BankAccount` object.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GetBankAccountByV1IdResponse]
    def initialize(errors: OMIT, bank_account: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @bank_account = bank_account if bank_account != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "bank_account": bank_account }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetBankAccountByV1IdResponse
    #
    # @param json_object [String] 
    # @return [square.rb::GetBankAccountByV1IdResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["bank_account"].nil?
        bank_account = parsed_json["bank_account"].to_json
        bank_account = square.rb::BankAccount.from_json(json_object: bank_account)
      else
        bank_account = nil
      end
      new(
        errors: errors,
        bank_account: bank_account,
        additional_properties: struct
      )
    end
# Serialize an instance of GetBankAccountByV1IdResponse to a JSON object
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
      obj.bank_account.nil? || square.rb::BankAccount.validate_raw(obj: obj.bank_account)
    end
  end
end