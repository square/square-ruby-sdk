# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Contains the details necessary to fulfill a shipment order.
    class FulfillmentShipmentDetails < Internal::Types::Model
      field :recipient, -> { Square::Types::FulfillmentRecipient }, optional: true, nullable: false

      field :carrier, -> { String }, optional: true, nullable: true

      field :shipping_note, -> { String }, optional: true, nullable: true

      field :shipping_type, -> { String }, optional: true, nullable: true

      field :tracking_number, -> { String }, optional: true, nullable: true

      field :tracking_url, -> { String }, optional: true, nullable: true

      field :placed_at, -> { String }, optional: true, nullable: false

      field :in_progress_at, -> { String }, optional: true, nullable: false

      field :packaged_at, -> { String }, optional: true, nullable: false

      field :expected_shipped_at, -> { String }, optional: true, nullable: true

      field :shipped_at, -> { String }, optional: true, nullable: false

      field :canceled_at, -> { String }, optional: true, nullable: true

      field :cancel_reason, -> { String }, optional: true, nullable: true

      field :failed_at, -> { String }, optional: true, nullable: false

      field :failure_reason, -> { String }, optional: true, nullable: true
    end
  end
end
