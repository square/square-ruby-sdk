# frozen_string_literal: true

module Square
  module Types
    # Represents a refund processed for a Square transaction.
    class Refund < Internal::Types::Model
      field :id, String, optional: false, nullable: false
      field :location_id, String, optional: false, nullable: false
      field :transaction_id, String, optional: true, nullable: false
      field :tender_id, String, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :reason, String, optional: false, nullable: false
      field :amount_money, Square::Types::Money, optional: false, nullable: false
      field :status, Square::Types::RefundStatus, optional: false, nullable: false
      field :processing_fee_money, Square::Types::Money, optional: true, nullable: false
      field :additional_recipients, Internal::Types::Array[Square::Types::AdditionalRecipient], optional: true, nullable: false

    end
  end
end
