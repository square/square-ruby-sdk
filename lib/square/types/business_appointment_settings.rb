# frozen_string_literal: true
require_relative "business_appointment_settings_booking_location_type"
require_relative "business_appointment_settings_alignment_time"
require_relative "business_appointment_settings_max_appointments_per_day_limit_type"
require_relative "money"
require_relative "business_appointment_settings_cancellation_policy"
require "ostruct"
require "json"

module SquareApiClient
# The service appointment settings, including where and how the service is
#  provided.
  class BusinessAppointmentSettings
  # @return [Array<SquareApiClient::BusinessAppointmentSettingsBookingLocationType>] Types of the location allowed for bookings.
#  See
#  ttingsBookingLocationType](#type-businessappointmentsettingsbookinglocationtype)
#  for possible values
    attr_reader :location_types
  # @return [SquareApiClient::BusinessAppointmentSettingsAlignmentTime] The time unit of the service duration for bookings.
#  See
#  ppointmentSettingsAlignmentTime](#type-businessappointmentsettingsalignmenttime)
#  for possible values
    attr_reader :alignment_time
  # @return [Integer] The minimum lead time in seconds before a service can be booked. A booking must
#  be created at least this amount of time before its starting time.
    attr_reader :min_booking_lead_time_seconds
  # @return [Integer] The maximum lead time in seconds before a service can be booked. A booking must
#  be created at most this amount of time before its starting time.
    attr_reader :max_booking_lead_time_seconds
  # @return [Boolean] Indicates whether a customer can choose from all available time slots and have a
#  staff member assigned
#  automatically (`true`) or not (`false`).
    attr_reader :any_team_member_booking_enabled
  # @return [Boolean] Indicates whether a customer can book multiple services in a single online
#  booking.
    attr_reader :multiple_service_booking_enabled
  # @return [SquareApiClient::BusinessAppointmentSettingsMaxAppointmentsPerDayLimitType] Indicates whether the daily appointment limit applies to team members or to
#  business locations.
#  See
#  erDayLimitType](#type-businessappointmentsettingsmaxappointmentsperdaylimittype)
#  for possible values
    attr_reader :max_appointments_per_day_limit_type
  # @return [Integer] The maximum number of daily appointments per team member or per location.
    attr_reader :max_appointments_per_day_limit
  # @return [Integer] The cut-off time in seconds for allowing clients to cancel or reschedule an
#  appointment.
    attr_reader :cancellation_window_seconds
  # @return [SquareApiClient::Money] The flat-fee amount charged for a no-show booking.
    attr_reader :cancellation_fee_money
  # @return [SquareApiClient::BusinessAppointmentSettingsCancellationPolicy] The cancellation policy adopted by the seller.
#  See
#  SettingsCancellationPolicy](#type-businessappointmentsettingscancellationpolicy)
#  for possible values
    attr_reader :cancellation_policy
  # @return [String] The free-form text of the seller's cancellation policy.
    attr_reader :cancellation_policy_text
  # @return [Boolean] Indicates whether customers has an assigned staff member (`true`) or can select
#  s staff member of their choice (`false`).
    attr_reader :skip_booking_flow_staff_selection
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param location_types [Array<SquareApiClient::BusinessAppointmentSettingsBookingLocationType>] Types of the location allowed for bookings.
#  See
#  ttingsBookingLocationType](#type-businessappointmentsettingsbookinglocationtype)
#  for possible values
    # @param alignment_time [SquareApiClient::BusinessAppointmentSettingsAlignmentTime] The time unit of the service duration for bookings.
#  See
#  ppointmentSettingsAlignmentTime](#type-businessappointmentsettingsalignmenttime)
#  for possible values
    # @param min_booking_lead_time_seconds [Integer] The minimum lead time in seconds before a service can be booked. A booking must
#  be created at least this amount of time before its starting time.
    # @param max_booking_lead_time_seconds [Integer] The maximum lead time in seconds before a service can be booked. A booking must
#  be created at most this amount of time before its starting time.
    # @param any_team_member_booking_enabled [Boolean] Indicates whether a customer can choose from all available time slots and have a
#  staff member assigned
#  automatically (`true`) or not (`false`).
    # @param multiple_service_booking_enabled [Boolean] Indicates whether a customer can book multiple services in a single online
#  booking.
    # @param max_appointments_per_day_limit_type [SquareApiClient::BusinessAppointmentSettingsMaxAppointmentsPerDayLimitType] Indicates whether the daily appointment limit applies to team members or to
#  business locations.
#  See
#  erDayLimitType](#type-businessappointmentsettingsmaxappointmentsperdaylimittype)
#  for possible values
    # @param max_appointments_per_day_limit [Integer] The maximum number of daily appointments per team member or per location.
    # @param cancellation_window_seconds [Integer] The cut-off time in seconds for allowing clients to cancel or reschedule an
#  appointment.
    # @param cancellation_fee_money [SquareApiClient::Money] The flat-fee amount charged for a no-show booking.
    # @param cancellation_policy [SquareApiClient::BusinessAppointmentSettingsCancellationPolicy] The cancellation policy adopted by the seller.
#  See
#  SettingsCancellationPolicy](#type-businessappointmentsettingscancellationpolicy)
#  for possible values
    # @param cancellation_policy_text [String] The free-form text of the seller's cancellation policy.
    # @param skip_booking_flow_staff_selection [Boolean] Indicates whether customers has an assigned staff member (`true`) or can select
#  s staff member of their choice (`false`).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::BusinessAppointmentSettings]
    def initialize(location_types: OMIT, alignment_time: OMIT, min_booking_lead_time_seconds: OMIT, max_booking_lead_time_seconds: OMIT, any_team_member_booking_enabled: OMIT, multiple_service_booking_enabled: OMIT, max_appointments_per_day_limit_type: OMIT, max_appointments_per_day_limit: OMIT, cancellation_window_seconds: OMIT, cancellation_fee_money: OMIT, cancellation_policy: OMIT, cancellation_policy_text: OMIT, skip_booking_flow_staff_selection: OMIT, additional_properties: nil)
      @location_types = location_types if location_types != OMIT
      @alignment_time = alignment_time if alignment_time != OMIT
      @min_booking_lead_time_seconds = min_booking_lead_time_seconds if min_booking_lead_time_seconds != OMIT
      @max_booking_lead_time_seconds = max_booking_lead_time_seconds if max_booking_lead_time_seconds != OMIT
      @any_team_member_booking_enabled = any_team_member_booking_enabled if any_team_member_booking_enabled != OMIT
      @multiple_service_booking_enabled = multiple_service_booking_enabled if multiple_service_booking_enabled != OMIT
      @max_appointments_per_day_limit_type = max_appointments_per_day_limit_type if max_appointments_per_day_limit_type != OMIT
      @max_appointments_per_day_limit = max_appointments_per_day_limit if max_appointments_per_day_limit != OMIT
      @cancellation_window_seconds = cancellation_window_seconds if cancellation_window_seconds != OMIT
      @cancellation_fee_money = cancellation_fee_money if cancellation_fee_money != OMIT
      @cancellation_policy = cancellation_policy if cancellation_policy != OMIT
      @cancellation_policy_text = cancellation_policy_text if cancellation_policy_text != OMIT
      @skip_booking_flow_staff_selection = skip_booking_flow_staff_selection if skip_booking_flow_staff_selection != OMIT
      @additional_properties = additional_properties
      @_field_set = { "location_types": location_types, "alignment_time": alignment_time, "min_booking_lead_time_seconds": min_booking_lead_time_seconds, "max_booking_lead_time_seconds": max_booking_lead_time_seconds, "any_team_member_booking_enabled": any_team_member_booking_enabled, "multiple_service_booking_enabled": multiple_service_booking_enabled, "max_appointments_per_day_limit_type": max_appointments_per_day_limit_type, "max_appointments_per_day_limit": max_appointments_per_day_limit, "cancellation_window_seconds": cancellation_window_seconds, "cancellation_fee_money": cancellation_fee_money, "cancellation_policy": cancellation_policy, "cancellation_policy_text": cancellation_policy_text, "skip_booking_flow_staff_selection": skip_booking_flow_staff_selection }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BusinessAppointmentSettings
    #
    # @param json_object [String] 
    # @return [SquareApiClient::BusinessAppointmentSettings]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      location_types = parsed_json["location_types"]
      alignment_time = parsed_json["alignment_time"]
      min_booking_lead_time_seconds = parsed_json["min_booking_lead_time_seconds"]
      max_booking_lead_time_seconds = parsed_json["max_booking_lead_time_seconds"]
      any_team_member_booking_enabled = parsed_json["any_team_member_booking_enabled"]
      multiple_service_booking_enabled = parsed_json["multiple_service_booking_enabled"]
      max_appointments_per_day_limit_type = parsed_json["max_appointments_per_day_limit_type"]
      max_appointments_per_day_limit = parsed_json["max_appointments_per_day_limit"]
      cancellation_window_seconds = parsed_json["cancellation_window_seconds"]
      unless parsed_json["cancellation_fee_money"].nil?
        cancellation_fee_money = parsed_json["cancellation_fee_money"].to_json
        cancellation_fee_money = SquareApiClient::Money.from_json(json_object: cancellation_fee_money)
      else
        cancellation_fee_money = nil
      end
      cancellation_policy = parsed_json["cancellation_policy"]
      cancellation_policy_text = parsed_json["cancellation_policy_text"]
      skip_booking_flow_staff_selection = parsed_json["skip_booking_flow_staff_selection"]
      new(
        location_types: location_types,
        alignment_time: alignment_time,
        min_booking_lead_time_seconds: min_booking_lead_time_seconds,
        max_booking_lead_time_seconds: max_booking_lead_time_seconds,
        any_team_member_booking_enabled: any_team_member_booking_enabled,
        multiple_service_booking_enabled: multiple_service_booking_enabled,
        max_appointments_per_day_limit_type: max_appointments_per_day_limit_type,
        max_appointments_per_day_limit: max_appointments_per_day_limit,
        cancellation_window_seconds: cancellation_window_seconds,
        cancellation_fee_money: cancellation_fee_money,
        cancellation_policy: cancellation_policy,
        cancellation_policy_text: cancellation_policy_text,
        skip_booking_flow_staff_selection: skip_booking_flow_staff_selection,
        additional_properties: struct
      )
    end
# Serialize an instance of BusinessAppointmentSettings to a JSON object
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
      obj.location_types&.is_a?(Array) != false || raise("Passed value for field obj.location_types is not the expected type, validation failed.")
      obj.alignment_time&.is_a?(SquareApiClient::BusinessAppointmentSettingsAlignmentTime) != false || raise("Passed value for field obj.alignment_time is not the expected type, validation failed.")
      obj.min_booking_lead_time_seconds&.is_a?(Integer) != false || raise("Passed value for field obj.min_booking_lead_time_seconds is not the expected type, validation failed.")
      obj.max_booking_lead_time_seconds&.is_a?(Integer) != false || raise("Passed value for field obj.max_booking_lead_time_seconds is not the expected type, validation failed.")
      obj.any_team_member_booking_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.any_team_member_booking_enabled is not the expected type, validation failed.")
      obj.multiple_service_booking_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.multiple_service_booking_enabled is not the expected type, validation failed.")
      obj.max_appointments_per_day_limit_type&.is_a?(SquareApiClient::BusinessAppointmentSettingsMaxAppointmentsPerDayLimitType) != false || raise("Passed value for field obj.max_appointments_per_day_limit_type is not the expected type, validation failed.")
      obj.max_appointments_per_day_limit&.is_a?(Integer) != false || raise("Passed value for field obj.max_appointments_per_day_limit is not the expected type, validation failed.")
      obj.cancellation_window_seconds&.is_a?(Integer) != false || raise("Passed value for field obj.cancellation_window_seconds is not the expected type, validation failed.")
      obj.cancellation_fee_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.cancellation_fee_money)
      obj.cancellation_policy&.is_a?(SquareApiClient::BusinessAppointmentSettingsCancellationPolicy) != false || raise("Passed value for field obj.cancellation_policy is not the expected type, validation failed.")
      obj.cancellation_policy_text&.is_a?(String) != false || raise("Passed value for field obj.cancellation_policy_text is not the expected type, validation failed.")
      obj.skip_booking_flow_staff_selection&.is_a?(Boolean) != false || raise("Passed value for field obj.skip_booking_flow_staff_selection is not the expected type, validation failed.")
    end
  end
end