# frozen_string_literal: true

module Square
  module Types
    # Represents a checkout processed by the Square Terminal.
    class TerminalCheckout < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :amount_money, -> { Square::Types::Money }, optional: false, nullable: false
      field :reference_id, -> { String }, optional: true, nullable: false
      field :note, -> { String }, optional: true, nullable: false
      field :order_id, -> { String }, optional: true, nullable: false
      field :payment_options, -> { Square::Types::PaymentOptions }, optional: true, nullable: false
      field :device_options, -> { Square::Types::DeviceCheckoutOptions }, optional: false, nullable: false
      field :deadline_duration, -> { String }, optional: true, nullable: false
      field :status, -> { String }, optional: true, nullable: false
      field :cancel_reason, -> { Square::Types::ActionCancelReason }, optional: true, nullable: false
      field :payment_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
      field :app_id, -> { String }, optional: true, nullable: false
      field :location_id, -> { String }, optional: true, nullable: false
      field :payment_type, -> { Square::Types::CheckoutOptionsPaymentType }, optional: true, nullable: false
      field :team_member_id, -> { String }, optional: true, nullable: false
      field :customer_id, -> { String }, optional: true, nullable: false
      field :app_fee_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :statement_description_identifier, -> { String }, optional: true, nullable: false
      field :tip_money, -> { Square::Types::Money }, optional: true, nullable: false
    end
  end
end
