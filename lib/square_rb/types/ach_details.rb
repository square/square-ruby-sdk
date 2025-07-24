# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# ACH-specific details about `BANK_ACCOUNT` type payments with the `transfer_type`
#  of `ACH`.
  class AchDetails
  # @return [String] The routing number for the bank account.
    attr_reader :routing_number
  # @return [String] The last few digits of the bank account number.
    attr_reader :account_number_suffix
  # @return [String] The type of the bank account performing the transfer. The account type can be
#  `CHECKING`,
#  `SAVINGS`, or `UNKNOWN`.
    attr_reader :account_type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param routing_number [String] The routing number for the bank account.
    # @param account_number_suffix [String] The last few digits of the bank account number.
    # @param account_type [String] The type of the bank account performing the transfer. The account type can be
#  `CHECKING`,
#  `SAVINGS`, or `UNKNOWN`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::AchDetails]
    def initialize(routing_number: OMIT, account_number_suffix: OMIT, account_type: OMIT, additional_properties: nil)
      @routing_number = routing_number if routing_number != OMIT
      @account_number_suffix = account_number_suffix if account_number_suffix != OMIT
      @account_type = account_type if account_type != OMIT
      @additional_properties = additional_properties
      @_field_set = { "routing_number": routing_number, "account_number_suffix": account_number_suffix, "account_type": account_type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AchDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::AchDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      routing_number = parsed_json["routing_number"]
      account_number_suffix = parsed_json["account_number_suffix"]
      account_type = parsed_json["account_type"]
      new(
        routing_number: routing_number,
        account_number_suffix: account_number_suffix,
        account_type: account_type,
        additional_properties: struct
      )
    end
# Serialize an instance of AchDetails to a JSON object
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
      obj.routing_number&.is_a?(String) != false || raise("Passed value for field obj.routing_number is not the expected type, validation failed.")
      obj.account_number_suffix&.is_a?(String) != false || raise("Passed value for field obj.account_number_suffix is not the expected type, validation failed.")
      obj.account_type&.is_a?(String) != false || raise("Passed value for field obj.account_type is not the expected type, validation failed.")
    end
  end
end