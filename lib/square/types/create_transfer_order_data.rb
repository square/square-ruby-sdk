# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Data for creating a new transfer order to move [CatalogItemVariation](entity:CatalogItemVariation)s
    # between [Location](entity:Location)s. Used with the
    # [CreateTransferOrder](api-endpoint:TransferOrders-CreateTransferOrder)
    # endpoint.
    class CreateTransferOrderData < Internal::Types::Model
      field :source_location_id, -> { String }, optional: false, nullable: false

      field :destination_location_id, -> { String }, optional: false, nullable: false

      field :expected_at, -> { String }, optional: true, nullable: true

      field :notes, -> { String }, optional: true, nullable: true

      field :tracking_number, -> { String }, optional: true, nullable: true

      field :created_by_team_member_id, -> { String }, optional: true, nullable: true

      field :line_items, -> { Internal::Types::Array[Square::Types::CreateTransferOrderLineData] }, optional: true, nullable: true
    end
  end
end
