# frozen_string_literal: true

module Square
  module Types
    module BookingBookingSource
      extend Square::Internal::Types::Enum

      FIRST_PARTY_MERCHANT = "FIRST_PARTY_MERCHANT"
      FIRST_PARTY_BUYER = "FIRST_PARTY_BUYER"
      THIRD_PARTY_BUYER = "THIRD_PARTY_BUYER"
      API = "API"
    end
  end
end
