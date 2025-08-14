# frozen_string_literal: true

module Square
  module Types
    # Square Checkout lets merchants accept online payments for supported
    # payment types using a checkout workflow hosted on squareup.com.
    class Checkout < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :checkout_page_url, String, optional: true, nullable: false
      field :ask_for_shipping_address, Internal::Types::Boolean, optional: true, nullable: false
      field :merchant_support_email, String, optional: true, nullable: false
      field :pre_populate_buyer_email, String, optional: true, nullable: false
      field :pre_populate_shipping_address, Square::Address, optional: true, nullable: false
      field :redirect_url, String, optional: true, nullable: false
      field :order, Square::Order, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :additional_recipients, Internal::Types::Array[Square::AdditionalRecipient], optional: true, nullable: false

    end
  end
end
