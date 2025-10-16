# frozen_string_literal: true

module Square
  module Types
    # Data for creating a new transfer order line item. Each line item specifies a
    # [CatalogItemVariation](entity:CatalogItemVariation) and quantity to transfer.
    class CreateTransferOrderLineData < Internal::Types::Model
      field :item_variation_id, -> { String }, optional: false, nullable: false
      field :quantity_ordered, -> { String }, optional: false, nullable: false
    end
  end
end
