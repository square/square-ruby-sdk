# frozen_string_literal: true

module Square
  module Types
    # Published when an automatic scheduled payment for an [Invoice](entity:Invoice) has failed.
    class InvoiceScheduledChargeFailedEvent < Internal::Types::Model
      field :merchant_id, String, optional: true, nullable: false
      field :type, String, optional: true, nullable: false
      field :event_id, String, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :data, Square::InvoiceScheduledChargeFailedEventData, optional: true, nullable: false

    end
  end
end
