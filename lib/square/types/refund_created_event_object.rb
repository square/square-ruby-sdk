# frozen_string_literal: true
require_relative "payment_refund"
require "ostruct"
require "json"

module square.rb
  class RefundCreatedEventObject
  # @return [square.rb::PaymentRefund] The created refund.
    attr_reader :refund
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param refund [square.rb::PaymentRefund] The created refund.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::RefundCreatedEventObject]
    def initialize(refund: OMIT, additional_properties: nil)
      @refund = refund if refund != OMIT
      @additional_properties = additional_properties
      @_field_set = { "refund": refund }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of RefundCreatedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::RefundCreatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["refund"].nil?
        refund = parsed_json["refund"].to_json
        refund = square.rb::PaymentRefund.from_json(json_object: refund)
      else
        refund = nil
      end
      new(refund: refund, additional_properties: struct)
    end
# Serialize an instance of RefundCreatedEventObject to a JSON object
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
      obj.refund.nil? || square.rb::PaymentRefund.validate_raw(obj: obj.refund)
    end
  end
end