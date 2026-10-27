# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a transaction processed with Square, either with the
    # Connect API or with Square Point of Sale.
    #
    # The `tenders` field of this object lists all methods of payment used to pay in
    # the transaction.
    class Transaction < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :location_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :tenders, -> { Internal::Types::Array[Square::Types::Tender] }, optional: true, nullable: true

      field :refunds, -> { Internal::Types::Array[Square::Types::Refund] }, optional: true, nullable: true

      field :reference_id, -> { String }, optional: true, nullable: true

      field :product, -> { Square::Types::TransactionProduct }, optional: true, nullable: false

      field :client_id, -> { String }, optional: true, nullable: true

      field :shipping_address, -> { Square::Types::Address }, optional: true, nullable: false

      field :order_id, -> { String }, optional: true, nullable: true
    end
  end
end
