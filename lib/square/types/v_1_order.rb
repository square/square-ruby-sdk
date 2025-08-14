# frozen_string_literal: true

module Square
    module Types
        # V1Order
        class V1Order < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :id, String, optional: true, nullable: false
            field :buyer_email, String, optional: true, nullable: false
            field :recipient_name, String, optional: true, nullable: false
            field :recipient_phone_number, String, optional: true, nullable: false
            field :state, Square::V1OrderState, optional: true, nullable: false
            field :shipping_address, Square::Address, optional: true, nullable: false
            field :subtotal_money, Square::V1Money, optional: true, nullable: false
            field :total_shipping_money, Square::V1Money, optional: true, nullable: false
            field :total_tax_money, Square::V1Money, optional: true, nullable: false
            field :total_price_money, Square::V1Money, optional: true, nullable: false
            field :total_discount_money, Square::V1Money, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :updated_at, String, optional: true, nullable: false
            field :expires_at, String, optional: true, nullable: false
            field :payment_id, String, optional: true, nullable: false
            field :buyer_note, String, optional: true, nullable: false
            field :completed_note, String, optional: true, nullable: false
            field :refunded_note, String, optional: true, nullable: false
            field :canceled_note, String, optional: true, nullable: false
            field :tender, Square::V1Tender, optional: true, nullable: false
            field :order_history, Square::Internal::Types::Array[Square::V1OrderHistoryEntry], optional: true, nullable: false
            field :promo_code, String, optional: true, nullable: false
            field :btc_receive_address, String, optional: true, nullable: false
            field :btc_price_satoshi, Integer, optional: true, nullable: false
        end
    end
end
