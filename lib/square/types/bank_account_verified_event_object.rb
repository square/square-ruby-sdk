# frozen_string_literal: true
require_relative "bank_account"
require "ostruct"
require "json"

module SquareApiClient
  class BankAccountVerifiedEventObject
  # @return [SquareApiClient::BankAccount] The verified bank account.
    attr_reader :bank_account
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param bank_account [SquareApiClient::BankAccount] The verified bank account.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::BankAccountVerifiedEventObject]
    def initialize(bank_account: OMIT, additional_properties: nil)
      @bank_account = bank_account if bank_account != OMIT
      @additional_properties = additional_properties
      @_field_set = { "bank_account": bank_account }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BankAccountVerifiedEventObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::BankAccountVerifiedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["bank_account"].nil?
        bank_account = parsed_json["bank_account"].to_json
        bank_account = SquareApiClient::BankAccount.from_json(json_object: bank_account)
      else
        bank_account = nil
      end
      new(bank_account: bank_account, additional_properties: struct)
    end
# Serialize an instance of BankAccountVerifiedEventObject to a JSON object
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
      obj.bank_account.nil? || SquareApiClient::BankAccount.validate_raw(obj: obj.bank_account)
    end
  end
end