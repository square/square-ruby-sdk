# frozen_string_literal: true

module Square
  # Represents a payment processed by the Square API.
  class Payment < Internal::Types::Model
    field :id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :updated_at, String, optional: true, nullable: false
    field :amount_money, Square::Money, optional: true, nullable: false
    field :tip_money, Square::Money, optional: true, nullable: false
    field :total_money, Square::Money, optional: true, nullable: false
    field :app_fee_money, Square::Money, optional: true, nullable: false
    field :approved_money, Square::Money, optional: true, nullable: false
    field :processing_fee, Internal::Types::Array[Square::ProcessingFee], optional: true, nullable: false
    field :refunded_money, Square::Money, optional: true, nullable: false
    field :status, String, optional: true, nullable: false
    field :delay_duration, String, optional: true, nullable: false
    field :delay_action, String, optional: true, nullable: false
    field :delayed_until, String, optional: true, nullable: false
    field :source_type, String, optional: true, nullable: false
    field :card_details, Square::CardPaymentDetails, optional: true, nullable: false
    field :cash_details, Square::CashPaymentDetails, optional: true, nullable: false
    field :bank_account_details, Square::BankAccountPaymentDetails, optional: true, nullable: false
    field :external_details, Square::ExternalPaymentDetails, optional: true, nullable: false
    field :wallet_details, Square::DigitalWalletDetails, optional: true, nullable: false
    field :buy_now_pay_later_details, Square::BuyNowPayLaterDetails, optional: true, nullable: false
    field :square_account_details, Square::SquareAccountDetails, optional: true, nullable: false
    field :location_id, String, optional: true, nullable: false
    field :order_id, String, optional: true, nullable: false
    field :reference_id, String, optional: true, nullable: false
    field :customer_id, String, optional: true, nullable: false
    field :employee_id, String, optional: true, nullable: false
    field :team_member_id, String, optional: true, nullable: false
    field :refund_ids, Internal::Types::Array[String], optional: true, nullable: false
    field :risk_evaluation, Square::RiskEvaluation, optional: true, nullable: false
    field :terminal_checkout_id, String, optional: true, nullable: false
    field :buyer_email_address, String, optional: true, nullable: false
    field :billing_address, Square::Address, optional: true, nullable: false
    field :shipping_address, Square::Address, optional: true, nullable: false
    field :note, String, optional: true, nullable: false
    field :statement_description_identifier, String, optional: true, nullable: false
    field :capabilities, Internal::Types::Array[String], optional: true, nullable: false
    field :receipt_number, String, optional: true, nullable: false
    field :receipt_url, String, optional: true, nullable: false
    field :device_details, Square::DeviceDetails, optional: true, nullable: false
    field :application_details, Square::ApplicationDetails, optional: true, nullable: false
    field :is_offline_payment, Internal::Types::Boolean, optional: true, nullable: false
    field :offline_payment_details, Square::OfflinePaymentDetails, optional: true, nullable: false
    field :version_token, String, optional: true, nullable: false

  end
end
