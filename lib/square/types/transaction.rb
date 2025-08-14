# frozen_string_literal: true

module Square
  module Types
    # Represents a transaction processed with Square, either with the
    # Connect API or with Square Point of Sale.
    # 
    # The `tenders` field of this object lists all methods of payment used to pay in
    # the transaction.
    class Transaction < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :location_id, String, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :tenders, Internal::Types::Array[Square::Tender], optional: true, nullable: false
      field :refunds, Internal::Types::Array[Square::Refund], optional: true, nullable: false
      field :reference_id, String, optional: true, nullable: false
      field :product, Square::TransactionProduct, optional: true, nullable: false
      field :client_id, String, optional: true, nullable: false
      field :shipping_address, Square::Address, optional: true, nullable: false
      field :order_id, String, optional: true, nullable: false

    end
  end
end
