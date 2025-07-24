# frozen_string_literal: true
require_relative "error"
require_relative "subscription_test_result"
require "ostruct"
require "json"

module SquareApiClient
# Defines the fields that are included in the response body of
#  a request to the
#  tWebhookSubscription](api-endpoint:WebhookSubscriptions-TestWebhookSubscription)
#  endpoint.
#  Note: If there are errors processing the request, the
#  [SubscriptionTestResult](entity:SubscriptionTestResult) field is not
#  present.
  class TestWebhookSubscriptionResponse
  # @return [Array<SquareApiClient::Error>] Information on errors encountered during the request.
    attr_reader :errors
  # @return [SquareApiClient::SubscriptionTestResult] The [SubscriptionTestResult](entity:SubscriptionTestResult).
    attr_reader :subscription_test_result
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Information on errors encountered during the request.
    # @param subscription_test_result [SquareApiClient::SubscriptionTestResult] The [SubscriptionTestResult](entity:SubscriptionTestResult).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::TestWebhookSubscriptionResponse]
    def initialize(errors: OMIT, subscription_test_result: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @subscription_test_result = subscription_test_result if subscription_test_result != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "subscription_test_result": subscription_test_result }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TestWebhookSubscriptionResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::TestWebhookSubscriptionResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["subscription_test_result"].nil?
        subscription_test_result = parsed_json["subscription_test_result"].to_json
        subscription_test_result = SquareApiClient::SubscriptionTestResult.from_json(json_object: subscription_test_result)
      else
        subscription_test_result = nil
      end
      new(
        errors: errors,
        subscription_test_result: subscription_test_result,
        additional_properties: struct
      )
    end
# Serialize an instance of TestWebhookSubscriptionResponse to a JSON object
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
      obj.subscription_test_result.nil? || SquareApiClient::SubscriptionTestResult.validate_raw(obj: obj.subscription_test_result)
    end
  end
end