# frozen_string_literal: true

module Square
  module Types
    # Represents a subscription purchased by a customer.
    #
    # For more information, see
    # [Manage Subscriptions](https://developer.squareup.com/docs/subscriptions-api/manage-subscriptions).
    class Subscription < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :location_id, -> { String }, optional: true, nullable: false
      field :plan_variation_id, -> { String }, optional: true, nullable: false
      field :customer_id, -> { String }, optional: true, nullable: false
      field :start_date, -> { String }, optional: true, nullable: false
      field :canceled_date, -> { String }, optional: true, nullable: false
      field :charged_through_date, -> { String }, optional: true, nullable: false
      field :status, -> { Square::Types::SubscriptionStatus }, optional: true, nullable: false
      field :tax_percentage, -> { String }, optional: true, nullable: false
      field :invoice_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :price_override_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :version, -> { Integer }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :card_id, -> { String }, optional: true, nullable: false
      field :timezone, -> { String }, optional: true, nullable: false
      field :source, -> { Square::Types::SubscriptionSource }, optional: true, nullable: false
      field :actions, -> { Internal::Types::Array[Square::Types::SubscriptionAction] }, optional: true, nullable: false
      field :monthly_billing_anchor_date, -> { Integer }, optional: true, nullable: false
      field :phases, -> { Internal::Types::Array[Square::Types::Phase] }, optional: true, nullable: false
    end
  end
end
