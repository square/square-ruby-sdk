# frozen_string_literal: true
require_relative "business_booking_profile_customer_timezone_choice"
require_relative "business_booking_profile_booking_policy"
require_relative "business_appointment_settings"
require "ostruct"
require "json"

module square.rb
# A seller's business booking profile, including booking policy, appointment
#  settings, etc.
  class BusinessBookingProfile
  # @return [String] The ID of the seller, obtainable using the Merchants API.
    attr_reader :seller_id
  # @return [String] The RFC 3339 timestamp specifying the booking's creation time.
    attr_reader :created_at
  # @return [Boolean] Indicates whether the seller is open for booking.
    attr_reader :booking_enabled
  # @return [square.rb::BusinessBookingProfileCustomerTimezoneChoice] The choice of customer's time zone information of a booking.
#  The Square online booking site and all notifications to customers uses either
#  the seller location’s time zone
#  or the time zone the customer chooses at booking.
#  See
#  ofileCustomerTimezoneChoice](#type-businessbookingprofilecustomertimezonechoice)
#  for possible values
    attr_reader :customer_timezone_choice
  # @return [square.rb::BusinessBookingProfileBookingPolicy] The policy for the seller to automatically accept booking requests
#  (`ACCEPT_ALL`) or not (`REQUIRES_ACCEPTANCE`).
#  See
#  [BusinessBookingProfileBookingPolicy](#type-businessbookingprofilebookingpolicy)
#  for possible values
    attr_reader :booking_policy
  # @return [Boolean] Indicates whether customers can cancel or reschedule their own bookings (`true`)
#  or not (`false`).
    attr_reader :allow_user_cancel
  # @return [square.rb::BusinessAppointmentSettings] Settings for appointment-type bookings.
    attr_reader :business_appointment_settings
  # @return [Boolean] Indicates whether the seller's subscription to Square Appointments supports
#  creating, updating or canceling an appointment through the API (`true`) or not
#  (`false`) using seller permission.
    attr_reader :support_seller_level_writes
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param seller_id [String] The ID of the seller, obtainable using the Merchants API.
    # @param created_at [String] The RFC 3339 timestamp specifying the booking's creation time.
    # @param booking_enabled [Boolean] Indicates whether the seller is open for booking.
    # @param customer_timezone_choice [square.rb::BusinessBookingProfileCustomerTimezoneChoice] The choice of customer's time zone information of a booking.
#  The Square online booking site and all notifications to customers uses either
#  the seller location’s time zone
#  or the time zone the customer chooses at booking.
#  See
#  ofileCustomerTimezoneChoice](#type-businessbookingprofilecustomertimezonechoice)
#  for possible values
    # @param booking_policy [square.rb::BusinessBookingProfileBookingPolicy] The policy for the seller to automatically accept booking requests
#  (`ACCEPT_ALL`) or not (`REQUIRES_ACCEPTANCE`).
#  See
#  [BusinessBookingProfileBookingPolicy](#type-businessbookingprofilebookingpolicy)
#  for possible values
    # @param allow_user_cancel [Boolean] Indicates whether customers can cancel or reschedule their own bookings (`true`)
#  or not (`false`).
    # @param business_appointment_settings [square.rb::BusinessAppointmentSettings] Settings for appointment-type bookings.
    # @param support_seller_level_writes [Boolean] Indicates whether the seller's subscription to Square Appointments supports
#  creating, updating or canceling an appointment through the API (`true`) or not
#  (`false`) using seller permission.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BusinessBookingProfile]
    def initialize(seller_id: OMIT, created_at: OMIT, booking_enabled: OMIT, customer_timezone_choice: OMIT, booking_policy: OMIT, allow_user_cancel: OMIT, business_appointment_settings: OMIT, support_seller_level_writes: OMIT, additional_properties: nil)
      @seller_id = seller_id if seller_id != OMIT
      @created_at = created_at if created_at != OMIT
      @booking_enabled = booking_enabled if booking_enabled != OMIT
      @customer_timezone_choice = customer_timezone_choice if customer_timezone_choice != OMIT
      @booking_policy = booking_policy if booking_policy != OMIT
      @allow_user_cancel = allow_user_cancel if allow_user_cancel != OMIT
      @business_appointment_settings = business_appointment_settings if business_appointment_settings != OMIT
      @support_seller_level_writes = support_seller_level_writes if support_seller_level_writes != OMIT
      @additional_properties = additional_properties
      @_field_set = { "seller_id": seller_id, "created_at": created_at, "booking_enabled": booking_enabled, "customer_timezone_choice": customer_timezone_choice, "booking_policy": booking_policy, "allow_user_cancel": allow_user_cancel, "business_appointment_settings": business_appointment_settings, "support_seller_level_writes": support_seller_level_writes }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BusinessBookingProfile
    #
    # @param json_object [String] 
    # @return [square.rb::BusinessBookingProfile]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      seller_id = parsed_json["seller_id"]
      created_at = parsed_json["created_at"]
      booking_enabled = parsed_json["booking_enabled"]
      customer_timezone_choice = parsed_json["customer_timezone_choice"]
      booking_policy = parsed_json["booking_policy"]
      allow_user_cancel = parsed_json["allow_user_cancel"]
      unless parsed_json["business_appointment_settings"].nil?
        business_appointment_settings = parsed_json["business_appointment_settings"].to_json
        business_appointment_settings = square.rb::BusinessAppointmentSettings.from_json(json_object: business_appointment_settings)
      else
        business_appointment_settings = nil
      end
      support_seller_level_writes = parsed_json["support_seller_level_writes"]
      new(
        seller_id: seller_id,
        created_at: created_at,
        booking_enabled: booking_enabled,
        customer_timezone_choice: customer_timezone_choice,
        booking_policy: booking_policy,
        allow_user_cancel: allow_user_cancel,
        business_appointment_settings: business_appointment_settings,
        support_seller_level_writes: support_seller_level_writes,
        additional_properties: struct
      )
    end
# Serialize an instance of BusinessBookingProfile to a JSON object
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
      obj.seller_id&.is_a?(String) != false || raise("Passed value for field obj.seller_id is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.booking_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.booking_enabled is not the expected type, validation failed.")
      obj.customer_timezone_choice&.is_a?(square.rb::BusinessBookingProfileCustomerTimezoneChoice) != false || raise("Passed value for field obj.customer_timezone_choice is not the expected type, validation failed.")
      obj.booking_policy&.is_a?(square.rb::BusinessBookingProfileBookingPolicy) != false || raise("Passed value for field obj.booking_policy is not the expected type, validation failed.")
      obj.allow_user_cancel&.is_a?(Boolean) != false || raise("Passed value for field obj.allow_user_cancel is not the expected type, validation failed.")
      obj.business_appointment_settings.nil? || square.rb::BusinessAppointmentSettings.validate_raw(obj: obj.business_appointment_settings)
      obj.support_seller_level_writes&.is_a?(Boolean) != false || raise("Passed value for field obj.support_seller_level_writes is not the expected type, validation failed.")
    end
  end
end