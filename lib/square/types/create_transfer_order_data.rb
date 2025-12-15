# frozen_string_literal: true

module Square
  module Types
    # Data for creating a new transfer order to move [CatalogItemVariation](entity:CatalogItemVariation)s
    # between [Location](entity:Location)s. Used with the
    # [CreateTransferOrder](api-endpoint:TransferOrders-CreateTransferOrder)
    # endpoint.
    class CreateTransferOrderData < Internal::Types::Model
      field :source_location_id, -> { String }, optional: false, nullable: false
      field :destination_location_id, -> { String }, optional: false, nullable: false
      field :expected_at, -> { String }, optional: true, nullable: false
      field :notes, -> { String }, optional: true, nullable: false
      field :tracking_number, -> { String }, optional: true, nullable: false
      field :created_by_team_member_id, -> { String }, optional: true, nullable: false
      field :line_items, -> { Internal::Types::Array[Square::Types::CreateTransferOrderLineData] }, optional: true, nullable: false
    end
  end
end
