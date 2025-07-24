# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Defines the fields that are included in the response body of
#  a request to the
#  ureKey](api-endpoint:WebhookSubscriptions-UpdateWebhookSubscriptionSignatureKey)
#  endpoint.
#  Note: If there are errors processing the request, the
#  [Subscription](entity:WebhookSubscription) is not
#  present.
  class UpdateWebhookSubscriptionSignatureKeyResponse
  # @return [Array<SquareApiClient::Error>] Information on errors encountered during the request.
    attr_reader :errors
  # @return [String] The new Square-generated signature key used to validate the origin of the
#  webhook event.
    attr_reader :signature_key
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Information on errors encountered during the request.
    # @param signature_key [String] The new Square-generated signature key used to validate the origin of the
#  webhook event.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::UpdateWebhookSubscriptionSignatureKeyResponse]
    def initialize(errors: OMIT, signature_key: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @signature_key = signature_key if signature_key != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "signature_key": signature_key }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  UpdateWebhookSubscriptionSignatureKeyResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::UpdateWebhookSubscriptionSignatureKeyResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      signature_key = parsed_json["signature_key"]
      new(
        errors: errors,
        signature_key: signature_key,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateWebhookSubscriptionSignatureKeyResponse to a JSON
#  object
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
      obj.signature_key&.is_a?(String) != false || raise("Passed value for field obj.signature_key is not the expected type, validation failed.")
    end
  end
end