# frozen_string_literal: true
require_relative "loyalty_promotion_trigger_limit_interval"
require "ostruct"
require "json"

module square.rb
# Represents the number of times a buyer can earn points during a [loyalty
#  promotion](entity:LoyaltyPromotion).
#  If this field is not set, buyers can trigger the promotion an unlimited number
#  of times to earn points during
#  the time that the promotion is available.
#  A purchase that is disqualified from earning points because of this limit might
#  qualify for another active promotion.
  class LoyaltyPromotionTriggerLimit
  # @return [Integer] The maximum number of times a buyer can trigger the promotion during the
#  specified `interval`.
    attr_reader :times
  # @return [square.rb::LoyaltyPromotionTriggerLimitInterval] The time period the limit applies to.
#  See
#  oyaltyPromotionTriggerLimitInterval](#type-loyaltypromotiontriggerlimitinterval)
#  for possible values
    attr_reader :interval
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param times [Integer] The maximum number of times a buyer can trigger the promotion during the
#  specified `interval`.
    # @param interval [square.rb::LoyaltyPromotionTriggerLimitInterval] The time period the limit applies to.
#  See
#  oyaltyPromotionTriggerLimitInterval](#type-loyaltypromotiontriggerlimitinterval)
#  for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyPromotionTriggerLimit]
    def initialize(times:, interval: OMIT, additional_properties: nil)
      @times = times
      @interval = interval if interval != OMIT
      @additional_properties = additional_properties
      @_field_set = { "times": times, "interval": interval }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyPromotionTriggerLimit
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyPromotionTriggerLimit]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      times = parsed_json["times"]
      interval = parsed_json["interval"]
      new(
        times: times,
        interval: interval,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyPromotionTriggerLimit to a JSON object
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
      obj.times.is_a?(Integer) != false || raise("Passed value for field obj.times is not the expected type, validation failed.")
      obj.interval&.is_a?(square.rb::LoyaltyPromotionTriggerLimitInterval) != false || raise("Passed value for field obj.interval is not the expected type, validation failed.")
    end
  end
end