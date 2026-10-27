# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a [dispute](https://developer.squareup.com/docs/disputes-api/overview) a cardholder initiated with
    # their bank.
    class Dispute < Internal::Types::Model
      field :dispute_id, -> { String }, optional: true, nullable: true

      field :id, -> { String }, optional: true, nullable: false

      field :amount_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :reason, -> { Square::Types::DisputeReason }, optional: true, nullable: false

      field :state, -> { Square::Types::DisputeState }, optional: true, nullable: false

      field :due_at, -> { String }, optional: true, nullable: true

      field :disputed_payment, -> { Square::Types::DisputedPayment }, optional: true, nullable: false

      field :evidence_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :card_brand, -> { Square::Types::CardBrand }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false

      field :brand_dispute_id, -> { String }, optional: true, nullable: true

      field :reported_date, -> { String }, optional: true, nullable: true

      field :reported_at, -> { String }, optional: true, nullable: true

      field :version, -> { Integer }, optional: true, nullable: false

      field :location_id, -> { String }, optional: true, nullable: true
    end
  end
end
