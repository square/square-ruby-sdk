# frozen_string_literal: true
require_relative "activity_type"
require_relative "money"
require_relative "payment_balance_activity_app_fee_revenue_detail"
require_relative "payment_balance_activity_app_fee_refund_detail"
require_relative "payment_balance_activity_automatic_savings_detail"
require_relative "payment_balance_activity_automatic_savings_reversed_detail"
require_relative "payment_balance_activity_charge_detail"
require_relative "payment_balance_activity_deposit_fee_detail"
require_relative "payment_balance_activity_deposit_fee_reversed_detail"
require_relative "payment_balance_activity_dispute_detail"
require_relative "payment_balance_activity_fee_detail"
require_relative "payment_balance_activity_free_processing_detail"
require_relative "payment_balance_activity_hold_adjustment_detail"
require_relative "payment_balance_activity_open_dispute_detail"
require_relative "payment_balance_activity_other_detail"
require_relative "payment_balance_activity_other_adjustment_detail"
require_relative "payment_balance_activity_refund_detail"
require_relative "payment_balance_activity_release_adjustment_detail"
require_relative "payment_balance_activity_reserve_hold_detail"
require_relative "payment_balance_activity_reserve_release_detail"
require_relative "payment_balance_activity_square_capital_payment_detail"
require_relative "payment_balance_activity_square_capital_reversed_payment_detail"
require_relative "payment_balance_activity_tax_on_fee_detail"
require_relative "payment_balance_activity_third_party_fee_detail"
require_relative "payment_balance_activity_third_party_fee_refund_detail"
require_relative "payment_balance_activity_square_payroll_transfer_detail"
require_relative "payment_balance_activity_square_payroll_transfer_reversed_detail"
require "ostruct"
require "json"

module square.rb
# One or more PayoutEntries that make up a Payout. Each one has a date, amount,
#  and type of activity.
#  The total amount of the payout will equal the sum of the payout entries for a
#  batch payout
  class PayoutEntry
  # @return [String] A unique ID for the payout entry.
    attr_reader :id
  # @return [String] The ID of the payout entries’ associated payout.
    attr_reader :payout_id
  # @return [String] The timestamp of when the payout entry affected the balance, in RFC 3339 format.
    attr_reader :effective_at
  # @return [square.rb::ActivityType] The type of activity associated with this payout entry.
#  See [ActivityType](#type-activitytype) for possible values
    attr_reader :type
  # @return [square.rb::Money] The amount of money involved in this payout entry.
    attr_reader :gross_amount_money
  # @return [square.rb::Money] The amount of Square fees associated with this payout entry.
    attr_reader :fee_amount_money
  # @return [square.rb::Money] The net proceeds from this transaction after any fees.
    attr_reader :net_amount_money
  # @return [square.rb::PaymentBalanceActivityAppFeeRevenueDetail] Details of any developer app fee revenue generated on a payment.
    attr_reader :type_app_fee_revenue_details
  # @return [square.rb::PaymentBalanceActivityAppFeeRefundDetail] Details of a refund for an app fee on a payment.
    attr_reader :type_app_fee_refund_details
  # @return [square.rb::PaymentBalanceActivityAutomaticSavingsDetail] Details of any automatic transfer from the payment processing balance to the
#  Square Savings account. These are, generally, proportional to the merchant's
#  sales.
    attr_reader :type_automatic_savings_details
  # @return [square.rb::PaymentBalanceActivityAutomaticSavingsReversedDetail] Details of any automatic transfer from the Square Savings account back to the
#  processing balance. These are, generally, proportional to the merchant's
#  refunds.
    attr_reader :type_automatic_savings_reversed_details
  # @return [square.rb::PaymentBalanceActivityChargeDetail] Details of credit card payment captures.
    attr_reader :type_charge_details
  # @return [square.rb::PaymentBalanceActivityDepositFeeDetail] Details of any fees involved with deposits such as for instant deposits.
    attr_reader :type_deposit_fee_details
  # @return [square.rb::PaymentBalanceActivityDepositFeeReversedDetail] Details of any reversal or refund of fees involved with deposits such as for
#  instant deposits.
    attr_reader :type_deposit_fee_reversed_details
  # @return [square.rb::PaymentBalanceActivityDisputeDetail] Details of any balance change due to a dispute event.
    attr_reader :type_dispute_details
  # @return [square.rb::PaymentBalanceActivityFeeDetail] Details of adjustments due to the Square processing fee.
    attr_reader :type_fee_details
  # @return [square.rb::PaymentBalanceActivityFreeProcessingDetail] Square offers Free Payments Processing for a variety of business scenarios
#  including seller referral or when Square wants to apologize for a bug, customer
#  service, repricing complication, and so on. This entry represents details of any
#  credit to the merchant for the purposes of Free Processing.
    attr_reader :type_free_processing_details
  # @return [square.rb::PaymentBalanceActivityHoldAdjustmentDetail] Details of any adjustment made by Square related to the holding or releasing of
#  a payment.
    attr_reader :type_hold_adjustment_details
  # @return [square.rb::PaymentBalanceActivityOpenDisputeDetail] Details of any open disputes.
    attr_reader :type_open_dispute_details
  # @return [square.rb::PaymentBalanceActivityOtherDetail] Details of any other type that does not belong in the rest of the types.
    attr_reader :type_other_details
  # @return [square.rb::PaymentBalanceActivityOtherAdjustmentDetail] Details of any other type of adjustments that don't fall under existing types.
    attr_reader :type_other_adjustment_details
  # @return [square.rb::PaymentBalanceActivityRefundDetail] Details of a refund for an existing card payment.
    attr_reader :type_refund_details
  # @return [square.rb::PaymentBalanceActivityReleaseAdjustmentDetail] Details of fees released for adjustments.
    attr_reader :type_release_adjustment_details
  # @return [square.rb::PaymentBalanceActivityReserveHoldDetail] Details of fees paid for funding risk reserve.
    attr_reader :type_reserve_hold_details
  # @return [square.rb::PaymentBalanceActivityReserveReleaseDetail] Details of fees released from risk reserve.
    attr_reader :type_reserve_release_details
  # @return [square.rb::PaymentBalanceActivitySquareCapitalPaymentDetail] Details of capital merchant cash advance (MCA) assessments. These are,
#  generally, proportional to the merchant's sales but may be issued for other
#  reasons related to the MCA.
    attr_reader :type_square_capital_payment_details
  # @return [square.rb::PaymentBalanceActivitySquareCapitalReversedPaymentDetail] Details of capital merchant cash advance (MCA) assessment refunds. These are,
#  generally, proportional to the merchant's refunds but may be issued for other
#  reasons related to the MCA.
    attr_reader :type_square_capital_reversed_payment_details
  # @return [square.rb::PaymentBalanceActivityTaxOnFeeDetail] Details of tax paid on fee amounts.
    attr_reader :type_tax_on_fee_details
  # @return [square.rb::PaymentBalanceActivityThirdPartyFeeDetail] Details of fees collected by a 3rd party platform.
    attr_reader :type_third_party_fee_details
  # @return [square.rb::PaymentBalanceActivityThirdPartyFeeRefundDetail] Details of refunded fees from a 3rd party platform.
    attr_reader :type_third_party_fee_refund_details
  # @return [square.rb::PaymentBalanceActivitySquarePayrollTransferDetail] Details of a payroll payment that was transferred to a team member’s bank
#  account.
    attr_reader :type_square_payroll_transfer_details
  # @return [square.rb::PaymentBalanceActivitySquarePayrollTransferReversedDetail] Details of a payroll payment to a team member’s bank account that was deposited
#  back to the seller’s account by Square.
    attr_reader :type_square_payroll_transfer_reversed_details
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique ID for the payout entry.
    # @param payout_id [String] The ID of the payout entries’ associated payout.
    # @param effective_at [String] The timestamp of when the payout entry affected the balance, in RFC 3339 format.
    # @param type [square.rb::ActivityType] The type of activity associated with this payout entry.
#  See [ActivityType](#type-activitytype) for possible values
    # @param gross_amount_money [square.rb::Money] The amount of money involved in this payout entry.
    # @param fee_amount_money [square.rb::Money] The amount of Square fees associated with this payout entry.
    # @param net_amount_money [square.rb::Money] The net proceeds from this transaction after any fees.
    # @param type_app_fee_revenue_details [square.rb::PaymentBalanceActivityAppFeeRevenueDetail] Details of any developer app fee revenue generated on a payment.
    # @param type_app_fee_refund_details [square.rb::PaymentBalanceActivityAppFeeRefundDetail] Details of a refund for an app fee on a payment.
    # @param type_automatic_savings_details [square.rb::PaymentBalanceActivityAutomaticSavingsDetail] Details of any automatic transfer from the payment processing balance to the
#  Square Savings account. These are, generally, proportional to the merchant's
#  sales.
    # @param type_automatic_savings_reversed_details [square.rb::PaymentBalanceActivityAutomaticSavingsReversedDetail] Details of any automatic transfer from the Square Savings account back to the
#  processing balance. These are, generally, proportional to the merchant's
#  refunds.
    # @param type_charge_details [square.rb::PaymentBalanceActivityChargeDetail] Details of credit card payment captures.
    # @param type_deposit_fee_details [square.rb::PaymentBalanceActivityDepositFeeDetail] Details of any fees involved with deposits such as for instant deposits.
    # @param type_deposit_fee_reversed_details [square.rb::PaymentBalanceActivityDepositFeeReversedDetail] Details of any reversal or refund of fees involved with deposits such as for
#  instant deposits.
    # @param type_dispute_details [square.rb::PaymentBalanceActivityDisputeDetail] Details of any balance change due to a dispute event.
    # @param type_fee_details [square.rb::PaymentBalanceActivityFeeDetail] Details of adjustments due to the Square processing fee.
    # @param type_free_processing_details [square.rb::PaymentBalanceActivityFreeProcessingDetail] Square offers Free Payments Processing for a variety of business scenarios
#  including seller referral or when Square wants to apologize for a bug, customer
#  service, repricing complication, and so on. This entry represents details of any
#  credit to the merchant for the purposes of Free Processing.
    # @param type_hold_adjustment_details [square.rb::PaymentBalanceActivityHoldAdjustmentDetail] Details of any adjustment made by Square related to the holding or releasing of
#  a payment.
    # @param type_open_dispute_details [square.rb::PaymentBalanceActivityOpenDisputeDetail] Details of any open disputes.
    # @param type_other_details [square.rb::PaymentBalanceActivityOtherDetail] Details of any other type that does not belong in the rest of the types.
    # @param type_other_adjustment_details [square.rb::PaymentBalanceActivityOtherAdjustmentDetail] Details of any other type of adjustments that don't fall under existing types.
    # @param type_refund_details [square.rb::PaymentBalanceActivityRefundDetail] Details of a refund for an existing card payment.
    # @param type_release_adjustment_details [square.rb::PaymentBalanceActivityReleaseAdjustmentDetail] Details of fees released for adjustments.
    # @param type_reserve_hold_details [square.rb::PaymentBalanceActivityReserveHoldDetail] Details of fees paid for funding risk reserve.
    # @param type_reserve_release_details [square.rb::PaymentBalanceActivityReserveReleaseDetail] Details of fees released from risk reserve.
    # @param type_square_capital_payment_details [square.rb::PaymentBalanceActivitySquareCapitalPaymentDetail] Details of capital merchant cash advance (MCA) assessments. These are,
#  generally, proportional to the merchant's sales but may be issued for other
#  reasons related to the MCA.
    # @param type_square_capital_reversed_payment_details [square.rb::PaymentBalanceActivitySquareCapitalReversedPaymentDetail] Details of capital merchant cash advance (MCA) assessment refunds. These are,
#  generally, proportional to the merchant's refunds but may be issued for other
#  reasons related to the MCA.
    # @param type_tax_on_fee_details [square.rb::PaymentBalanceActivityTaxOnFeeDetail] Details of tax paid on fee amounts.
    # @param type_third_party_fee_details [square.rb::PaymentBalanceActivityThirdPartyFeeDetail] Details of fees collected by a 3rd party platform.
    # @param type_third_party_fee_refund_details [square.rb::PaymentBalanceActivityThirdPartyFeeRefundDetail] Details of refunded fees from a 3rd party platform.
    # @param type_square_payroll_transfer_details [square.rb::PaymentBalanceActivitySquarePayrollTransferDetail] Details of a payroll payment that was transferred to a team member’s bank
#  account.
    # @param type_square_payroll_transfer_reversed_details [square.rb::PaymentBalanceActivitySquarePayrollTransferReversedDetail] Details of a payroll payment to a team member’s bank account that was deposited
#  back to the seller’s account by Square.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::PayoutEntry]
    def initialize(id:, payout_id:, effective_at: OMIT, type: OMIT, gross_amount_money: OMIT, fee_amount_money: OMIT, net_amount_money: OMIT, type_app_fee_revenue_details: OMIT, type_app_fee_refund_details: OMIT, type_automatic_savings_details: OMIT, type_automatic_savings_reversed_details: OMIT, type_charge_details: OMIT, type_deposit_fee_details: OMIT, type_deposit_fee_reversed_details: OMIT, type_dispute_details: OMIT, type_fee_details: OMIT, type_free_processing_details: OMIT, type_hold_adjustment_details: OMIT, type_open_dispute_details: OMIT, type_other_details: OMIT, type_other_adjustment_details: OMIT, type_refund_details: OMIT, type_release_adjustment_details: OMIT, type_reserve_hold_details: OMIT, type_reserve_release_details: OMIT, type_square_capital_payment_details: OMIT, type_square_capital_reversed_payment_details: OMIT, type_tax_on_fee_details: OMIT, type_third_party_fee_details: OMIT, type_third_party_fee_refund_details: OMIT, type_square_payroll_transfer_details: OMIT, type_square_payroll_transfer_reversed_details: OMIT, additional_properties: nil)
      @id = id
      @payout_id = payout_id
      @effective_at = effective_at if effective_at != OMIT
      @type = type if type != OMIT
      @gross_amount_money = gross_amount_money if gross_amount_money != OMIT
      @fee_amount_money = fee_amount_money if fee_amount_money != OMIT
      @net_amount_money = net_amount_money if net_amount_money != OMIT
      @type_app_fee_revenue_details = type_app_fee_revenue_details if type_app_fee_revenue_details != OMIT
      @type_app_fee_refund_details = type_app_fee_refund_details if type_app_fee_refund_details != OMIT
      @type_automatic_savings_details = type_automatic_savings_details if type_automatic_savings_details != OMIT
      @type_automatic_savings_reversed_details = type_automatic_savings_reversed_details if type_automatic_savings_reversed_details != OMIT
      @type_charge_details = type_charge_details if type_charge_details != OMIT
      @type_deposit_fee_details = type_deposit_fee_details if type_deposit_fee_details != OMIT
      @type_deposit_fee_reversed_details = type_deposit_fee_reversed_details if type_deposit_fee_reversed_details != OMIT
      @type_dispute_details = type_dispute_details if type_dispute_details != OMIT
      @type_fee_details = type_fee_details if type_fee_details != OMIT
      @type_free_processing_details = type_free_processing_details if type_free_processing_details != OMIT
      @type_hold_adjustment_details = type_hold_adjustment_details if type_hold_adjustment_details != OMIT
      @type_open_dispute_details = type_open_dispute_details if type_open_dispute_details != OMIT
      @type_other_details = type_other_details if type_other_details != OMIT
      @type_other_adjustment_details = type_other_adjustment_details if type_other_adjustment_details != OMIT
      @type_refund_details = type_refund_details if type_refund_details != OMIT
      @type_release_adjustment_details = type_release_adjustment_details if type_release_adjustment_details != OMIT
      @type_reserve_hold_details = type_reserve_hold_details if type_reserve_hold_details != OMIT
      @type_reserve_release_details = type_reserve_release_details if type_reserve_release_details != OMIT
      @type_square_capital_payment_details = type_square_capital_payment_details if type_square_capital_payment_details != OMIT
      @type_square_capital_reversed_payment_details = type_square_capital_reversed_payment_details if type_square_capital_reversed_payment_details != OMIT
      @type_tax_on_fee_details = type_tax_on_fee_details if type_tax_on_fee_details != OMIT
      @type_third_party_fee_details = type_third_party_fee_details if type_third_party_fee_details != OMIT
      @type_third_party_fee_refund_details = type_third_party_fee_refund_details if type_third_party_fee_refund_details != OMIT
      @type_square_payroll_transfer_details = type_square_payroll_transfer_details if type_square_payroll_transfer_details != OMIT
      @type_square_payroll_transfer_reversed_details = type_square_payroll_transfer_reversed_details if type_square_payroll_transfer_reversed_details != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "payout_id": payout_id, "effective_at": effective_at, "type": type, "gross_amount_money": gross_amount_money, "fee_amount_money": fee_amount_money, "net_amount_money": net_amount_money, "type_app_fee_revenue_details": type_app_fee_revenue_details, "type_app_fee_refund_details": type_app_fee_refund_details, "type_automatic_savings_details": type_automatic_savings_details, "type_automatic_savings_reversed_details": type_automatic_savings_reversed_details, "type_charge_details": type_charge_details, "type_deposit_fee_details": type_deposit_fee_details, "type_deposit_fee_reversed_details": type_deposit_fee_reversed_details, "type_dispute_details": type_dispute_details, "type_fee_details": type_fee_details, "type_free_processing_details": type_free_processing_details, "type_hold_adjustment_details": type_hold_adjustment_details, "type_open_dispute_details": type_open_dispute_details, "type_other_details": type_other_details, "type_other_adjustment_details": type_other_adjustment_details, "type_refund_details": type_refund_details, "type_release_adjustment_details": type_release_adjustment_details, "type_reserve_hold_details": type_reserve_hold_details, "type_reserve_release_details": type_reserve_release_details, "type_square_capital_payment_details": type_square_capital_payment_details, "type_square_capital_reversed_payment_details": type_square_capital_reversed_payment_details, "type_tax_on_fee_details": type_tax_on_fee_details, "type_third_party_fee_details": type_third_party_fee_details, "type_third_party_fee_refund_details": type_third_party_fee_refund_details, "type_square_payroll_transfer_details": type_square_payroll_transfer_details, "type_square_payroll_transfer_reversed_details": type_square_payroll_transfer_reversed_details }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PayoutEntry
    #
    # @param json_object [String] 
    # @return [square.rb::PayoutEntry]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      payout_id = parsed_json["payout_id"]
      effective_at = parsed_json["effective_at"]
      type = parsed_json["type"]
      unless parsed_json["gross_amount_money"].nil?
        gross_amount_money = parsed_json["gross_amount_money"].to_json
        gross_amount_money = square.rb::Money.from_json(json_object: gross_amount_money)
      else
        gross_amount_money = nil
      end
      unless parsed_json["fee_amount_money"].nil?
        fee_amount_money = parsed_json["fee_amount_money"].to_json
        fee_amount_money = square.rb::Money.from_json(json_object: fee_amount_money)
      else
        fee_amount_money = nil
      end
      unless parsed_json["net_amount_money"].nil?
        net_amount_money = parsed_json["net_amount_money"].to_json
        net_amount_money = square.rb::Money.from_json(json_object: net_amount_money)
      else
        net_amount_money = nil
      end
      unless parsed_json["type_app_fee_revenue_details"].nil?
        type_app_fee_revenue_details = parsed_json["type_app_fee_revenue_details"].to_json
        type_app_fee_revenue_details = square.rb::PaymentBalanceActivityAppFeeRevenueDetail.from_json(json_object: type_app_fee_revenue_details)
      else
        type_app_fee_revenue_details = nil
      end
      unless parsed_json["type_app_fee_refund_details"].nil?
        type_app_fee_refund_details = parsed_json["type_app_fee_refund_details"].to_json
        type_app_fee_refund_details = square.rb::PaymentBalanceActivityAppFeeRefundDetail.from_json(json_object: type_app_fee_refund_details)
      else
        type_app_fee_refund_details = nil
      end
      unless parsed_json["type_automatic_savings_details"].nil?
        type_automatic_savings_details = parsed_json["type_automatic_savings_details"].to_json
        type_automatic_savings_details = square.rb::PaymentBalanceActivityAutomaticSavingsDetail.from_json(json_object: type_automatic_savings_details)
      else
        type_automatic_savings_details = nil
      end
      unless parsed_json["type_automatic_savings_reversed_details"].nil?
        type_automatic_savings_reversed_details = parsed_json["type_automatic_savings_reversed_details"].to_json
        type_automatic_savings_reversed_details = square.rb::PaymentBalanceActivityAutomaticSavingsReversedDetail.from_json(json_object: type_automatic_savings_reversed_details)
      else
        type_automatic_savings_reversed_details = nil
      end
      unless parsed_json["type_charge_details"].nil?
        type_charge_details = parsed_json["type_charge_details"].to_json
        type_charge_details = square.rb::PaymentBalanceActivityChargeDetail.from_json(json_object: type_charge_details)
      else
        type_charge_details = nil
      end
      unless parsed_json["type_deposit_fee_details"].nil?
        type_deposit_fee_details = parsed_json["type_deposit_fee_details"].to_json
        type_deposit_fee_details = square.rb::PaymentBalanceActivityDepositFeeDetail.from_json(json_object: type_deposit_fee_details)
      else
        type_deposit_fee_details = nil
      end
      unless parsed_json["type_deposit_fee_reversed_details"].nil?
        type_deposit_fee_reversed_details = parsed_json["type_deposit_fee_reversed_details"].to_json
        type_deposit_fee_reversed_details = square.rb::PaymentBalanceActivityDepositFeeReversedDetail.from_json(json_object: type_deposit_fee_reversed_details)
      else
        type_deposit_fee_reversed_details = nil
      end
      unless parsed_json["type_dispute_details"].nil?
        type_dispute_details = parsed_json["type_dispute_details"].to_json
        type_dispute_details = square.rb::PaymentBalanceActivityDisputeDetail.from_json(json_object: type_dispute_details)
      else
        type_dispute_details = nil
      end
      unless parsed_json["type_fee_details"].nil?
        type_fee_details = parsed_json["type_fee_details"].to_json
        type_fee_details = square.rb::PaymentBalanceActivityFeeDetail.from_json(json_object: type_fee_details)
      else
        type_fee_details = nil
      end
      unless parsed_json["type_free_processing_details"].nil?
        type_free_processing_details = parsed_json["type_free_processing_details"].to_json
        type_free_processing_details = square.rb::PaymentBalanceActivityFreeProcessingDetail.from_json(json_object: type_free_processing_details)
      else
        type_free_processing_details = nil
      end
      unless parsed_json["type_hold_adjustment_details"].nil?
        type_hold_adjustment_details = parsed_json["type_hold_adjustment_details"].to_json
        type_hold_adjustment_details = square.rb::PaymentBalanceActivityHoldAdjustmentDetail.from_json(json_object: type_hold_adjustment_details)
      else
        type_hold_adjustment_details = nil
      end
      unless parsed_json["type_open_dispute_details"].nil?
        type_open_dispute_details = parsed_json["type_open_dispute_details"].to_json
        type_open_dispute_details = square.rb::PaymentBalanceActivityOpenDisputeDetail.from_json(json_object: type_open_dispute_details)
      else
        type_open_dispute_details = nil
      end
      unless parsed_json["type_other_details"].nil?
        type_other_details = parsed_json["type_other_details"].to_json
        type_other_details = square.rb::PaymentBalanceActivityOtherDetail.from_json(json_object: type_other_details)
      else
        type_other_details = nil
      end
      unless parsed_json["type_other_adjustment_details"].nil?
        type_other_adjustment_details = parsed_json["type_other_adjustment_details"].to_json
        type_other_adjustment_details = square.rb::PaymentBalanceActivityOtherAdjustmentDetail.from_json(json_object: type_other_adjustment_details)
      else
        type_other_adjustment_details = nil
      end
      unless parsed_json["type_refund_details"].nil?
        type_refund_details = parsed_json["type_refund_details"].to_json
        type_refund_details = square.rb::PaymentBalanceActivityRefundDetail.from_json(json_object: type_refund_details)
      else
        type_refund_details = nil
      end
      unless parsed_json["type_release_adjustment_details"].nil?
        type_release_adjustment_details = parsed_json["type_release_adjustment_details"].to_json
        type_release_adjustment_details = square.rb::PaymentBalanceActivityReleaseAdjustmentDetail.from_json(json_object: type_release_adjustment_details)
      else
        type_release_adjustment_details = nil
      end
      unless parsed_json["type_reserve_hold_details"].nil?
        type_reserve_hold_details = parsed_json["type_reserve_hold_details"].to_json
        type_reserve_hold_details = square.rb::PaymentBalanceActivityReserveHoldDetail.from_json(json_object: type_reserve_hold_details)
      else
        type_reserve_hold_details = nil
      end
      unless parsed_json["type_reserve_release_details"].nil?
        type_reserve_release_details = parsed_json["type_reserve_release_details"].to_json
        type_reserve_release_details = square.rb::PaymentBalanceActivityReserveReleaseDetail.from_json(json_object: type_reserve_release_details)
      else
        type_reserve_release_details = nil
      end
      unless parsed_json["type_square_capital_payment_details"].nil?
        type_square_capital_payment_details = parsed_json["type_square_capital_payment_details"].to_json
        type_square_capital_payment_details = square.rb::PaymentBalanceActivitySquareCapitalPaymentDetail.from_json(json_object: type_square_capital_payment_details)
      else
        type_square_capital_payment_details = nil
      end
      unless parsed_json["type_square_capital_reversed_payment_details"].nil?
        type_square_capital_reversed_payment_details = parsed_json["type_square_capital_reversed_payment_details"].to_json
        type_square_capital_reversed_payment_details = square.rb::PaymentBalanceActivitySquareCapitalReversedPaymentDetail.from_json(json_object: type_square_capital_reversed_payment_details)
      else
        type_square_capital_reversed_payment_details = nil
      end
      unless parsed_json["type_tax_on_fee_details"].nil?
        type_tax_on_fee_details = parsed_json["type_tax_on_fee_details"].to_json
        type_tax_on_fee_details = square.rb::PaymentBalanceActivityTaxOnFeeDetail.from_json(json_object: type_tax_on_fee_details)
      else
        type_tax_on_fee_details = nil
      end
      unless parsed_json["type_third_party_fee_details"].nil?
        type_third_party_fee_details = parsed_json["type_third_party_fee_details"].to_json
        type_third_party_fee_details = square.rb::PaymentBalanceActivityThirdPartyFeeDetail.from_json(json_object: type_third_party_fee_details)
      else
        type_third_party_fee_details = nil
      end
      unless parsed_json["type_third_party_fee_refund_details"].nil?
        type_third_party_fee_refund_details = parsed_json["type_third_party_fee_refund_details"].to_json
        type_third_party_fee_refund_details = square.rb::PaymentBalanceActivityThirdPartyFeeRefundDetail.from_json(json_object: type_third_party_fee_refund_details)
      else
        type_third_party_fee_refund_details = nil
      end
      unless parsed_json["type_square_payroll_transfer_details"].nil?
        type_square_payroll_transfer_details = parsed_json["type_square_payroll_transfer_details"].to_json
        type_square_payroll_transfer_details = square.rb::PaymentBalanceActivitySquarePayrollTransferDetail.from_json(json_object: type_square_payroll_transfer_details)
      else
        type_square_payroll_transfer_details = nil
      end
      unless parsed_json["type_square_payroll_transfer_reversed_details"].nil?
        type_square_payroll_transfer_reversed_details = parsed_json["type_square_payroll_transfer_reversed_details"].to_json
        type_square_payroll_transfer_reversed_details = square.rb::PaymentBalanceActivitySquarePayrollTransferReversedDetail.from_json(json_object: type_square_payroll_transfer_reversed_details)
      else
        type_square_payroll_transfer_reversed_details = nil
      end
      new(
        id: id,
        payout_id: payout_id,
        effective_at: effective_at,
        type: type,
        gross_amount_money: gross_amount_money,
        fee_amount_money: fee_amount_money,
        net_amount_money: net_amount_money,
        type_app_fee_revenue_details: type_app_fee_revenue_details,
        type_app_fee_refund_details: type_app_fee_refund_details,
        type_automatic_savings_details: type_automatic_savings_details,
        type_automatic_savings_reversed_details: type_automatic_savings_reversed_details,
        type_charge_details: type_charge_details,
        type_deposit_fee_details: type_deposit_fee_details,
        type_deposit_fee_reversed_details: type_deposit_fee_reversed_details,
        type_dispute_details: type_dispute_details,
        type_fee_details: type_fee_details,
        type_free_processing_details: type_free_processing_details,
        type_hold_adjustment_details: type_hold_adjustment_details,
        type_open_dispute_details: type_open_dispute_details,
        type_other_details: type_other_details,
        type_other_adjustment_details: type_other_adjustment_details,
        type_refund_details: type_refund_details,
        type_release_adjustment_details: type_release_adjustment_details,
        type_reserve_hold_details: type_reserve_hold_details,
        type_reserve_release_details: type_reserve_release_details,
        type_square_capital_payment_details: type_square_capital_payment_details,
        type_square_capital_reversed_payment_details: type_square_capital_reversed_payment_details,
        type_tax_on_fee_details: type_tax_on_fee_details,
        type_third_party_fee_details: type_third_party_fee_details,
        type_third_party_fee_refund_details: type_third_party_fee_refund_details,
        type_square_payroll_transfer_details: type_square_payroll_transfer_details,
        type_square_payroll_transfer_reversed_details: type_square_payroll_transfer_reversed_details,
        additional_properties: struct
      )
    end
# Serialize an instance of PayoutEntry to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.payout_id.is_a?(String) != false || raise("Passed value for field obj.payout_id is not the expected type, validation failed.")
      obj.effective_at&.is_a?(String) != false || raise("Passed value for field obj.effective_at is not the expected type, validation failed.")
      obj.type&.is_a?(square.rb::ActivityType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.gross_amount_money.nil? || square.rb::Money.validate_raw(obj: obj.gross_amount_money)
      obj.fee_amount_money.nil? || square.rb::Money.validate_raw(obj: obj.fee_amount_money)
      obj.net_amount_money.nil? || square.rb::Money.validate_raw(obj: obj.net_amount_money)
      obj.type_app_fee_revenue_details.nil? || square.rb::PaymentBalanceActivityAppFeeRevenueDetail.validate_raw(obj: obj.type_app_fee_revenue_details)
      obj.type_app_fee_refund_details.nil? || square.rb::PaymentBalanceActivityAppFeeRefundDetail.validate_raw(obj: obj.type_app_fee_refund_details)
      obj.type_automatic_savings_details.nil? || square.rb::PaymentBalanceActivityAutomaticSavingsDetail.validate_raw(obj: obj.type_automatic_savings_details)
      obj.type_automatic_savings_reversed_details.nil? || square.rb::PaymentBalanceActivityAutomaticSavingsReversedDetail.validate_raw(obj: obj.type_automatic_savings_reversed_details)
      obj.type_charge_details.nil? || square.rb::PaymentBalanceActivityChargeDetail.validate_raw(obj: obj.type_charge_details)
      obj.type_deposit_fee_details.nil? || square.rb::PaymentBalanceActivityDepositFeeDetail.validate_raw(obj: obj.type_deposit_fee_details)
      obj.type_deposit_fee_reversed_details.nil? || square.rb::PaymentBalanceActivityDepositFeeReversedDetail.validate_raw(obj: obj.type_deposit_fee_reversed_details)
      obj.type_dispute_details.nil? || square.rb::PaymentBalanceActivityDisputeDetail.validate_raw(obj: obj.type_dispute_details)
      obj.type_fee_details.nil? || square.rb::PaymentBalanceActivityFeeDetail.validate_raw(obj: obj.type_fee_details)
      obj.type_free_processing_details.nil? || square.rb::PaymentBalanceActivityFreeProcessingDetail.validate_raw(obj: obj.type_free_processing_details)
      obj.type_hold_adjustment_details.nil? || square.rb::PaymentBalanceActivityHoldAdjustmentDetail.validate_raw(obj: obj.type_hold_adjustment_details)
      obj.type_open_dispute_details.nil? || square.rb::PaymentBalanceActivityOpenDisputeDetail.validate_raw(obj: obj.type_open_dispute_details)
      obj.type_other_details.nil? || square.rb::PaymentBalanceActivityOtherDetail.validate_raw(obj: obj.type_other_details)
      obj.type_other_adjustment_details.nil? || square.rb::PaymentBalanceActivityOtherAdjustmentDetail.validate_raw(obj: obj.type_other_adjustment_details)
      obj.type_refund_details.nil? || square.rb::PaymentBalanceActivityRefundDetail.validate_raw(obj: obj.type_refund_details)
      obj.type_release_adjustment_details.nil? || square.rb::PaymentBalanceActivityReleaseAdjustmentDetail.validate_raw(obj: obj.type_release_adjustment_details)
      obj.type_reserve_hold_details.nil? || square.rb::PaymentBalanceActivityReserveHoldDetail.validate_raw(obj: obj.type_reserve_hold_details)
      obj.type_reserve_release_details.nil? || square.rb::PaymentBalanceActivityReserveReleaseDetail.validate_raw(obj: obj.type_reserve_release_details)
      obj.type_square_capital_payment_details.nil? || square.rb::PaymentBalanceActivitySquareCapitalPaymentDetail.validate_raw(obj: obj.type_square_capital_payment_details)
      obj.type_square_capital_reversed_payment_details.nil? || square.rb::PaymentBalanceActivitySquareCapitalReversedPaymentDetail.validate_raw(obj: obj.type_square_capital_reversed_payment_details)
      obj.type_tax_on_fee_details.nil? || square.rb::PaymentBalanceActivityTaxOnFeeDetail.validate_raw(obj: obj.type_tax_on_fee_details)
      obj.type_third_party_fee_details.nil? || square.rb::PaymentBalanceActivityThirdPartyFeeDetail.validate_raw(obj: obj.type_third_party_fee_details)
      obj.type_third_party_fee_refund_details.nil? || square.rb::PaymentBalanceActivityThirdPartyFeeRefundDetail.validate_raw(obj: obj.type_third_party_fee_refund_details)
      obj.type_square_payroll_transfer_details.nil? || square.rb::PaymentBalanceActivitySquarePayrollTransferDetail.validate_raw(obj: obj.type_square_payroll_transfer_details)
      obj.type_square_payroll_transfer_reversed_details.nil? || square.rb::PaymentBalanceActivitySquarePayrollTransferReversedDetail.validate_raw(obj: obj.type_square_payroll_transfer_reversed_details)
    end
  end
end