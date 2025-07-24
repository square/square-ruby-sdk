# frozen_string_literal: true
require_relative "error"
require_relative "subscription"
require "ostruct"
require "json"

module SquareApiClient
# Defines output parameters in a response from the
#  [CreateSubscription](api-endpoint:Subscriptions-CreateSubscription) endpoint.
  class CreateSubscriptionResponse
  # @return [Array<SquareApiClient::Error>] Errors encountered during the request.
    attr_reader :errors
  # @return [SquareApiClient::Subscription] The newly created subscription.
#  For more information, see
#  [Subscription
#  r.squareup.com/docs/subscriptions-api/manage-subscriptions#subscription-object).
    attr_reader :subscription
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Errors encountered during the request.
    # @param subscription [SquareApiClient::Subscription] The newly created subscription.
#  For more information, see
#  [Subscription
#  r.squareup.com/docs/subscriptions-api/manage-subscriptions#subscription-object).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CreateSubscriptionResponse]
    def initialize(errors: OMIT, subscription: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @subscription = subscription if subscription != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "subscription": subscription }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateSubscriptionResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CreateSubscriptionResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["subscription"].nil?
        subscription = parsed_json["subscription"].to_json
        subscription = SquareApiClient::Subscription.from_json(json_object: subscription)
      else
        subscription = nil
      end
      new(
        errors: errors,
        subscription: subscription,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateSubscriptionResponse to a JSON object
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
      obj.subscription.nil? || SquareApiClient::Subscription.validate_raw(obj: obj.subscription)
    end
  end
end