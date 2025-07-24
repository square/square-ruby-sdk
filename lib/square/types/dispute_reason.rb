# frozen_string_literal: true

module square.rb
# The list of possible reasons why a cardholder might initiate a
#  dispute with their bank.
  class DisputeReason

    AMOUNT_DIFFERS = "AMOUNT_DIFFERS"
    CANCELLED = "CANCELLED"
    DUPLICATE = "DUPLICATE"
    NO_KNOWLEDGE = "NO_KNOWLEDGE"
    NOT_AS_DESCRIBED = "NOT_AS_DESCRIBED"
    NOT_RECEIVED = "NOT_RECEIVED"
    PAID_BY_OTHER_MEANS = "PAID_BY_OTHER_MEANS"
    CUSTOMER_REQUESTS_CREDIT = "CUSTOMER_REQUESTS_CREDIT"
    EMV_LIABILITY_SHIFT = "EMV_LIABILITY_SHIFT"

  end
end