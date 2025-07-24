# frozen_string_literal: true
require_relative "tender_bank_account_details_status"
require "ostruct"
require "json"

module SquareApiClient
# Represents the details of a tender with `type` `BANK_ACCOUNT`.
#  See [BankAccountPaymentDetails](entity:BankAccountPaymentDetails)
#  for more exposed details of a bank account payment.
  class TenderBankAccountDetails
  # @return [SquareApiClient::TenderBankAccountDetailsStatus] The bank account payment's current state.
#  See
#  [TenderBankAccountPaymentDetailsStatus](entity:TenderBankAccountDetailsStatus)
#  for possible values.
#  See [TenderBankAccountDetailsStatus](#type-tenderbankaccountdetailsstatus) for
#  possible values
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param status [SquareApiClient::TenderBankAccountDetailsStatus] The bank account payment's current state.
#  See
#  [TenderBankAccountPaymentDetailsStatus](entity:TenderBankAccountDetailsStatus)
#  for possible values.
#  See [TenderBankAccountDetailsStatus](#type-tenderbankaccountdetailsstatus) for
#  possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::TenderBankAccountDetails]
    def initialize(status: OMIT, additional_properties: nil)
      @status = status if status != OMIT
      @additional_properties = additional_properties
      @_field_set = { "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TenderBankAccountDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::TenderBankAccountDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      status = parsed_json["status"]
      new(status: status, additional_properties: struct)
    end
# Serialize an instance of TenderBankAccountDetails to a JSON object
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
      obj.status&.is_a?(SquareApiClient::TenderBankAccountDetailsStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end