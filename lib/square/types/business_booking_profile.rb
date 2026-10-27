# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A seller's business booking profile, including booking policy, appointment settings, etc.
    class BusinessBookingProfile < Internal::Types::Model
      field :seller_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :booking_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :customer_timezone_choice, -> { Square::Types::BusinessBookingProfileCustomerTimezoneChoice }, optional: true, nullable: false

      field :booking_policy, -> { Square::Types::BusinessBookingProfileBookingPolicy }, optional: true, nullable: false

      field :allow_user_cancel, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :business_appointment_settings, -> { Square::Types::BusinessAppointmentSettings }, optional: true, nullable: false

      field :support_seller_level_writes, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
