# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when an automatic scheduled payment for an [Invoice](entity:Invoice) has failed.
    class InvoiceScheduledChargeFailedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::InvoiceScheduledChargeFailedEventData }, optional: true, nullable: false
    end
  end
end
