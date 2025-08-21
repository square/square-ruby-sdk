# frozen_string_literal: true

module Square
  module Locations
    module Types
      class CreateCheckoutRequest < Internal::Types::Model
        field :location_id, -> { String }, optional: false, nullable: false
        field :idempotency_key, -> { String }, optional: false, nullable: false
        field :order, -> { Square::Types::CreateOrderRequest }, optional: false, nullable: false
        field :ask_for_shipping_address, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :merchant_support_email, -> { String }, optional: true, nullable: false
        field :pre_populate_buyer_email, -> { String }, optional: true, nullable: false
        field :pre_populate_shipping_address, -> { Square::Types::Address }, optional: true, nullable: false
        field :redirect_url, -> { String }, optional: true, nullable: false
        field :additional_recipients, lambda {
          Internal::Types::Array[Square::Types::ChargeRequestAdditionalRecipient]
        }, optional: true, nullable: false
        field :note, -> { String }, optional: true, nullable: false
      end
    end
  end
end
