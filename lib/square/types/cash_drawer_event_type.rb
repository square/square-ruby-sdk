# frozen_string_literal: true

module square.rb
# The types of events on a CashDrawerShift.
#  Each event type represents an employee action on the actual cash drawer
#  represented by a CashDrawerShift.
  class CashDrawerEventType

    NO_SALE = "NO_SALE"
    CASH_TENDER_PAYMENT = "CASH_TENDER_PAYMENT"
    OTHER_TENDER_PAYMENT = "OTHER_TENDER_PAYMENT"
    CASH_TENDER_CANCELLED_PAYMENT = "CASH_TENDER_CANCELLED_PAYMENT"
    OTHER_TENDER_CANCELLED_PAYMENT = "OTHER_TENDER_CANCELLED_PAYMENT"
    CASH_TENDER_REFUND = "CASH_TENDER_REFUND"
    OTHER_TENDER_REFUND = "OTHER_TENDER_REFUND"
    PAID_IN = "PAID_IN"
    PAID_OUT = "PAID_OUT"

  end
end