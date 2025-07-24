# frozen_string_literal: true
require_relative "error"
require_relative "subscription"
require_relative "subscription_action"
require "ostruct"
require "json"

module square.rb
# Defines output parameters in a response from the
#  [ResumeSubscription](api-endpoint:Subscriptions-ResumeSubscription) endpoint.
  class ResumeSubscriptionResponse
  # @return [Array<square.rb::Error>] Errors encountered during the request.
    attr_reader :errors
  # @return [square.rb::Subscription] The resumed subscription.
    attr_reader :subscription
  # @return [Array<square.rb::SubscriptionAction>] A list of `RESUME` actions created by the request and scheduled for the
#  subscription.
    attr_reader :actions
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Errors encountered during the request.
    # @param subscription [square.rb::Subscription] The resumed subscription.
    # @param actions [Array<square.rb::SubscriptionAction>] A list of `RESUME` actions created by the request and scheduled for the
#  subscription.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ResumeSubscriptionResponse]
    def initialize(errors: OMIT, subscription: OMIT, actions: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @subscription = subscription if subscription != OMIT
      @actions = actions if actions != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "subscription": subscription, "actions": actions }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ResumeSubscriptionResponse
    #
    # @param json_object [String] 
    # @return [square.rb::ResumeSubscriptionResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["subscription"].nil?
        subscription = parsed_json["subscription"].to_json
        subscription = square.rb::Subscription.from_json(json_object: subscription)
      else
        subscription = nil
      end
      actions = parsed_json["actions"]&.map do | item |
  item = item.to_json
  square.rb::SubscriptionAction.from_json(json_object: item)
end
      new(
        errors: errors,
        subscription: subscription,
        actions: actions,
        additional_properties: struct
      )
    end
# Serialize an instance of ResumeSubscriptionResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.subscription.nil? || square.rb::Subscription.validate_raw(obj: obj.subscription)
      obj.actions&.is_a?(Array) != false || raise("Passed value for field obj.actions is not the expected type, validation failed.")
    end
  end
end