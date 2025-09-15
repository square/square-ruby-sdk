# frozen_string_literal: true

module Square
  module Types
    module BookingStatus
      extend Square::Internal::Types::Enum

      PENDING = "PENDING"
      CANCELLED_BY_CUSTOMER = "CANCELLED_BY_CUSTOMER"
      CANCELLED_BY_SELLER = "CANCELLED_BY_SELLER"
      DECLINED = "DECLINED"
      ACCEPTED = "ACCEPTED"
      NO_SHOW = "NO_SHOW"
    end
  end
end
