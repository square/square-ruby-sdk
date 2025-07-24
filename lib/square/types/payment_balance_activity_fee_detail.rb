# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
  class PaymentBalanceActivityFeeDetail
  # @return [String] The ID of the payment associated with this activity
#  This will only be populated when a principal LedgerEntryToken is also populated.
#  If the fee is independent (there is no principal LedgerEntryToken) then this
#  will likely not
#  be populated.
    attr_reader :payment_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param payment_id [String] The ID of the payment associated with this activity
#  This will only be populated when a principal LedgerEntryToken is also populated.
#  If the fee is independent (there is no principal LedgerEntryToken) then this
#  will likely not
#  be populated.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::PaymentBalanceActivityFeeDetail]
    def initialize(payment_id: OMIT, additional_properties: nil)
      @payment_id = payment_id if payment_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "payment_id": payment_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PaymentBalanceActivityFeeDetail
    #
    # @param json_object [String] 
    # @return [square.rb::PaymentBalanceActivityFeeDetail]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      payment_id = parsed_json["payment_id"]
      new(payment_id: payment_id, additional_properties: struct)
    end
# Serialize an instance of PaymentBalanceActivityFeeDetail to a JSON object
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
      obj.payment_id&.is_a?(String) != false || raise("Passed value for field obj.payment_id is not the expected type, validation failed.")
    end
  end
end