# frozen_string_literal: true

module Square
  module Subscriptions
    module Types
      class CreateSubscriptionRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: true, nullable: false
        field :location_id, -> { String }, optional: false, nullable: false
        field :plan_variation_id, -> { String }, optional: true, nullable: false
        field :customer_id, -> { String }, optional: false, nullable: false
        field :start_date, -> { String }, optional: true, nullable: false
        field :canceled_date, -> { String }, optional: true, nullable: false
        field :tax_percentage, -> { String }, optional: true, nullable: false
        field :price_override_money, -> { Square::Types::Money }, optional: true, nullable: false
        field :card_id, -> { String }, optional: true, nullable: false
        field :timezone, -> { String }, optional: true, nullable: false
        field :source, -> { Square::Types::SubscriptionSource }, optional: true, nullable: false
        field :monthly_billing_anchor_date, -> { Integer }, optional: true, nullable: false
        field :phases, -> { Internal::Types::Array[Square::Types::Phase] }, optional: true, nullable: false
      end
    end
  end
end
