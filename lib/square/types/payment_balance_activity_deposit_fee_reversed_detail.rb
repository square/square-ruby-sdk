# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
  class PaymentBalanceActivityDepositFeeReversedDetail
  # @return [String] The ID of the payout that triggered this deposit fee activity.
    attr_reader :payout_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param payout_id [String] The ID of the payout that triggered this deposit fee activity.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::PaymentBalanceActivityDepositFeeReversedDetail]
    def initialize(payout_id: OMIT, additional_properties: nil)
      @payout_id = payout_id if payout_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "payout_id": payout_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  PaymentBalanceActivityDepositFeeReversedDetail
    #
    # @param json_object [String] 
    # @return [square.rb::PaymentBalanceActivityDepositFeeReversedDetail]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      payout_id = parsed_json["payout_id"]
      new(payout_id: payout_id, additional_properties: struct)
    end
# Serialize an instance of PaymentBalanceActivityDepositFeeReversedDetail to a
#  JSON object
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
      obj.payout_id&.is_a?(String) != false || raise("Passed value for field obj.payout_id is not the expected type, validation failed.")
    end
  end
end