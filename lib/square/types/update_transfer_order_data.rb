# frozen_string_literal: true

module Square
  module Types
    # Data model for updating a transfer order. All fields are optional.
    class UpdateTransferOrderData < Internal::Types::Model
      field :source_location_id, -> { String }, optional: true, nullable: false
      field :destination_location_id, -> { String }, optional: true, nullable: false
      field :expected_at, -> { String }, optional: true, nullable: false
      field :notes, -> { String }, optional: true, nullable: false
      field :tracking_number, -> { String }, optional: true, nullable: false
      field :line_items, lambda {
        Internal::Types::Array[Square::Types::UpdateTransferOrderLineData]
      }, optional: true, nullable: false
    end
  end
end
