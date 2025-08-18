# frozen_string_literal: true

module Square
  module Types
    # Published when an [Invoice](entity:Invoice) is updated.
    class InvoiceUpdatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: false
      field :type, -> { String }, optional: true, nullable: false
      field :event_id, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :data, -> { Square::Types::InvoiceUpdatedEventData }, optional: true, nullable: false

    end
  end
end
