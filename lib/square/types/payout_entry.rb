# frozen_string_literal: true

module Square
    module Types
        # One or more PayoutEntries that make up a Payout. Each one has a date, amount, and type of activity.
        # The total amount of the payout will equal the sum of the payout entries for a batch payout
        class PayoutEntry < Square::Internal::Types::Model
            field :id, String, optional: false, nullable: false
            field :payout_id, String, optional: false, nullable: false
            field :effective_at, String, optional: true, nullable: false
            field :type, Square::ActivityType, optional: true, nullable: false
            field :gross_amount_money, Square::Money, optional: true, nullable: false
            field :fee_amount_money, Square::Money, optional: true, nullable: false
            field :net_amount_money, Square::Money, optional: true, nullable: false
            field :type_app_fee_revenue_details, Square::PaymentBalanceActivityAppFeeRevenueDetail, optional: true, nullable: false
            field :type_app_fee_refund_details, Square::PaymentBalanceActivityAppFeeRefundDetail, optional: true, nullable: false
            field :type_automatic_savings_details, Square::PaymentBalanceActivityAutomaticSavingsDetail, optional: true, nullable: false
            field :type_automatic_savings_reversed_details, Square::PaymentBalanceActivityAutomaticSavingsReversedDetail, optional: true, nullable: false
            field :type_charge_details, Square::PaymentBalanceActivityChargeDetail, optional: true, nullable: false
            field :type_deposit_fee_details, Square::PaymentBalanceActivityDepositFeeDetail, optional: true, nullable: false
            field :type_deposit_fee_reversed_details, Square::PaymentBalanceActivityDepositFeeReversedDetail, optional: true, nullable: false
            field :type_dispute_details, Square::PaymentBalanceActivityDisputeDetail, optional: true, nullable: false
            field :type_fee_details, Square::PaymentBalanceActivityFeeDetail, optional: true, nullable: false
            field :type_free_processing_details, Square::PaymentBalanceActivityFreeProcessingDetail, optional: true, nullable: false
            field :type_hold_adjustment_details, Square::PaymentBalanceActivityHoldAdjustmentDetail, optional: true, nullable: false
            field :type_open_dispute_details, Square::PaymentBalanceActivityOpenDisputeDetail, optional: true, nullable: false
            field :type_other_details, Square::PaymentBalanceActivityOtherDetail, optional: true, nullable: false
            field :type_other_adjustment_details, Square::PaymentBalanceActivityOtherAdjustmentDetail, optional: true, nullable: false
            field :type_refund_details, Square::PaymentBalanceActivityRefundDetail, optional: true, nullable: false
            field :type_release_adjustment_details, Square::PaymentBalanceActivityReleaseAdjustmentDetail, optional: true, nullable: false
            field :type_reserve_hold_details, Square::PaymentBalanceActivityReserveHoldDetail, optional: true, nullable: false
            field :type_reserve_release_details, Square::PaymentBalanceActivityReserveReleaseDetail, optional: true, nullable: false
            field :type_square_capital_payment_details, Square::PaymentBalanceActivitySquareCapitalPaymentDetail, optional: true, nullable: false
            field :type_square_capital_reversed_payment_details, Square::PaymentBalanceActivitySquareCapitalReversedPaymentDetail, optional: true, nullable: false
            field :type_tax_on_fee_details, Square::PaymentBalanceActivityTaxOnFeeDetail, optional: true, nullable: false
            field :type_third_party_fee_details, Square::PaymentBalanceActivityThirdPartyFeeDetail, optional: true, nullable: false
            field :type_third_party_fee_refund_details, Square::PaymentBalanceActivityThirdPartyFeeRefundDetail, optional: true, nullable: false
            field :type_square_payroll_transfer_details, Square::PaymentBalanceActivitySquarePayrollTransferDetail, optional: true, nullable: false
            field :type_square_payroll_transfer_reversed_details, Square::PaymentBalanceActivitySquarePayrollTransferReversedDetail, optional: true, nullable: false
        end
    end
end
