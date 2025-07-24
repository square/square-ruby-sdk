# frozen_string_literal: true

module SquareApiClient
# Supported booking statuses.
  class BookingStatus

    PENDING = "PENDING"
    CANCELLED_BY_CUSTOMER = "CANCELLED_BY_CUSTOMER"
    CANCELLED_BY_SELLER = "CANCELLED_BY_SELLER"
    DECLINED = "DECLINED"
    ACCEPTED = "ACCEPTED"
    NO_SHOW = "NO_SHOW"

  end
end