# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module SquareApiClient
# A tip being returned.
  class OrderReturnTip
  # @return [String] A unique ID that identifies the tip only within this order.
    attr_reader :uid
  # @return [SquareApiClient::Money] The amount of tip being returned
#  --
    attr_reader :applied_money
  # @return [String] The tender `uid` from the order that contains the original application of this
#  tip.
    attr_reader :source_tender_uid
  # @return [String] The tender `id` from the order that contains the original application of this
#  tip.
    attr_reader :source_tender_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] A unique ID that identifies the tip only within this order.
    # @param applied_money [SquareApiClient::Money] The amount of tip being returned
#  --
    # @param source_tender_uid [String] The tender `uid` from the order that contains the original application of this
#  tip.
    # @param source_tender_id [String] The tender `id` from the order that contains the original application of this
#  tip.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::OrderReturnTip]
    def initialize(uid: OMIT, applied_money: OMIT, source_tender_uid: OMIT, source_tender_id: OMIT, additional_properties: nil)
      @uid = uid if uid != OMIT
      @applied_money = applied_money if applied_money != OMIT
      @source_tender_uid = source_tender_uid if source_tender_uid != OMIT
      @source_tender_id = source_tender_id if source_tender_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "applied_money": applied_money, "source_tender_uid": source_tender_uid, "source_tender_id": source_tender_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderReturnTip
    #
    # @param json_object [String] 
    # @return [SquareApiClient::OrderReturnTip]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      unless parsed_json["applied_money"].nil?
        applied_money = parsed_json["applied_money"].to_json
        applied_money = SquareApiClient::Money.from_json(json_object: applied_money)
      else
        applied_money = nil
      end
      source_tender_uid = parsed_json["source_tender_uid"]
      source_tender_id = parsed_json["source_tender_id"]
      new(
        uid: uid,
        applied_money: applied_money,
        source_tender_uid: source_tender_uid,
        source_tender_id: source_tender_id,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderReturnTip to a JSON object
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
      obj.uid&.is_a?(String) != false || raise("Passed value for field obj.uid is not the expected type, validation failed.")
      obj.applied_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.applied_money)
      obj.source_tender_uid&.is_a?(String) != false || raise("Passed value for field obj.source_tender_uid is not the expected type, validation failed.")
      obj.source_tender_id&.is_a?(String) != false || raise("Passed value for field obj.source_tender_id is not the expected type, validation failed.")
    end
  end
end