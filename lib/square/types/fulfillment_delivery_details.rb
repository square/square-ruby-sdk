# frozen_string_literal: true

module Square
  module Types
    # Describes delivery details of an order fulfillment.
    class FulfillmentDeliveryDetails < Internal::Types::Model
      field :recipient, Square::FulfillmentRecipient, optional: true, nullable: false
      field :schedule_type, Square::FulfillmentDeliveryDetailsOrderFulfillmentDeliveryDetailsScheduleType, optional: true, nullable: false
      field :placed_at, String, optional: true, nullable: false
      field :deliver_at, String, optional: true, nullable: false
      field :prep_time_duration, String, optional: true, nullable: false
      field :delivery_window_duration, String, optional: true, nullable: false
      field :note, String, optional: true, nullable: false
      field :completed_at, String, optional: true, nullable: false
      field :in_progress_at, String, optional: true, nullable: false
      field :rejected_at, String, optional: true, nullable: false
      field :ready_at, String, optional: true, nullable: false
      field :delivered_at, String, optional: true, nullable: false
      field :canceled_at, String, optional: true, nullable: false
      field :cancel_reason, String, optional: true, nullable: false
      field :courier_pickup_at, String, optional: true, nullable: false
      field :courier_pickup_window_duration, String, optional: true, nullable: false
      field :is_no_contact_delivery, Internal::Types::Boolean, optional: true, nullable: false
      field :dropoff_notes, String, optional: true, nullable: false
      field :courier_provider_name, String, optional: true, nullable: false
      field :courier_support_phone_number, String, optional: true, nullable: false
      field :square_delivery_id, String, optional: true, nullable: false
      field :external_delivery_id, String, optional: true, nullable: false
      field :managed_delivery, Internal::Types::Boolean, optional: true, nullable: false

    end
  end
end
