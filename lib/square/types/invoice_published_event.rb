# frozen_string_literal: true

module Square
  # Published when an [Invoice](entity:Invoice) transitions from a draft to a non-draft status.
  class InvoicePublishedEvent < Internal::Types::Model
    field :merchant_id, String, optional: true, nullable: false
    field :type, String, optional: true, nullable: false
    field :event_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :data, Square::InvoicePublishedEventData, optional: true, nullable: false

  end
end
