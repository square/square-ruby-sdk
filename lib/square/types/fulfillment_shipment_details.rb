# frozen_string_literal: true
require_relative "fulfillment_recipient"
require "ostruct"
require "json"

module square.rb
# Contains the details necessary to fulfill a shipment order.
  class FulfillmentShipmentDetails
  # @return [square.rb::FulfillmentRecipient] Information about the person to receive this shipment fulfillment.
    attr_reader :recipient
  # @return [String] The shipping carrier being used to ship this fulfillment (such as UPS, FedEx, or
#  USPS).
    attr_reader :carrier
  # @return [String] A note with additional information for the shipping carrier.
    attr_reader :shipping_note
  # @return [String] A description of the type of shipping product purchased from the carrier
#  (such as First Class, Priority, or Express).
    attr_reader :shipping_type
  # @return [String] The reference number provided by the carrier to track the shipment's progress.
    attr_reader :tracking_number
  # @return [String] A link to the tracking webpage on the carrier's website.
    attr_reader :tracking_url
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the shipment was requested. The timestamp must be in RFC 3339
#  format
#  (for example, "2016-09-04T23:59:33.123Z").
    attr_reader :placed_at
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when this fulfillment was moved to the `RESERVED` state, which
#  indicates that preparation
#  of this shipment has begun. The timestamp must be in RFC 3339 format (for
#  example, "2016-09-04T23:59:33.123Z").
    attr_reader :in_progress_at
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when this fulfillment was moved to the `PREPARED` state, which
#  indicates that the
#  fulfillment is packaged. The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    attr_reader :packaged_at
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the shipment is expected to be delivered to the shipping
#  carrier.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    attr_reader :expected_shipped_at
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when this fulfillment was moved to the `COMPLETED` state, which
#  indicates that
#  the fulfillment has been given to the shipping carrier. The timestamp must be in
#  RFC 3339 format
#  (for example, "2016-09-04T23:59:33.123Z").
    attr_reader :shipped_at
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating the shipment was canceled.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    attr_reader :canceled_at
  # @return [String] A description of why the shipment was canceled.
    attr_reader :cancel_reason
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the shipment failed to be completed. The timestamp must be in
#  RFC 3339 format
#  (for example, "2016-09-04T23:59:33.123Z").
    attr_reader :failed_at
  # @return [String] A description of why the shipment failed to be completed.
    attr_reader :failure_reason
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param recipient [square.rb::FulfillmentRecipient] Information about the person to receive this shipment fulfillment.
    # @param carrier [String] The shipping carrier being used to ship this fulfillment (such as UPS, FedEx, or
#  USPS).
    # @param shipping_note [String] A note with additional information for the shipping carrier.
    # @param shipping_type [String] A description of the type of shipping product purchased from the carrier
#  (such as First Class, Priority, or Express).
    # @param tracking_number [String] The reference number provided by the carrier to track the shipment's progress.
    # @param tracking_url [String] A link to the tracking webpage on the carrier's website.
    # @param placed_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the shipment was requested. The timestamp must be in RFC 3339
#  format
#  (for example, "2016-09-04T23:59:33.123Z").
    # @param in_progress_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when this fulfillment was moved to the `RESERVED` state, which
#  indicates that preparation
#  of this shipment has begun. The timestamp must be in RFC 3339 format (for
#  example, "2016-09-04T23:59:33.123Z").
    # @param packaged_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when this fulfillment was moved to the `PREPARED` state, which
#  indicates that the
#  fulfillment is packaged. The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    # @param expected_shipped_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the shipment is expected to be delivered to the shipping
#  carrier.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    # @param shipped_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when this fulfillment was moved to the `COMPLETED` state, which
#  indicates that
#  the fulfillment has been given to the shipping carrier. The timestamp must be in
#  RFC 3339 format
#  (for example, "2016-09-04T23:59:33.123Z").
    # @param canceled_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating the shipment was canceled.
#  The timestamp must be in RFC 3339 format (for example,
#  "2016-09-04T23:59:33.123Z").
    # @param cancel_reason [String] A description of why the shipment was canceled.
    # @param failed_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the shipment failed to be completed. The timestamp must be in
#  RFC 3339 format
#  (for example, "2016-09-04T23:59:33.123Z").
    # @param failure_reason [String] A description of why the shipment failed to be completed.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::FulfillmentShipmentDetails]
    def initialize(recipient: OMIT, carrier: OMIT, shipping_note: OMIT, shipping_type: OMIT, tracking_number: OMIT, tracking_url: OMIT, placed_at: OMIT, in_progress_at: OMIT, packaged_at: OMIT, expected_shipped_at: OMIT, shipped_at: OMIT, canceled_at: OMIT, cancel_reason: OMIT, failed_at: OMIT, failure_reason: OMIT, additional_properties: nil)
      @recipient = recipient if recipient != OMIT
      @carrier = carrier if carrier != OMIT
      @shipping_note = shipping_note if shipping_note != OMIT
      @shipping_type = shipping_type if shipping_type != OMIT
      @tracking_number = tracking_number if tracking_number != OMIT
      @tracking_url = tracking_url if tracking_url != OMIT
      @placed_at = placed_at if placed_at != OMIT
      @in_progress_at = in_progress_at if in_progress_at != OMIT
      @packaged_at = packaged_at if packaged_at != OMIT
      @expected_shipped_at = expected_shipped_at if expected_shipped_at != OMIT
      @shipped_at = shipped_at if shipped_at != OMIT
      @canceled_at = canceled_at if canceled_at != OMIT
      @cancel_reason = cancel_reason if cancel_reason != OMIT
      @failed_at = failed_at if failed_at != OMIT
      @failure_reason = failure_reason if failure_reason != OMIT
      @additional_properties = additional_properties
      @_field_set = { "recipient": recipient, "carrier": carrier, "shipping_note": shipping_note, "shipping_type": shipping_type, "tracking_number": tracking_number, "tracking_url": tracking_url, "placed_at": placed_at, "in_progress_at": in_progress_at, "packaged_at": packaged_at, "expected_shipped_at": expected_shipped_at, "shipped_at": shipped_at, "canceled_at": canceled_at, "cancel_reason": cancel_reason, "failed_at": failed_at, "failure_reason": failure_reason }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FulfillmentShipmentDetails
    #
    # @param json_object [String] 
    # @return [square.rb::FulfillmentShipmentDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["recipient"].nil?
        recipient = parsed_json["recipient"].to_json
        recipient = square.rb::FulfillmentRecipient.from_json(json_object: recipient)
      else
        recipient = nil
      end
      carrier = parsed_json["carrier"]
      shipping_note = parsed_json["shipping_note"]
      shipping_type = parsed_json["shipping_type"]
      tracking_number = parsed_json["tracking_number"]
      tracking_url = parsed_json["tracking_url"]
      placed_at = parsed_json["placed_at"]
      in_progress_at = parsed_json["in_progress_at"]
      packaged_at = parsed_json["packaged_at"]
      expected_shipped_at = parsed_json["expected_shipped_at"]
      shipped_at = parsed_json["shipped_at"]
      canceled_at = parsed_json["canceled_at"]
      cancel_reason = parsed_json["cancel_reason"]
      failed_at = parsed_json["failed_at"]
      failure_reason = parsed_json["failure_reason"]
      new(
        recipient: recipient,
        carrier: carrier,
        shipping_note: shipping_note,
        shipping_type: shipping_type,
        tracking_number: tracking_number,
        tracking_url: tracking_url,
        placed_at: placed_at,
        in_progress_at: in_progress_at,
        packaged_at: packaged_at,
        expected_shipped_at: expected_shipped_at,
        shipped_at: shipped_at,
        canceled_at: canceled_at,
        cancel_reason: cancel_reason,
        failed_at: failed_at,
        failure_reason: failure_reason,
        additional_properties: struct
      )
    end
# Serialize an instance of FulfillmentShipmentDetails to a JSON object
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
      obj.recipient.nil? || square.rb::FulfillmentRecipient.validate_raw(obj: obj.recipient)
      obj.carrier&.is_a?(String) != false || raise("Passed value for field obj.carrier is not the expected type, validation failed.")
      obj.shipping_note&.is_a?(String) != false || raise("Passed value for field obj.shipping_note is not the expected type, validation failed.")
      obj.shipping_type&.is_a?(String) != false || raise("Passed value for field obj.shipping_type is not the expected type, validation failed.")
      obj.tracking_number&.is_a?(String) != false || raise("Passed value for field obj.tracking_number is not the expected type, validation failed.")
      obj.tracking_url&.is_a?(String) != false || raise("Passed value for field obj.tracking_url is not the expected type, validation failed.")
      obj.placed_at&.is_a?(String) != false || raise("Passed value for field obj.placed_at is not the expected type, validation failed.")
      obj.in_progress_at&.is_a?(String) != false || raise("Passed value for field obj.in_progress_at is not the expected type, validation failed.")
      obj.packaged_at&.is_a?(String) != false || raise("Passed value for field obj.packaged_at is not the expected type, validation failed.")
      obj.expected_shipped_at&.is_a?(String) != false || raise("Passed value for field obj.expected_shipped_at is not the expected type, validation failed.")
      obj.shipped_at&.is_a?(String) != false || raise("Passed value for field obj.shipped_at is not the expected type, validation failed.")
      obj.canceled_at&.is_a?(String) != false || raise("Passed value for field obj.canceled_at is not the expected type, validation failed.")
      obj.cancel_reason&.is_a?(String) != false || raise("Passed value for field obj.cancel_reason is not the expected type, validation failed.")
      obj.failed_at&.is_a?(String) != false || raise("Passed value for field obj.failed_at is not the expected type, validation failed.")
      obj.failure_reason&.is_a?(String) != false || raise("Passed value for field obj.failure_reason is not the expected type, validation failed.")
    end
  end
end