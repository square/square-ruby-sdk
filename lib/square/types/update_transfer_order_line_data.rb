# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a line item update in a transfer order
    class UpdateTransferOrderLineData < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: true

      field :item_variation_id, -> { String }, optional: true, nullable: true

      field :quantity_ordered, -> { String }, optional: true, nullable: true

      field :remove, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
