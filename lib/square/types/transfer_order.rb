# frozen_string_literal: true

module Square
  module Types
    # Represents a transfer order for moving [CatalogItemVariation](entity:CatalogItemVariation)s
    # between [Location](entity:Location)s. Transfer orders track the entire lifecycle of an inventory
    # transfer, including:
    # - What items and quantities are being moved
    # - Source and destination locations
    # - Current [TransferOrderStatus](entity:TransferOrderStatus)
    # - Shipping information and tracking
    # - Which [TeamMember](entity:TeamMember) initiated the transfer
    #
    # This object is commonly used to:
    # - Track [CatalogItemVariation](entity:CatalogItemVariation) movements between [Location](entity:Location)s
    # - Reconcile expected vs received quantities
    # - Monitor transfer progress and shipping status
    # - Audit inventory movement history
    class TransferOrder < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :source_location_id, -> { String }, optional: true, nullable: false
      field :destination_location_id, -> { String }, optional: true, nullable: false
      field :status, -> { Square::Types::TransferOrderStatus }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
      field :expected_at, -> { String }, optional: true, nullable: false
      field :completed_at, -> { String }, optional: true, nullable: false
      field :notes, -> { String }, optional: true, nullable: false
      field :tracking_number, -> { String }, optional: true, nullable: false
      field :created_by_team_member_id, -> { String }, optional: true, nullable: false
      field :line_items, lambda {
        Internal::Types::Array[Square::Types::TransferOrderLine]
      }, optional: true, nullable: false
      field :version, -> { Integer }, optional: true, nullable: false
    end
  end
end
