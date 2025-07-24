# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents a phase, which can override subscription phases as defined by plan_id
  class Phase
  # @return [String] id of subscription phase
    attr_reader :uid
  # @return [Long] index of phase in total subscription plan
    attr_reader :ordinal
  # @return [String] id of order to be used in billing
    attr_reader :order_template_id
  # @return [String] the uid from the plan's phase in catalog
    attr_reader :plan_phase_uid
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] id of subscription phase
    # @param ordinal [Long] index of phase in total subscription plan
    # @param order_template_id [String] id of order to be used in billing
    # @param plan_phase_uid [String] the uid from the plan's phase in catalog
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::Phase]
    def initialize(uid: OMIT, ordinal: OMIT, order_template_id: OMIT, plan_phase_uid: OMIT, additional_properties: nil)
      @uid = uid if uid != OMIT
      @ordinal = ordinal if ordinal != OMIT
      @order_template_id = order_template_id if order_template_id != OMIT
      @plan_phase_uid = plan_phase_uid if plan_phase_uid != OMIT
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "ordinal": ordinal, "order_template_id": order_template_id, "plan_phase_uid": plan_phase_uid }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Phase
    #
    # @param json_object [String] 
    # @return [SquareApiClient::Phase]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      ordinal = parsed_json["ordinal"]
      order_template_id = parsed_json["order_template_id"]
      plan_phase_uid = parsed_json["plan_phase_uid"]
      new(
        uid: uid,
        ordinal: ordinal,
        order_template_id: order_template_id,
        plan_phase_uid: plan_phase_uid,
        additional_properties: struct
      )
    end
# Serialize an instance of Phase to a JSON object
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
      obj.ordinal&.is_a?(Long) != false || raise("Passed value for field obj.ordinal is not the expected type, validation failed.")
      obj.order_template_id&.is_a?(String) != false || raise("Passed value for field obj.order_template_id is not the expected type, validation failed.")
      obj.plan_phase_uid&.is_a?(String) != false || raise("Passed value for field obj.plan_phase_uid is not the expected type, validation failed.")
    end
  end
end