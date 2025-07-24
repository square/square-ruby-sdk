# frozen_string_literal: true
require_relative "booking_status"
require_relative "appointment_segment"
require_relative "business_appointment_settings_booking_location_type"
require_relative "booking_creator_details"
require_relative "booking_booking_source"
require_relative "address"
require "ostruct"
require "json"

module square.rb
# Represents a booking as a time-bound service contract for a seller's staff
#  member to provide a specified service
#  at a given location to a requesting customer in one or more appointment
#  segments.
  class Booking
  # @return [String] A unique ID of this object representing a booking.
    attr_reader :id
  # @return [Integer] The revision number for the booking used for optimistic concurrency.
    attr_reader :version
  # @return [square.rb::BookingStatus] The status of the booking, describing where the booking stands with respect to
#  the booking state machine.
#  See [BookingStatus](#type-bookingstatus) for possible values
    attr_reader :status
  # @return [String] The RFC 3339 timestamp specifying the creation time of this booking.
    attr_reader :created_at
  # @return [String] The RFC 3339 timestamp specifying the most recent update time of this booking.
    attr_reader :updated_at
  # @return [String] The RFC 3339 timestamp specifying the starting time of this booking.
    attr_reader :start_at
  # @return [String] The ID of the [Location](entity:Location) object representing the location where
#  the booked service is provided. Once set when the booking is created, its value
#  cannot be changed.
    attr_reader :location_id
  # @return [String] The ID of the [Customer](entity:Customer) object representing the customer
#  receiving the booked service.
    attr_reader :customer_id
  # @return [String] The free-text field for the customer to supply notes about the booking. For
#  example, the note can be preferences that cannot be expressed by supported
#  attributes of a relevant [CatalogObject](entity:CatalogObject) instance.
    attr_reader :customer_note
  # @return [String] The free-text field for the seller to supply notes about the booking. For
#  example, the note can be preferences that cannot be expressed by supported
#  attributes of a specific [CatalogObject](entity:CatalogObject) instance.
#  This field should not be visible to customers.
    attr_reader :seller_note
  # @return [Array<square.rb::AppointmentSegment>] A list of appointment segments for this booking.
    attr_reader :appointment_segments
  # @return [Integer] Additional time at the end of a booking.
#  Applications should not make this field visible to customers of a seller.
    attr_reader :transition_time_minutes
  # @return [Boolean] Whether the booking is of a full business day.
    attr_reader :all_day
  # @return [square.rb::BusinessAppointmentSettingsBookingLocationType] The type of location where the booking is held.
#  See
#  ttingsBookingLocationType](#type-businessappointmentsettingsbookinglocationtype)
#  for possible values
    attr_reader :location_type
  # @return [square.rb::BookingCreatorDetails] Information about the booking creator.
    attr_reader :creator_details
  # @return [square.rb::BookingBookingSource] The source of the booking.
#  Access to this field requires seller-level permissions.
#  See [BookingBookingSource](#type-bookingbookingsource) for possible values
    attr_reader :source
  # @return [square.rb::Address] Stores a customer address if the location type is `CUSTOMER_LOCATION`.
    attr_reader :address
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique ID of this object representing a booking.
    # @param version [Integer] The revision number for the booking used for optimistic concurrency.
    # @param status [square.rb::BookingStatus] The status of the booking, describing where the booking stands with respect to
#  the booking state machine.
#  See [BookingStatus](#type-bookingstatus) for possible values
    # @param created_at [String] The RFC 3339 timestamp specifying the creation time of this booking.
    # @param updated_at [String] The RFC 3339 timestamp specifying the most recent update time of this booking.
    # @param start_at [String] The RFC 3339 timestamp specifying the starting time of this booking.
    # @param location_id [String] The ID of the [Location](entity:Location) object representing the location where
#  the booked service is provided. Once set when the booking is created, its value
#  cannot be changed.
    # @param customer_id [String] The ID of the [Customer](entity:Customer) object representing the customer
#  receiving the booked service.
    # @param customer_note [String] The free-text field for the customer to supply notes about the booking. For
#  example, the note can be preferences that cannot be expressed by supported
#  attributes of a relevant [CatalogObject](entity:CatalogObject) instance.
    # @param seller_note [String] The free-text field for the seller to supply notes about the booking. For
#  example, the note can be preferences that cannot be expressed by supported
#  attributes of a specific [CatalogObject](entity:CatalogObject) instance.
#  This field should not be visible to customers.
    # @param appointment_segments [Array<square.rb::AppointmentSegment>] A list of appointment segments for this booking.
    # @param transition_time_minutes [Integer] Additional time at the end of a booking.
#  Applications should not make this field visible to customers of a seller.
    # @param all_day [Boolean] Whether the booking is of a full business day.
    # @param location_type [square.rb::BusinessAppointmentSettingsBookingLocationType] The type of location where the booking is held.
#  See
#  ttingsBookingLocationType](#type-businessappointmentsettingsbookinglocationtype)
#  for possible values
    # @param creator_details [square.rb::BookingCreatorDetails] Information about the booking creator.
    # @param source [square.rb::BookingBookingSource] The source of the booking.
#  Access to this field requires seller-level permissions.
#  See [BookingBookingSource](#type-bookingbookingsource) for possible values
    # @param address [square.rb::Address] Stores a customer address if the location type is `CUSTOMER_LOCATION`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::Booking]
    def initialize(id: OMIT, version: OMIT, status: OMIT, created_at: OMIT, updated_at: OMIT, start_at: OMIT, location_id: OMIT, customer_id: OMIT, customer_note: OMIT, seller_note: OMIT, appointment_segments: OMIT, transition_time_minutes: OMIT, all_day: OMIT, location_type: OMIT, creator_details: OMIT, source: OMIT, address: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @version = version if version != OMIT
      @status = status if status != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @start_at = start_at if start_at != OMIT
      @location_id = location_id if location_id != OMIT
      @customer_id = customer_id if customer_id != OMIT
      @customer_note = customer_note if customer_note != OMIT
      @seller_note = seller_note if seller_note != OMIT
      @appointment_segments = appointment_segments if appointment_segments != OMIT
      @transition_time_minutes = transition_time_minutes if transition_time_minutes != OMIT
      @all_day = all_day if all_day != OMIT
      @location_type = location_type if location_type != OMIT
      @creator_details = creator_details if creator_details != OMIT
      @source = source if source != OMIT
      @address = address if address != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "version": version, "status": status, "created_at": created_at, "updated_at": updated_at, "start_at": start_at, "location_id": location_id, "customer_id": customer_id, "customer_note": customer_note, "seller_note": seller_note, "appointment_segments": appointment_segments, "transition_time_minutes": transition_time_minutes, "all_day": all_day, "location_type": location_type, "creator_details": creator_details, "source": source, "address": address }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Booking
    #
    # @param json_object [String] 
    # @return [square.rb::Booking]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      version = parsed_json["version"]
      status = parsed_json["status"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      start_at = parsed_json["start_at"]
      location_id = parsed_json["location_id"]
      customer_id = parsed_json["customer_id"]
      customer_note = parsed_json["customer_note"]
      seller_note = parsed_json["seller_note"]
      appointment_segments = parsed_json["appointment_segments"]&.map do | item |
  item = item.to_json
  square.rb::AppointmentSegment.from_json(json_object: item)
end
      transition_time_minutes = parsed_json["transition_time_minutes"]
      all_day = parsed_json["all_day"]
      location_type = parsed_json["location_type"]
      unless parsed_json["creator_details"].nil?
        creator_details = parsed_json["creator_details"].to_json
        creator_details = square.rb::BookingCreatorDetails.from_json(json_object: creator_details)
      else
        creator_details = nil
      end
      source = parsed_json["source"]
      unless parsed_json["address"].nil?
        address = parsed_json["address"].to_json
        address = square.rb::Address.from_json(json_object: address)
      else
        address = nil
      end
      new(
        id: id,
        version: version,
        status: status,
        created_at: created_at,
        updated_at: updated_at,
        start_at: start_at,
        location_id: location_id,
        customer_id: customer_id,
        customer_note: customer_note,
        seller_note: seller_note,
        appointment_segments: appointment_segments,
        transition_time_minutes: transition_time_minutes,
        all_day: all_day,
        location_type: location_type,
        creator_details: creator_details,
        source: source,
        address: address,
        additional_properties: struct
      )
    end
# Serialize an instance of Booking to a JSON object
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
      obj.version&.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.status&.is_a?(square.rb::BookingStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.start_at&.is_a?(String) != false || raise("Passed value for field obj.start_at is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.customer_id&.is_a?(String) != false || raise("Passed value for field obj.customer_id is not the expected type, validation failed.")
      obj.customer_note&.is_a?(String) != false || raise("Passed value for field obj.customer_note is not the expected type, validation failed.")
      obj.seller_note&.is_a?(String) != false || raise("Passed value for field obj.seller_note is not the expected type, validation failed.")
      obj.appointment_segments&.is_a?(Array) != false || raise("Passed value for field obj.appointment_segments is not the expected type, validation failed.")
      obj.transition_time_minutes&.is_a?(Integer) != false || raise("Passed value for field obj.transition_time_minutes is not the expected type, validation failed.")
      obj.all_day&.is_a?(Boolean) != false || raise("Passed value for field obj.all_day is not the expected type, validation failed.")
      obj.location_type&.is_a?(square.rb::BusinessAppointmentSettingsBookingLocationType) != false || raise("Passed value for field obj.location_type is not the expected type, validation failed.")
      obj.creator_details.nil? || square.rb::BookingCreatorDetails.validate_raw(obj: obj.creator_details)
      obj.source&.is_a?(square.rb::BookingBookingSource) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
      obj.address.nil? || square.rb::Address.validate_raw(obj: obj.address)
    end
  end
end