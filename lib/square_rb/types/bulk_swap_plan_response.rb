# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Defines output parameters in a response of the
#  [BulkSwapPlan](api-endpoint:Subscriptions-BulkSwapPlan) endpoint.
  class BulkSwapPlanResponse
  # @return [Array<SquareApiClient::Error>] Errors encountered during the request.
    attr_reader :errors
  # @return [Integer] The number of affected subscriptions.
    attr_reader :affected_subscriptions
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Errors encountered during the request.
    # @param affected_subscriptions [Integer] The number of affected subscriptions.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::BulkSwapPlanResponse]
    def initialize(errors: OMIT, affected_subscriptions: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @affected_subscriptions = affected_subscriptions if affected_subscriptions != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "affected_subscriptions": affected_subscriptions }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BulkSwapPlanResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::BulkSwapPlanResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      affected_subscriptions = parsed_json["affected_subscriptions"]
      new(
        errors: errors,
        affected_subscriptions: affected_subscriptions,
        additional_properties: struct
      )
    end
# Serialize an instance of BulkSwapPlanResponse to a JSON object
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
      obj.affected_subscriptions&.is_a?(Integer) != false || raise("Passed value for field obj.affected_subscriptions is not the expected type, validation failed.")
    end
  end
end