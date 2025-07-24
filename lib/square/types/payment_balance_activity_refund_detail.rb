# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
  class PaymentBalanceActivityRefundDetail
  # @return [String] The ID of the payment associated with this activity.
    attr_reader :payment_id
  # @return [String] The ID of the refund associated with this activity.
    attr_reader :refund_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param payment_id [String] The ID of the payment associated with this activity.
    # @param refund_id [String] The ID of the refund associated with this activity.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::PaymentBalanceActivityRefundDetail]
    def initialize(payment_id: OMIT, refund_id: OMIT, additional_properties: nil)
      @payment_id = payment_id if payment_id != OMIT
      @refund_id = refund_id if refund_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "payment_id": payment_id, "refund_id": refund_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PaymentBalanceActivityRefundDetail
    #
    # @param json_object [String] 
    # @return [square.rb::PaymentBalanceActivityRefundDetail]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      payment_id = parsed_json["payment_id"]
      refund_id = parsed_json["refund_id"]
      new(
        payment_id: payment_id,
        refund_id: refund_id,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentBalanceActivityRefundDetail to a JSON object
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
      obj.refund_id&.is_a?(String) != false || raise("Passed value for field obj.refund_id is not the expected type, validation failed.")
    end
  end
end