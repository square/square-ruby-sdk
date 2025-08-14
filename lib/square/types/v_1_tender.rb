# frozen_string_literal: true

module Square
  module Types
    # A tender represents a discrete monetary exchange. Square represents this
    # exchange as a money object with a specific currency and amount, where the
    # amount is given in the smallest denomination of the given currency.
    # 
    # Square POS can accept more than one form of tender for a single payment (such
    # as by splitting a bill between a credit card and a gift card). The `tender`
    # field of the Payment object lists all forms of tender used for the payment.
    # 
    # Split tender payments behave slightly differently from single tender payments:
    # 
    # The receipt_url for a split tender corresponds only to the first tender listed
    # in the tender field. To get the receipt URLs for the remaining tenders, use
    # the receipt_url fields of the corresponding Tender objects.
    # 
    # *A note on gift cards**: when a customer purchases a Square gift card from a
    # merchant, the merchant receives the full amount of the gift card in the
    # associated payment.
    # 
    # When that gift card is used as a tender, the balance of the gift card is
    # reduced and the merchant receives no funds. A `Tender` object with a type of
    # `SQUARE_GIFT_CARD` indicates a gift card was used for some or all of the
    # associated payment.
    class V1Tender < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :type, Square::V1TenderType, optional: true, nullable: false
      field :name, String, optional: true, nullable: false
      field :employee_id, String, optional: true, nullable: false
      field :receipt_url, String, optional: true, nullable: false
      field :card_brand, Square::V1TenderCardBrand, optional: true, nullable: false
      field :pan_suffix, String, optional: true, nullable: false
      field :entry_method, Square::V1TenderEntryMethod, optional: true, nullable: false
      field :payment_note, String, optional: true, nullable: false
      field :total_money, Square::V1Money, optional: true, nullable: false
      field :tendered_money, Square::V1Money, optional: true, nullable: false
      field :tendered_at, String, optional: true, nullable: false
      field :settled_at, String, optional: true, nullable: false
      field :change_back_money, Square::V1Money, optional: true, nullable: false
      field :refunded_money, Square::V1Money, optional: true, nullable: false
      field :is_exchange, Internal::Types::Boolean, optional: true, nullable: false

    end
  end
end
