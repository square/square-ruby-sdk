# frozen_string_literal: true

module Square
    module Types
        # A seller's business booking profile, including booking policy, appointment settings, etc.
        class BusinessBookingProfile < Internal::Types::Model
            field :seller_id, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :booking_enabled, Internal::Types::Boolean, optional: true, nullable: false
            field :customer_timezone_choice, Square::BusinessBookingProfileCustomerTimezoneChoice, optional: true, nullable: false
            field :booking_policy, Square::BusinessBookingProfileBookingPolicy, optional: true, nullable: false
            field :allow_user_cancel, Internal::Types::Boolean, optional: true, nullable: false
            field :business_appointment_settings, Square::BusinessAppointmentSettings, optional: true, nullable: false
            field :support_seller_level_writes, Internal::Types::Boolean, optional: true, nullable: false
        end
    end
end
