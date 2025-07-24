# frozen_string_literal: true

module SquareApiClient
# Represents a phase in the process of calculating order totals.
#  Service charges are applied after the indicated phase.
#  [Read more about how order totals are
#  //developer.squareup.com/docs/orders-api/how-it-works#how-totals-are-calculated)
  class OrderServiceChargeCalculationPhase

    SUBTOTAL_PHASE = "SUBTOTAL_PHASE"
    TOTAL_PHASE = "TOTAL_PHASE"
    APPORTIONED_PERCENTAGE_PHASE = "APPORTIONED_PERCENTAGE_PHASE"
    APPORTIONED_AMOUNT_PHASE = "APPORTIONED_AMOUNT_PHASE"

  end
end