# frozen_string_literal: true

module SquareApiClient
# The current state of this fulfillment.
  class OrderFulfillmentState

    PROPOSED = "PROPOSED"
    RESERVED = "RESERVED"
    PREPARED = "PREPARED"
    COMPLETED = "COMPLETED"
    CANCELED = "CANCELED"
    FAILED = "FAILED"

  end
end