# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Represents the details of a webhook subscription, including notification URL,
#  event types, and signature key.
  class WebhookSubscription
  # @return [String] A Square-generated unique ID for the subscription.
    attr_reader :id
  # @return [String] The name of this subscription.
    attr_reader :name
  # @return [Boolean] Indicates whether the subscription is enabled (`true`) or not (`false`).
    attr_reader :enabled
  # @return [Array<String>] The event types associated with this subscription.
    attr_reader :event_types
  # @return [String] The URL to which webhooks are sent.
    attr_reader :notification_url
  # @return [String] The API version of the subscription.
#  This field is optional for `CreateWebhookSubscription`.
#  The value defaults to the API version used by the application.
    attr_reader :api_version
  # @return [String] The Square-generated signature key used to validate the origin of the webhook
#  event.
    attr_reader :signature_key
  # @return [String] The timestamp of when the subscription was created, in RFC 3339 format. For
#  example, "2016-09-04T23:59:33.123Z".
    attr_reader :created_at
  # @return [String] The timestamp of when the subscription was last updated, in RFC 3339 format.
#  For example, "2016-09-04T23:59:33.123Z".
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A Square-generated unique ID for the subscription.
    # @param name [String] The name of this subscription.
    # @param enabled [Boolean] Indicates whether the subscription is enabled (`true`) or not (`false`).
    # @param event_types [Array<String>] The event types associated with this subscription.
    # @param notification_url [String] The URL to which webhooks are sent.
    # @param api_version [String] The API version of the subscription.
#  This field is optional for `CreateWebhookSubscription`.
#  The value defaults to the API version used by the application.
    # @param signature_key [String] The Square-generated signature key used to validate the origin of the webhook
#  event.
    # @param created_at [String] The timestamp of when the subscription was created, in RFC 3339 format. For
#  example, "2016-09-04T23:59:33.123Z".
    # @param updated_at [String] The timestamp of when the subscription was last updated, in RFC 3339 format.
#  For example, "2016-09-04T23:59:33.123Z".
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::WebhookSubscription]
    def initialize(id: OMIT, name: OMIT, enabled: OMIT, event_types: OMIT, notification_url: OMIT, api_version: OMIT, signature_key: OMIT, created_at: OMIT, updated_at: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @name = name if name != OMIT
      @enabled = enabled if enabled != OMIT
      @event_types = event_types if event_types != OMIT
      @notification_url = notification_url if notification_url != OMIT
      @api_version = api_version if api_version != OMIT
      @signature_key = signature_key if signature_key != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "enabled": enabled, "event_types": event_types, "notification_url": notification_url, "api_version": api_version, "signature_key": signature_key, "created_at": created_at, "updated_at": updated_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WebhookSubscription
    #
    # @param json_object [String] 
    # @return [square.rb::WebhookSubscription]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      enabled = parsed_json["enabled"]
      event_types = parsed_json["event_types"]
      notification_url = parsed_json["notification_url"]
      api_version = parsed_json["api_version"]
      signature_key = parsed_json["signature_key"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      new(
        id: id,
        name: name,
        enabled: enabled,
        event_types: event_types,
        notification_url: notification_url,
        api_version: api_version,
        signature_key: signature_key,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end
# Serialize an instance of WebhookSubscription to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
      obj.event_types&.is_a?(Array) != false || raise("Passed value for field obj.event_types is not the expected type, validation failed.")
      obj.notification_url&.is_a?(String) != false || raise("Passed value for field obj.notification_url is not the expected type, validation failed.")
      obj.api_version&.is_a?(String) != false || raise("Passed value for field obj.api_version is not the expected type, validation failed.")
      obj.signature_key&.is_a?(String) != false || raise("Passed value for field obj.signature_key is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end