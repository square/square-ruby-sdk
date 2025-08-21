# frozen_string_literal: true

module Square
  module Checkout
    module PaymentLinks
      module Types
        class CreatePaymentLinkRequest < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: true, nullable: false
          field :description, -> { String }, optional: true, nullable: false
          field :quick_pay, -> { Square::Types::QuickPay }, optional: true, nullable: false
          field :order, -> { Square::Types::Order }, optional: true, nullable: false
          field :checkout_options, -> { Square::Types::CheckoutOptions }, optional: true, nullable: false
          field :pre_populated_data, -> { Square::Types::PrePopulatedData }, optional: true, nullable: false
          field :payment_note, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
