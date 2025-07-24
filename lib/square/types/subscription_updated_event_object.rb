# frozen_string_literal: true
require_relative "subscription"
require "ostruct"
require "json"

module square.rb
  class SubscriptionUpdatedEventObject
  # @return [square.rb::Subscription] The updated subscription.
    attr_reader :subscription
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param subscription [square.rb::Subscription] The updated subscription.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SubscriptionUpdatedEventObject]
    def initialize(subscription: OMIT, additional_properties: nil)
      @subscription = subscription if subscription != OMIT
      @additional_properties = additional_properties
      @_field_set = { "subscription": subscription }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SubscriptionUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::SubscriptionUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["subscription"].nil?
        subscription = parsed_json["subscription"].to_json
        subscription = square.rb::Subscription.from_json(json_object: subscription)
      else
        subscription = nil
      end
      new(subscription: subscription, additional_properties: struct)
    end
# Serialize an instance of SubscriptionUpdatedEventObject to a JSON object
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
      obj.subscription.nil? || square.rb::Subscription.validate_raw(obj: obj.subscription)
    end
  end
end