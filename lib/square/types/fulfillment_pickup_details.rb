# frozen_string_literal: true
require_relative "fulfillment_recipient"
require_relative "fulfillment_pickup_details_schedule_type"
require_relative "fulfillment_pickup_details_curbside_pickup_details"
require "ostruct"
require "json"

module SquareApiClient
# Contains details necessary to fulfill a pickup order.
  class FulfillmentPickupDetails
  # @return [SquareApiClient::FulfillmentRecipient] Information about the person to pick up this fulfillment from a physical
#  location.
    attr_reader :recipient
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when this fulfillment expires if it is not marked in progress. The
#  timestamp must be
#  in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z"). The expiration
#  time can only be set
#  up to 7 days in the future. If `expires_at` is not set, any new payments
#  attached to the order
#  are automatically completed.
    attr_reader :expires_at
  # @return [String] The duration of time after which an in progress pickup fulfillment is
#  automatically moved
#  to the `COMPLETED` state. The duration must be in RFC 3339 format (for example,
#  "P1W3D").
#  If not set, this pickup fulfillment remains in progress until it is canceled or
#  completed.
    attr_reader :auto_complete_duration
  # @return [SquareApiClient::FulfillmentPickupDetailsScheduleType] The schedule type of the pickup fulfillment. Defaults to `SCHEDULED`.
#  See
#  ulfillmentPickupDetailsScheduleType](#type-fulfillmentpickupdetailsscheduletype)
#  for possible values
    attr_reader :schedule_type
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  that represents the start of the pickup window. Must be in RFC 3339 timestamp
#  format, e.g.,
#  "2016-09-04T23:59:33.123Z".
#  For fulfillments with the schedule type `ASAP`, this is automatically set
#  to the current time plus the expected duration to prepare the fulfillment.
    attr_reader :pickup_at
  # @return [String] The window of time in which the order should be picked up after the `pickup_at`
#  timestamp.
#  Must be in RFC 3339 duration format, e.g., "P1W3D". Can be used as an
#  informational guideline for merchants.
    attr_reader :pickup_window_duration
  # @return [String] The duration of time it takes to prepare this fulfillment.
#  The duration must be in RFC 3339 format (for example, "P1W3D").
    attr_reader :prep_time_duration
  # @return [String] A note to provide additional instructions about the pickup
#  fulfillment displayed in the Square Point of Sale application and set by the
#  API.
    attr_reader :note
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was placed. The timestamp must be in RFC 3339
#  format
#  (for example, "2016-09-04T23:59:33.123Z").
    attr_reader :placed_at
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was marked in progress. The timestamp must be in
#  RFC 3339 format
#  (for example, "2016-09-04T23:59:33.123Z").
    attr_reader :accepted_at
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was rejected. The timestamp must be in RFC 3339
#  format
#  (for example, "2016-09-04T23:59:33.123Z").
    attr_reader :rejected_at
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment is marked as ready for pickup. The timestamp
#  must be in RFC 3339 format
#  (for example, "2016-09-04T23:59:33.123Z").
    attr_reader :ready_at
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment expired. The timestamp must be in RFC 3339
#  format
#  (for example, "2016-09-04T23:59:33.123Z").
    attr_reader :expired_at
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was picked up by the recipient. The timestamp
#  must be in RFC 3339 format
#  (for example, "2016-09-04T23:59:33.123Z").
    attr_reader :picked_up_at
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was canceled. The timestamp must be in RFC 3339
#  format
#  (for example, "2016-09-04T23:59:33.123Z").
    attr_reader :canceled_at
  # @return [String] A description of why the pickup was canceled. The maximum length: 100
#  characters.
    attr_reader :cancel_reason
  # @return [Boolean] If set to `true`, indicates that this pickup order is for curbside pickup, not
#  in-store pickup.
    attr_reader :is_curbside_pickup
  # @return [SquareApiClient::FulfillmentPickupDetailsCurbsidePickupDetails] Specific details for curbside pickup. These details can only be populated if
#  `is_curbside_pickup` is set to `true`.
    attr_reader :curbside_pickup_details
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param recipient [SquareApiClient::FulfillmentRecipient] Information about the person to pick up this fulfillment from a physical
#  location.
    # @param expires_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when this fulfillment expires if it is not marked in progress. The
#  timestamp must be
#  in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z"). The expiration
#  time can only be set
#  up to 7 days in the future. If `expires_at` is not set, any new payments
#  attached to the order
#  are automatically completed.
    # @param auto_complete_duration [String] The duration of time after which an in progress pickup fulfillment is
#  automatically moved
#  to the `COMPLETED` state. The duration must be in RFC 3339 format (for example,
#  "P1W3D").
#  If not set, this pickup fulfillment remains in progress until it is canceled or
#  completed.
    # @param schedule_type [SquareApiClient::FulfillmentPickupDetailsScheduleType] The schedule type of the pickup fulfillment. Defaults to `SCHEDULED`.
#  See
#  ulfillmentPickupDetailsScheduleType](#type-fulfillmentpickupdetailsscheduletype)
#  for possible values
    # @param pickup_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  that represents the start of the pickup window. Must be in RFC 3339 timestamp
#  format, e.g.,
#  "2016-09-04T23:59:33.123Z".
#  For fulfillments with the schedule type `ASAP`, this is automatically set
#  to the current time plus the expected duration to prepare the fulfillment.
    # @param pickup_window_duration [String] The window of time in which the order should be picked up after the `pickup_at`
#  timestamp.
#  Must be in RFC 3339 duration format, e.g., "P1W3D". Can be used as an
#  informational guideline for merchants.
    # @param prep_time_duration [String] The duration of time it takes to prepare this fulfillment.
#  The duration must be in RFC 3339 format (for example, "P1W3D").
    # @param note [String] A note to provide additional instructions about the pickup
#  fulfillment displayed in the Square Point of Sale application and set by the
#  API.
    # @param placed_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was placed. The timestamp must be in RFC 3339
#  format
#  (for example, "2016-09-04T23:59:33.123Z").
    # @param accepted_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was marked in progress. The timestamp must be in
#  RFC 3339 format
#  (for example, "2016-09-04T23:59:33.123Z").
    # @param rejected_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was rejected. The timestamp must be in RFC 3339
#  format
#  (for example, "2016-09-04T23:59:33.123Z").
    # @param ready_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment is marked as ready for pickup. The timestamp
#  must be in RFC 3339 format
#  (for example, "2016-09-04T23:59:33.123Z").
    # @param expired_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment expired. The timestamp must be in RFC 3339
#  format
#  (for example, "2016-09-04T23:59:33.123Z").
    # @param picked_up_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was picked up by the recipient. The timestamp
#  must be in RFC 3339 format
#  (for example, "2016-09-04T23:59:33.123Z").
    # @param canceled_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was canceled. The timestamp must be in RFC 3339
#  format
#  (for example, "2016-09-04T23:59:33.123Z").
    # @param cancel_reason [String] A description of why the pickup was canceled. The maximum length: 100
#  characters.
    # @param is_curbside_pickup [Boolean] If set to `true`, indicates that this pickup order is for curbside pickup, not
#  in-store pickup.
    # @param curbside_pickup_details [SquareApiClient::FulfillmentPickupDetailsCurbsidePickupDetails] Specific details for curbside pickup. These details can only be populated if
#  `is_curbside_pickup` is set to `true`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::FulfillmentPickupDetails]
    def initialize(recipient: OMIT, expires_at: OMIT, auto_complete_duration: OMIT, schedule_type: OMIT, pickup_at: OMIT, pickup_window_duration: OMIT, prep_time_duration: OMIT, note: OMIT, placed_at: OMIT, accepted_at: OMIT, rejected_at: OMIT, ready_at: OMIT, expired_at: OMIT, picked_up_at: OMIT, canceled_at: OMIT, cancel_reason: OMIT, is_curbside_pickup: OMIT, curbside_pickup_details: OMIT, additional_properties: nil)
      @recipient = recipient if recipient != OMIT
      @expires_at = expires_at if expires_at != OMIT
      @auto_complete_duration = auto_complete_duration if auto_complete_duration != OMIT
      @schedule_type = schedule_type if schedule_type != OMIT
      @pickup_at = pickup_at if pickup_at != OMIT
      @pickup_window_duration = pickup_window_duration if pickup_window_duration != OMIT
      @prep_time_duration = prep_time_duration if prep_time_duration != OMIT
      @note = note if note != OMIT
      @placed_at = placed_at if placed_at != OMIT
      @accepted_at = accepted_at if accepted_at != OMIT
      @rejected_at = rejected_at if rejected_at != OMIT
      @ready_at = ready_at if ready_at != OMIT
      @expired_at = expired_at if expired_at != OMIT
      @picked_up_at = picked_up_at if picked_up_at != OMIT
      @canceled_at = canceled_at if canceled_at != OMIT
      @cancel_reason = cancel_reason if cancel_reason != OMIT
      @is_curbside_pickup = is_curbside_pickup if is_curbside_pickup != OMIT
      @curbside_pickup_details = curbside_pickup_details if curbside_pickup_details != OMIT
      @additional_properties = additional_properties
      @_field_set = { "recipient": recipient, "expires_at": expires_at, "auto_complete_duration": auto_complete_duration, "schedule_type": schedule_type, "pickup_at": pickup_at, "pickup_window_duration": pickup_window_duration, "prep_time_duration": prep_time_duration, "note": note, "placed_at": placed_at, "accepted_at": accepted_at, "rejected_at": rejected_at, "ready_at": ready_at, "expired_at": expired_at, "picked_up_at": picked_up_at, "canceled_at": canceled_at, "cancel_reason": cancel_reason, "is_curbside_pickup": is_curbside_pickup, "curbside_pickup_details": curbside_pickup_details }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FulfillmentPickupDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::FulfillmentPickupDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["recipient"].nil?
        recipient = parsed_json["recipient"].to_json
        recipient = SquareApiClient::FulfillmentRecipient.from_json(json_object: recipient)
      else
        recipient = nil
      end
      expires_at = parsed_json["expires_at"]
      auto_complete_duration = parsed_json["auto_complete_duration"]
      schedule_type = parsed_json["schedule_type"]
      pickup_at = parsed_json["pickup_at"]
      pickup_window_duration = parsed_json["pickup_window_duration"]
      prep_time_duration = parsed_json["prep_time_duration"]
      note = parsed_json["note"]
      placed_at = parsed_json["placed_at"]
      accepted_at = parsed_json["accepted_at"]
      rejected_at = parsed_json["rejected_at"]
      ready_at = parsed_json["ready_at"]
      expired_at = parsed_json["expired_at"]
      picked_up_at = parsed_json["picked_up_at"]
      canceled_at = parsed_json["canceled_at"]
      cancel_reason = parsed_json["cancel_reason"]
      is_curbside_pickup = parsed_json["is_curbside_pickup"]
      unless parsed_json["curbside_pickup_details"].nil?
        curbside_pickup_details = parsed_json["curbside_pickup_details"].to_json
        curbside_pickup_details = SquareApiClient::FulfillmentPickupDetailsCurbsidePickupDetails.from_json(json_object: curbside_pickup_details)
      else
        curbside_pickup_details = nil
      end
      new(
        recipient: recipient,
        expires_at: expires_at,
        auto_complete_duration: auto_complete_duration,
        schedule_type: schedule_type,
        pickup_at: pickup_at,
        pickup_window_duration: pickup_window_duration,
        prep_time_duration: prep_time_duration,
        note: note,
        placed_at: placed_at,
        accepted_at: accepted_at,
        rejected_at: rejected_at,
        ready_at: ready_at,
        expired_at: expired_at,
        picked_up_at: picked_up_at,
        canceled_at: canceled_at,
        cancel_reason: cancel_reason,
        is_curbside_pickup: is_curbside_pickup,
        curbside_pickup_details: curbside_pickup_details,
        additional_properties: struct
      )
    end
# Serialize an instance of FulfillmentPickupDetails to a JSON object
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
      obj.recipient.nil? || SquareApiClient::FulfillmentRecipient.validate_raw(obj: obj.recipient)
      obj.expires_at&.is_a?(String) != false || raise("Passed value for field obj.expires_at is not the expected type, validation failed.")
      obj.auto_complete_duration&.is_a?(String) != false || raise("Passed value for field obj.auto_complete_duration is not the expected type, validation failed.")
      obj.schedule_type&.is_a?(SquareApiClient::FulfillmentPickupDetailsScheduleType) != false || raise("Passed value for field obj.schedule_type is not the expected type, validation failed.")
      obj.pickup_at&.is_a?(String) != false || raise("Passed value for field obj.pickup_at is not the expected type, validation failed.")
      obj.pickup_window_duration&.is_a?(String) != false || raise("Passed value for field obj.pickup_window_duration is not the expected type, validation failed.")
      obj.prep_time_duration&.is_a?(String) != false || raise("Passed value for field obj.prep_time_duration is not the expected type, validation failed.")
      obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
      obj.placed_at&.is_a?(String) != false || raise("Passed value for field obj.placed_at is not the expected type, validation failed.")
      obj.accepted_at&.is_a?(String) != false || raise("Passed value for field obj.accepted_at is not the expected type, validation failed.")
      obj.rejected_at&.is_a?(String) != false || raise("Passed value for field obj.rejected_at is not the expected type, validation failed.")
      obj.ready_at&.is_a?(String) != false || raise("Passed value for field obj.ready_at is not the expected type, validation failed.")
      obj.expired_at&.is_a?(String) != false || raise("Passed value for field obj.expired_at is not the expected type, validation failed.")
      obj.picked_up_at&.is_a?(String) != false || raise("Passed value for field obj.picked_up_at is not the expected type, validation failed.")
      obj.canceled_at&.is_a?(String) != false || raise("Passed value for field obj.canceled_at is not the expected type, validation failed.")
      obj.cancel_reason&.is_a?(String) != false || raise("Passed value for field obj.cancel_reason is not the expected type, validation failed.")
      obj.is_curbside_pickup&.is_a?(Boolean) != false || raise("Passed value for field obj.is_curbside_pickup is not the expected type, validation failed.")
      obj.curbside_pickup_details.nil? || SquareApiClient::FulfillmentPickupDetailsCurbsidePickupDetails.validate_raw(obj: obj.curbside_pickup_details)
    end
  end
end