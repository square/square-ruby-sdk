# frozen_string_literal: true
require_relative "subscription_cadence"
require_relative "money"
require_relative "subscription_pricing"
require "ostruct"
require "json"

module square.rb
# Describes a phase in a subscription plan variation. For more information, see
#  [Subscription Plans and
#  ns](https://developer.squareup.com/docs/subscriptions-api/plans-and-variations).
  class SubscriptionPhase
  # @return [String] The Square-assigned ID of the subscription phase. This field cannot be changed
#  after a `SubscriptionPhase` is created.
    attr_reader :uid
  # @return [square.rb::SubscriptionCadence] The billing cadence of the phase. For example, weekly or monthly. This field
#  cannot be changed after a `SubscriptionPhase` is created.
#  See [SubscriptionCadence](#type-subscriptioncadence) for possible values
    attr_reader :cadence
  # @return [Integer] The number of `cadence`s the phase lasts. If not set, the phase never ends. Only
#  the last phase can be indefinite. This field cannot be changed after a
#  `SubscriptionPhase` is created.
    attr_reader :periods
  # @return [square.rb::Money] The amount to bill for each `cadence`. Failure to specify this field results in
#  a `MISSING_REQUIRED_PARAMETER` error at runtime.
    attr_reader :recurring_price_money
  # @return [Long] The position this phase appears in the sequence of phases defined for the plan,
#  indexed from 0. This field cannot be changed after a `SubscriptionPhase` is
#  created.
    attr_reader :ordinal
  # @return [square.rb::SubscriptionPricing] The subscription pricing.
    attr_reader :pricing
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] The Square-assigned ID of the subscription phase. This field cannot be changed
#  after a `SubscriptionPhase` is created.
    # @param cadence [square.rb::SubscriptionCadence] The billing cadence of the phase. For example, weekly or monthly. This field
#  cannot be changed after a `SubscriptionPhase` is created.
#  See [SubscriptionCadence](#type-subscriptioncadence) for possible values
    # @param periods [Integer] The number of `cadence`s the phase lasts. If not set, the phase never ends. Only
#  the last phase can be indefinite. This field cannot be changed after a
#  `SubscriptionPhase` is created.
    # @param recurring_price_money [square.rb::Money] The amount to bill for each `cadence`. Failure to specify this field results in
#  a `MISSING_REQUIRED_PARAMETER` error at runtime.
    # @param ordinal [Long] The position this phase appears in the sequence of phases defined for the plan,
#  indexed from 0. This field cannot be changed after a `SubscriptionPhase` is
#  created.
    # @param pricing [square.rb::SubscriptionPricing] The subscription pricing.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SubscriptionPhase]
    def initialize(uid: OMIT, cadence:, periods: OMIT, recurring_price_money: OMIT, ordinal: OMIT, pricing: OMIT, additional_properties: nil)
      @uid = uid if uid != OMIT
      @cadence = cadence
      @periods = periods if periods != OMIT
      @recurring_price_money = recurring_price_money if recurring_price_money != OMIT
      @ordinal = ordinal if ordinal != OMIT
      @pricing = pricing if pricing != OMIT
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "cadence": cadence, "periods": periods, "recurring_price_money": recurring_price_money, "ordinal": ordinal, "pricing": pricing }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SubscriptionPhase
    #
    # @param json_object [String] 
    # @return [square.rb::SubscriptionPhase]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      cadence = parsed_json["cadence"]
      periods = parsed_json["periods"]
      unless parsed_json["recurring_price_money"].nil?
        recurring_price_money = parsed_json["recurring_price_money"].to_json
        recurring_price_money = square.rb::Money.from_json(json_object: recurring_price_money)
      else
        recurring_price_money = nil
      end
      ordinal = parsed_json["ordinal"]
      unless parsed_json["pricing"].nil?
        pricing = parsed_json["pricing"].to_json
        pricing = square.rb::SubscriptionPricing.from_json(json_object: pricing)
      else
        pricing = nil
      end
      new(
        uid: uid,
        cadence: cadence,
        periods: periods,
        recurring_price_money: recurring_price_money,
        ordinal: ordinal,
        pricing: pricing,
        additional_properties: struct
      )
    end
# Serialize an instance of SubscriptionPhase to a JSON object
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
      obj.cadence.is_a?(square.rb::SubscriptionCadence) != false || raise("Passed value for field obj.cadence is not the expected type, validation failed.")
      obj.periods&.is_a?(Integer) != false || raise("Passed value for field obj.periods is not the expected type, validation failed.")
      obj.recurring_price_money.nil? || square.rb::Money.validate_raw(obj: obj.recurring_price_money)
      obj.ordinal&.is_a?(Long) != false || raise("Passed value for field obj.ordinal is not the expected type, validation failed.")
      obj.pricing.nil? || square.rb::SubscriptionPricing.validate_raw(obj: obj.pricing)
    end
  end
end