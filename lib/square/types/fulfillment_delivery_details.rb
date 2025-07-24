# frozen_string_literal: true
require_relative "fulfillment_recipient"
require_relative "fulfillment_delivery_details_order_fulfillment_delivery_details_schedule_type"
require "ostruct"
require "json"

module SquareApiClient
# Describes delivery details of an order fulfillment.
  class FulfillmentDeliveryDetails
  # @return [SquareApiClient::FulfillmentRecipient] The contact information for the person to receive the fulfillment.
    attr_reader :recipient
  # @return [SquareApiClient::FulfillmentDeliveryDetailsOrderFulfillmentDeliveryDetailsScheduleType] Indicates the fulfillment delivery schedule type. If `SCHEDULED`, then
#  `deliver_at` is required. If `ASAP`, then `prep_time_duration` is required. The
#  default is `SCHEDULED`.
#  See
#  tDeliveryDetailsScheduleType](#type-orderfulfillmentdeliverydetailsscheduletype)
#  for possible values
    attr_reader :schedule_type
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was placed.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
#  Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
    attr_reader :placed_at
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  that represents the start of the delivery period.
#  When the fulfillment `schedule_type` is `ASAP`, the field is automatically
#  set to the current time plus the `prep_time_duration`.
#  Otherwise, the application can set this field while the fulfillment `state` is
#  `PROPOSED`, `RESERVED`, or `PREPARED` (any time before the
#  terminal state such as `COMPLETED`, `CANCELED`, and `FAILED`).
#  The timestamp must be in RFC 3339 format
#  (for example, "2016-09-04T23:59:33.123Z").
    attr_reader :deliver_at
  # @return [String] The duration of time it takes to prepare and deliver this fulfillment.
#  The duration must be in RFC 3339 format (for example, "P1W3D").
    attr_reader :prep_time_duration
  # @return [String] The time period after `deliver_at` in which to deliver the order.
#  Applications can set this field when the fulfillment `state` is
#  `PROPOSED`, `RESERVED`, or `PREPARED` (any time before the terminal state
#  such as `COMPLETED`, `CANCELED`, and `FAILED`).
#  The duration must be in RFC 3339 format (for example, "P1W3D").
    attr_reader :delivery_window_duration
  # @return [String] Provides additional instructions about the delivery fulfillment.
#  It is displayed in the Square Point of Sale application and set by the API.
    attr_reader :note
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicates when the seller completed the fulfillment.
#  This field is automatically set when  fulfillment `state` changes to
#  `COMPLETED`.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    attr_reader :completed_at
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicates when the seller started processing the fulfillment.
#  This field is automatically set when the fulfillment `state` changes to
#  `RESERVED`.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    attr_reader :in_progress_at
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was rejected. This field is
#  automatically set when the fulfillment `state` changes to `FAILED`.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    attr_reader :rejected_at
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the seller marked the fulfillment as ready for
#  courier pickup. This field is automatically set when the fulfillment `state`
#  changes
#  to PREPARED.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    attr_reader :ready_at
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was delivered to the recipient.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    attr_reader :delivered_at
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was canceled. This field is automatically
#  set when the fulfillment `state` changes to `CANCELED`.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    attr_reader :canceled_at
  # @return [String] The delivery cancellation reason. Max length: 100 characters.
    attr_reader :cancel_reason
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when an order can be picked up by the courier for delivery.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    attr_reader :courier_pickup_at
  # @return [String] The time period after `courier_pickup_at` in which the courier should pick up
#  the order.
#  The duration must be in RFC 3339 format (for example, "P1W3D").
    attr_reader :courier_pickup_window_duration
  # @return [Boolean] Whether the delivery is preferred to be no contact.
    attr_reader :is_no_contact_delivery
  # @return [String] A note to provide additional instructions about how to deliver the order.
    attr_reader :dropoff_notes
  # @return [String] The name of the courier provider.
    attr_reader :courier_provider_name
  # @return [String] The support phone number of the courier.
    attr_reader :courier_support_phone_number
  # @return [String] The identifier for the delivery created by Square.
    attr_reader :square_delivery_id
  # @return [String] The identifier for the delivery created by the third-party courier service.
    attr_reader :external_delivery_id
  # @return [Boolean] The flag to indicate the delivery is managed by a third party (ie DoorDash),
#  which means
#  we may not receive all recipient information for PII purposes.
    attr_reader :managed_delivery
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param recipient [SquareApiClient::FulfillmentRecipient] The contact information for the person to receive the fulfillment.
    # @param schedule_type [SquareApiClient::FulfillmentDeliveryDetailsOrderFulfillmentDeliveryDetailsScheduleType] Indicates the fulfillment delivery schedule type. If `SCHEDULED`, then
#  `deliver_at` is required. If `ASAP`, then `prep_time_duration` is required. The
#  default is `SCHEDULED`.
#  See
#  tDeliveryDetailsScheduleType](#type-orderfulfillmentdeliverydetailsscheduletype)
#  for possible values
    # @param placed_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was placed.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
#  Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
    # @param deliver_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  that represents the start of the delivery period.
#  When the fulfillment `schedule_type` is `ASAP`, the field is automatically
#  set to the current time plus the `prep_time_duration`.
#  Otherwise, the application can set this field while the fulfillment `state` is
#  `PROPOSED`, `RESERVED`, or `PREPARED` (any time before the
#  terminal state such as `COMPLETED`, `CANCELED`, and `FAILED`).
#  The timestamp must be in RFC 3339 format
#  (for example, "2016-09-04T23:59:33.123Z").
    # @param prep_time_duration [String] The duration of time it takes to prepare and deliver this fulfillment.
#  The duration must be in RFC 3339 format (for example, "P1W3D").
    # @param delivery_window_duration [String] The time period after `deliver_at` in which to deliver the order.
#  Applications can set this field when the fulfillment `state` is
#  `PROPOSED`, `RESERVED`, or `PREPARED` (any time before the terminal state
#  such as `COMPLETED`, `CANCELED`, and `FAILED`).
#  The duration must be in RFC 3339 format (for example, "P1W3D").
    # @param note [String] Provides additional instructions about the delivery fulfillment.
#  It is displayed in the Square Point of Sale application and set by the API.
    # @param completed_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicates when the seller completed the fulfillment.
#  This field is automatically set when  fulfillment `state` changes to
#  `COMPLETED`.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    # @param in_progress_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicates when the seller started processing the fulfillment.
#  This field is automatically set when the fulfillment `state` changes to
#  `RESERVED`.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    # @param rejected_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was rejected. This field is
#  automatically set when the fulfillment `state` changes to `FAILED`.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    # @param ready_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the seller marked the fulfillment as ready for
#  courier pickup. This field is automatically set when the fulfillment `state`
#  changes
#  to PREPARED.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    # @param delivered_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was delivered to the recipient.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    # @param canceled_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the fulfillment was canceled. This field is automatically
#  set when the fulfillment `state` changes to `CANCELED`.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    # @param cancel_reason [String] The delivery cancellation reason. Max length: 100 characters.
    # @param courier_pickup_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when an order can be picked up by the courier for delivery.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    # @param courier_pickup_window_duration [String] The time period after `courier_pickup_at` in which the courier should pick up
#  the order.
#  The duration must be in RFC 3339 format (for example, "P1W3D").
    # @param is_no_contact_delivery [Boolean] Whether the delivery is preferred to be no contact.
    # @param dropoff_notes [String] A note to provide additional instructions about how to deliver the order.
    # @param courier_provider_name [String] The name of the courier provider.
    # @param courier_support_phone_number [String] The support phone number of the courier.
    # @param square_delivery_id [String] The identifier for the delivery created by Square.
    # @param external_delivery_id [String] The identifier for the delivery created by the third-party courier service.
    # @param managed_delivery [Boolean] The flag to indicate the delivery is managed by a third party (ie DoorDash),
#  which means
#  we may not receive all recipient information for PII purposes.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::FulfillmentDeliveryDetails]
    def initialize(recipient: OMIT, schedule_type: OMIT, placed_at: OMIT, deliver_at: OMIT, prep_time_duration: OMIT, delivery_window_duration: OMIT, note: OMIT, completed_at: OMIT, in_progress_at: OMIT, rejected_at: OMIT, ready_at: OMIT, delivered_at: OMIT, canceled_at: OMIT, cancel_reason: OMIT, courier_pickup_at: OMIT, courier_pickup_window_duration: OMIT, is_no_contact_delivery: OMIT, dropoff_notes: OMIT, courier_provider_name: OMIT, courier_support_phone_number: OMIT, square_delivery_id: OMIT, external_delivery_id: OMIT, managed_delivery: OMIT, additional_properties: nil)
      @recipient = recipient if recipient != OMIT
      @schedule_type = schedule_type if schedule_type != OMIT
      @placed_at = placed_at if placed_at != OMIT
      @deliver_at = deliver_at if deliver_at != OMIT
      @prep_time_duration = prep_time_duration if prep_time_duration != OMIT
      @delivery_window_duration = delivery_window_duration if delivery_window_duration != OMIT
      @note = note if note != OMIT
      @completed_at = completed_at if completed_at != OMIT
      @in_progress_at = in_progress_at if in_progress_at != OMIT
      @rejected_at = rejected_at if rejected_at != OMIT
      @ready_at = ready_at if ready_at != OMIT
      @delivered_at = delivered_at if delivered_at != OMIT
      @canceled_at = canceled_at if canceled_at != OMIT
      @cancel_reason = cancel_reason if cancel_reason != OMIT
      @courier_pickup_at = courier_pickup_at if courier_pickup_at != OMIT
      @courier_pickup_window_duration = courier_pickup_window_duration if courier_pickup_window_duration != OMIT
      @is_no_contact_delivery = is_no_contact_delivery if is_no_contact_delivery != OMIT
      @dropoff_notes = dropoff_notes if dropoff_notes != OMIT
      @courier_provider_name = courier_provider_name if courier_provider_name != OMIT
      @courier_support_phone_number = courier_support_phone_number if courier_support_phone_number != OMIT
      @square_delivery_id = square_delivery_id if square_delivery_id != OMIT
      @external_delivery_id = external_delivery_id if external_delivery_id != OMIT
      @managed_delivery = managed_delivery if managed_delivery != OMIT
      @additional_properties = additional_properties
      @_field_set = { "recipient": recipient, "schedule_type": schedule_type, "placed_at": placed_at, "deliver_at": deliver_at, "prep_time_duration": prep_time_duration, "delivery_window_duration": delivery_window_duration, "note": note, "completed_at": completed_at, "in_progress_at": in_progress_at, "rejected_at": rejected_at, "ready_at": ready_at, "delivered_at": delivered_at, "canceled_at": canceled_at, "cancel_reason": cancel_reason, "courier_pickup_at": courier_pickup_at, "courier_pickup_window_duration": courier_pickup_window_duration, "is_no_contact_delivery": is_no_contact_delivery, "dropoff_notes": dropoff_notes, "courier_provider_name": courier_provider_name, "courier_support_phone_number": courier_support_phone_number, "square_delivery_id": square_delivery_id, "external_delivery_id": external_delivery_id, "managed_delivery": managed_delivery }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FulfillmentDeliveryDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::FulfillmentDeliveryDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["recipient"].nil?
        recipient = parsed_json["recipient"].to_json
        recipient = SquareApiClient::FulfillmentRecipient.from_json(json_object: recipient)
      else
        recipient = nil
      end
      schedule_type = parsed_json["schedule_type"]
      placed_at = parsed_json["placed_at"]
      deliver_at = parsed_json["deliver_at"]
      prep_time_duration = parsed_json["prep_time_duration"]
      delivery_window_duration = parsed_json["delivery_window_duration"]
      note = parsed_json["note"]
      completed_at = parsed_json["completed_at"]
      in_progress_at = parsed_json["in_progress_at"]
      rejected_at = parsed_json["rejected_at"]
      ready_at = parsed_json["ready_at"]
      delivered_at = parsed_json["delivered_at"]
      canceled_at = parsed_json["canceled_at"]
      cancel_reason = parsed_json["cancel_reason"]
      courier_pickup_at = parsed_json["courier_pickup_at"]
      courier_pickup_window_duration = parsed_json["courier_pickup_window_duration"]
      is_no_contact_delivery = parsed_json["is_no_contact_delivery"]
      dropoff_notes = parsed_json["dropoff_notes"]
      courier_provider_name = parsed_json["courier_provider_name"]
      courier_support_phone_number = parsed_json["courier_support_phone_number"]
      square_delivery_id = parsed_json["square_delivery_id"]
      external_delivery_id = parsed_json["external_delivery_id"]
      managed_delivery = parsed_json["managed_delivery"]
      new(
        recipient: recipient,
        schedule_type: schedule_type,
        placed_at: placed_at,
        deliver_at: deliver_at,
        prep_time_duration: prep_time_duration,
        delivery_window_duration: delivery_window_duration,
        note: note,
        completed_at: completed_at,
        in_progress_at: in_progress_at,
        rejected_at: rejected_at,
        ready_at: ready_at,
        delivered_at: delivered_at,
        canceled_at: canceled_at,
        cancel_reason: cancel_reason,
        courier_pickup_at: courier_pickup_at,
        courier_pickup_window_duration: courier_pickup_window_duration,
        is_no_contact_delivery: is_no_contact_delivery,
        dropoff_notes: dropoff_notes,
        courier_provider_name: courier_provider_name,
        courier_support_phone_number: courier_support_phone_number,
        square_delivery_id: square_delivery_id,
        external_delivery_id: external_delivery_id,
        managed_delivery: managed_delivery,
        additional_properties: struct
      )
    end
# Serialize an instance of FulfillmentDeliveryDetails to a JSON object
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
      obj.schedule_type&.is_a?(SquareApiClient::FulfillmentDeliveryDetailsOrderFulfillmentDeliveryDetailsScheduleType) != false || raise("Passed value for field obj.schedule_type is not the expected type, validation failed.")
      obj.placed_at&.is_a?(String) != false || raise("Passed value for field obj.placed_at is not the expected type, validation failed.")
      obj.deliver_at&.is_a?(String) != false || raise("Passed value for field obj.deliver_at is not the expected type, validation failed.")
      obj.prep_time_duration&.is_a?(String) != false || raise("Passed value for field obj.prep_time_duration is not the expected type, validation failed.")
      obj.delivery_window_duration&.is_a?(String) != false || raise("Passed value for field obj.delivery_window_duration is not the expected type, validation failed.")
      obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
      obj.completed_at&.is_a?(String) != false || raise("Passed value for field obj.completed_at is not the expected type, validation failed.")
      obj.in_progress_at&.is_a?(String) != false || raise("Passed value for field obj.in_progress_at is not the expected type, validation failed.")
      obj.rejected_at&.is_a?(String) != false || raise("Passed value for field obj.rejected_at is not the expected type, validation failed.")
      obj.ready_at&.is_a?(String) != false || raise("Passed value for field obj.ready_at is not the expected type, validation failed.")
      obj.delivered_at&.is_a?(String) != false || raise("Passed value for field obj.delivered_at is not the expected type, validation failed.")
      obj.canceled_at&.is_a?(String) != false || raise("Passed value for field obj.canceled_at is not the expected type, validation failed.")
      obj.cancel_reason&.is_a?(String) != false || raise("Passed value for field obj.cancel_reason is not the expected type, validation failed.")
      obj.courier_pickup_at&.is_a?(String) != false || raise("Passed value for field obj.courier_pickup_at is not the expected type, validation failed.")
      obj.courier_pickup_window_duration&.is_a?(String) != false || raise("Passed value for field obj.courier_pickup_window_duration is not the expected type, validation failed.")
      obj.is_no_contact_delivery&.is_a?(Boolean) != false || raise("Passed value for field obj.is_no_contact_delivery is not the expected type, validation failed.")
      obj.dropoff_notes&.is_a?(String) != false || raise("Passed value for field obj.dropoff_notes is not the expected type, validation failed.")
      obj.courier_provider_name&.is_a?(String) != false || raise("Passed value for field obj.courier_provider_name is not the expected type, validation failed.")
      obj.courier_support_phone_number&.is_a?(String) != false || raise("Passed value for field obj.courier_support_phone_number is not the expected type, validation failed.")
      obj.square_delivery_id&.is_a?(String) != false || raise("Passed value for field obj.square_delivery_id is not the expected type, validation failed.")
      obj.external_delivery_id&.is_a?(String) != false || raise("Passed value for field obj.external_delivery_id is not the expected type, validation failed.")
      obj.managed_delivery&.is_a?(Boolean) != false || raise("Passed value for field obj.managed_delivery is not the expected type, validation failed.")
    end
  end
end