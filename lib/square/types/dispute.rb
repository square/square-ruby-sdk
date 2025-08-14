# frozen_string_literal: true

module Square
    module Types
        # Represents a [dispute](https://developer.squareup.com/docs/disputes-api/overview) a cardholder initiated with their bank.
        class Dispute < Internal::Types::Model
            field :dispute_id, String, optional: true, nullable: false
            field :id, String, optional: true, nullable: false
            field :amount_money, Square::Money, optional: true, nullable: false
            field :reason, Square::DisputeReason, optional: true, nullable: false
            field :state, Square::DisputeState, optional: true, nullable: false
            field :due_at, String, optional: true, nullable: false
            field :disputed_payment, Square::DisputedPayment, optional: true, nullable: false
            field :evidence_ids, Internal::Types::Array[String], optional: true, nullable: false
            field :card_brand, Square::CardBrand, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :updated_at, String, optional: true, nullable: false
            field :brand_dispute_id, String, optional: true, nullable: false
            field :reported_date, String, optional: true, nullable: false
            field :reported_at, String, optional: true, nullable: false
            field :version, Integer, optional: true, nullable: false
            field :location_id, String, optional: true, nullable: false
        end
    end
end
