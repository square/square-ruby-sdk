# frozen_string_literal: true

module Square
  module Types
    # Contains details necessary to fulfill a pickup order.
    class FulfillmentPickupDetails < Internal::Types::Model
      field :recipient, Square::Types::FulfillmentRecipient, optional: true, nullable: false
      field :expires_at, String, optional: true, nullable: false
      field :auto_complete_duration, String, optional: true, nullable: false
      field :schedule_type, Square::Types::FulfillmentPickupDetailsScheduleType, optional: true, nullable: false
      field :pickup_at, String, optional: true, nullable: false
      field :pickup_window_duration, String, optional: true, nullable: false
      field :prep_time_duration, String, optional: true, nullable: false
      field :note, String, optional: true, nullable: false
      field :placed_at, String, optional: true, nullable: false
      field :accepted_at, String, optional: true, nullable: false
      field :rejected_at, String, optional: true, nullable: false
      field :ready_at, String, optional: true, nullable: false
      field :expired_at, String, optional: true, nullable: false
      field :picked_up_at, String, optional: true, nullable: false
      field :canceled_at, String, optional: true, nullable: false
      field :cancel_reason, String, optional: true, nullable: false
      field :is_curbside_pickup, Internal::Types::Boolean, optional: true, nullable: false
      field :curbside_pickup_details, Square::Types::FulfillmentPickupDetailsCurbsidePickupDetails, optional: true, nullable: false

    end
  end
end
