# frozen_string_literal: true

module Square
  module Types
    # Represents a line item update in a transfer order
    class UpdateTransferOrderLineData < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: false
      field :item_variation_id, -> { String }, optional: true, nullable: false
      field :quantity_ordered, -> { String }, optional: true, nullable: false
      field :remove, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
