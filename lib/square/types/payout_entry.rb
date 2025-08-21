# frozen_string_literal: true

module Square
  module Types
    # One or more PayoutEntries that make up a Payout. Each one has a date, amount, and type of activity.
    # The total amount of the payout will equal the sum of the payout entries for a batch payout
    class PayoutEntry < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :payout_id, -> { String }, optional: false, nullable: false
      field :effective_at, -> { String }, optional: true, nullable: false
      field :type, -> { Square::Types::ActivityType }, optional: true, nullable: false
      field :gross_amount_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :fee_amount_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :net_amount_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :type_app_fee_revenue_details, lambda {
        Square::Types::PaymentBalanceActivityAppFeeRevenueDetail
      }, optional: true, nullable: false
      field :type_app_fee_refund_details, lambda {
        Square::Types::PaymentBalanceActivityAppFeeRefundDetail
      }, optional: true, nullable: false
      field :type_automatic_savings_details, lambda {
        Square::Types::PaymentBalanceActivityAutomaticSavingsDetail
      }, optional: true, nullable: false
      field :type_automatic_savings_reversed_details, lambda {
        Square::Types::PaymentBalanceActivityAutomaticSavingsReversedDetail
      }, optional: true, nullable: false
      field :type_charge_details, lambda {
        Square::Types::PaymentBalanceActivityChargeDetail
      }, optional: true, nullable: false
      field :type_deposit_fee_details, lambda {
        Square::Types::PaymentBalanceActivityDepositFeeDetail
      }, optional: true, nullable: false
      field :type_deposit_fee_reversed_details, lambda {
        Square::Types::PaymentBalanceActivityDepositFeeReversedDetail
      }, optional: true, nullable: false
      field :type_dispute_details, lambda {
        Square::Types::PaymentBalanceActivityDisputeDetail
      }, optional: true, nullable: false
      field :type_fee_details, -> { Square::Types::PaymentBalanceActivityFeeDetail }, optional: true, nullable: false
      field :type_free_processing_details, lambda {
        Square::Types::PaymentBalanceActivityFreeProcessingDetail
      }, optional: true, nullable: false
      field :type_hold_adjustment_details, lambda {
        Square::Types::PaymentBalanceActivityHoldAdjustmentDetail
      }, optional: true, nullable: false
      field :type_open_dispute_details, lambda {
        Square::Types::PaymentBalanceActivityOpenDisputeDetail
      }, optional: true, nullable: false
      field :type_other_details, lambda {
        Square::Types::PaymentBalanceActivityOtherDetail
      }, optional: true, nullable: false
      field :type_other_adjustment_details, lambda {
        Square::Types::PaymentBalanceActivityOtherAdjustmentDetail
      }, optional: true, nullable: false
      field :type_refund_details, lambda {
        Square::Types::PaymentBalanceActivityRefundDetail
      }, optional: true, nullable: false
      field :type_release_adjustment_details, lambda {
        Square::Types::PaymentBalanceActivityReleaseAdjustmentDetail
      }, optional: true, nullable: false
      field :type_reserve_hold_details, lambda {
        Square::Types::PaymentBalanceActivityReserveHoldDetail
      }, optional: true, nullable: false
      field :type_reserve_release_details, lambda {
        Square::Types::PaymentBalanceActivityReserveReleaseDetail
      }, optional: true, nullable: false
      field :type_square_capital_payment_details, lambda {
        Square::Types::PaymentBalanceActivitySquareCapitalPaymentDetail
      }, optional: true, nullable: false
      field :type_square_capital_reversed_payment_details, lambda {
        Square::Types::PaymentBalanceActivitySquareCapitalReversedPaymentDetail
      }, optional: true, nullable: false
      field :type_tax_on_fee_details, lambda {
        Square::Types::PaymentBalanceActivityTaxOnFeeDetail
      }, optional: true, nullable: false
      field :type_third_party_fee_details, lambda {
        Square::Types::PaymentBalanceActivityThirdPartyFeeDetail
      }, optional: true, nullable: false
      field :type_third_party_fee_refund_details, lambda {
        Square::Types::PaymentBalanceActivityThirdPartyFeeRefundDetail
      }, optional: true, nullable: false
      field :type_square_payroll_transfer_details, lambda {
        Square::Types::PaymentBalanceActivitySquarePayrollTransferDetail
      }, optional: true, nullable: false
      field :type_square_payroll_transfer_reversed_details, lambda {
        Square::Types::PaymentBalanceActivitySquarePayrollTransferReversedDetail
      }, optional: true, nullable: false
    end
  end
end
