# frozen_string_literal: true

module Square
  module Types
    # Represents a line item in a transfer order. Each line item tracks a specific
    # [CatalogItemVariation](entity:CatalogItemVariation) being transferred, including ordered quantities
    # and receipt status.
    class TransferOrderLine < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: false
      field :item_variation_id, -> { String }, optional: false, nullable: false
      field :quantity_ordered, -> { String }, optional: false, nullable: false
      field :quantity_pending, -> { String }, optional: true, nullable: false
      field :quantity_received, -> { String }, optional: true, nullable: false
      field :quantity_damaged, -> { String }, optional: true, nullable: false
      field :quantity_canceled, -> { String }, optional: true, nullable: false
    end
  end
end
