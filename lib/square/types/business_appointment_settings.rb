# frozen_string_literal: true

module Square
  module Types
    # The service appointment settings, including where and how the service is provided.
    class BusinessAppointmentSettings < Internal::Types::Model
      field :location_types, lambda {
        Internal::Types::Array[Square::Types::BusinessAppointmentSettingsBookingLocationType]
      }, optional: true, nullable: false
      field :alignment_time, lambda {
        Square::Types::BusinessAppointmentSettingsAlignmentTime
      }, optional: true, nullable: false
      field :min_booking_lead_time_seconds, -> { Integer }, optional: true, nullable: false
      field :max_booking_lead_time_seconds, -> { Integer }, optional: true, nullable: false
      field :any_team_member_booking_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :multiple_service_booking_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :max_appointments_per_day_limit_type, lambda {
        Square::Types::BusinessAppointmentSettingsMaxAppointmentsPerDayLimitType
      }, optional: true, nullable: false
      field :max_appointments_per_day_limit, -> { Integer }, optional: true, nullable: false
      field :cancellation_window_seconds, -> { Integer }, optional: true, nullable: false
      field :cancellation_fee_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :cancellation_policy, lambda {
        Square::Types::BusinessAppointmentSettingsCancellationPolicy
      }, optional: true, nullable: false
      field :cancellation_policy_text, -> { String }, optional: true, nullable: false
      field :skip_booking_flow_staff_selection, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
