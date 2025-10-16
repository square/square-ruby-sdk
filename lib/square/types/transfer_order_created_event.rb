# frozen_string_literal: true

module Square
  module Types
    # Published when a transfer_order is created.
    class TransferOrderCreatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: false
      field :type, -> { String }, optional: true, nullable: false
      field :event_id, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :data, -> { Square::Types::TransferOrderCreatedEventData }, optional: true, nullable: false
    end
  end
end
