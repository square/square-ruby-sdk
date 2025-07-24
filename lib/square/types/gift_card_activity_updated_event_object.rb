# frozen_string_literal: true
require_relative "gift_card_activity"
require "ostruct"
require "json"

module square.rb
# An object that contains the gift card activity associated with a
#  `gift_card.activity.updated` event.
  class GiftCardActivityUpdatedEventObject
  # @return [square.rb::GiftCardActivity] The updated gift card activity.
    attr_reader :gift_card_activity
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param gift_card_activity [square.rb::GiftCardActivity] The updated gift card activity.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GiftCardActivityUpdatedEventObject]
    def initialize(gift_card_activity: OMIT, additional_properties: nil)
      @gift_card_activity = gift_card_activity if gift_card_activity != OMIT
      @additional_properties = additional_properties
      @_field_set = { "gift_card_activity": gift_card_activity }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GiftCardActivityUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::GiftCardActivityUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["gift_card_activity"].nil?
        gift_card_activity = parsed_json["gift_card_activity"].to_json
        gift_card_activity = square.rb::GiftCardActivity.from_json(json_object: gift_card_activity)
      else
        gift_card_activity = nil
      end
      new(gift_card_activity: gift_card_activity, additional_properties: struct)
    end
# Serialize an instance of GiftCardActivityUpdatedEventObject to a JSON object
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
      obj.gift_card_activity.nil? || square.rb::GiftCardActivity.validate_raw(obj: obj.gift_card_activity)
    end
  end
end