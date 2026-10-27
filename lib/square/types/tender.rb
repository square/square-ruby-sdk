# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a tender (i.e., a method of payment) used in a Square transaction.
    class Tender < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :location_id, -> { String }, optional: true, nullable: true

      field :transaction_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :note, -> { String }, optional: true, nullable: true

      field :amount_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :tip_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :processing_fee_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :customer_id, -> { String }, optional: true, nullable: true

      field :type, -> { Square::Types::TenderType }, optional: false, nullable: false

      field :card_details, -> { Square::Types::TenderCardDetails }, optional: true, nullable: false

      field :cash_details, -> { Square::Types::TenderCashDetails }, optional: true, nullable: false

      field :bank_account_details, -> { Square::Types::TenderBankAccountDetails }, optional: true, nullable: false

      field :buy_now_pay_later_details, -> { Square::Types::TenderBuyNowPayLaterDetails }, optional: true, nullable: false

      field :square_account_details, -> { Square::Types::TenderSquareAccountDetails }, optional: true, nullable: false

      field :additional_recipients, -> { Internal::Types::Array[Square::Types::AdditionalRecipient] }, optional: true, nullable: true

      field :payment_id, -> { String }, optional: true, nullable: true
    end
  end
end
