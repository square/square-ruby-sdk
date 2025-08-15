# frozen_string_literal: true

module Square
  # Represents a tender (i.e., a method of payment) used in a Square transaction.
  class Tender < Internal::Types::Model
    field :id, String, optional: true, nullable: false
    field :location_id, String, optional: true, nullable: false
    field :transaction_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :note, String, optional: true, nullable: false
    field :amount_money, Square::Money, optional: true, nullable: false
    field :tip_money, Square::Money, optional: true, nullable: false
    field :processing_fee_money, Square::Money, optional: true, nullable: false
    field :customer_id, String, optional: true, nullable: false
    field :type, Square::TenderType, optional: false, nullable: false
    field :card_details, Square::TenderCardDetails, optional: true, nullable: false
    field :cash_details, Square::TenderCashDetails, optional: true, nullable: false
    field :bank_account_details, Square::TenderBankAccountDetails, optional: true, nullable: false
    field :buy_now_pay_later_details, Square::TenderBuyNowPayLaterDetails, optional: true, nullable: false
    field :square_account_details, Square::TenderSquareAccountDetails, optional: true, nullable: false
    field :additional_recipients, Internal::Types::Array[Square::AdditionalRecipient], optional: true, nullable: false
    field :payment_id, String, optional: true, nullable: false

  end
end
