# frozen_string_literal: true

module Square
    module Types
        # The service appointment settings, including where and how the service is provided.
        class BusinessAppointmentSettings < Internal::Types::Model
            field :location_types, Internal::Types::Array[Square::BusinessAppointmentSettingsBookingLocationType], optional: true, nullable: false
            field :alignment_time, Square::BusinessAppointmentSettingsAlignmentTime, optional: true, nullable: false
            field :min_booking_lead_time_seconds, Integer, optional: true, nullable: false
            field :max_booking_lead_time_seconds, Integer, optional: true, nullable: false
            field :any_team_member_booking_enabled, Internal::Types::Boolean, optional: true, nullable: false
            field :multiple_service_booking_enabled, Internal::Types::Boolean, optional: true, nullable: false
            field :max_appointments_per_day_limit_type, Square::BusinessAppointmentSettingsMaxAppointmentsPerDayLimitType, optional: true, nullable: false
            field :max_appointments_per_day_limit, Integer, optional: true, nullable: false
            field :cancellation_window_seconds, Integer, optional: true, nullable: false
            field :cancellation_fee_money, Square::Money, optional: true, nullable: false
            field :cancellation_policy, Square::BusinessAppointmentSettingsCancellationPolicy, optional: true, nullable: false
            field :cancellation_policy_text, String, optional: true, nullable: false
            field :skip_booking_flow_staff_selection, Internal::Types::Boolean, optional: true, nullable: false
        end
    end
end
