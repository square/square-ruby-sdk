# frozen_string_literal: true

module square.rb
# List of possible destinations against which a payout can be made.
  class DestinationType

    BANK_ACCOUNT = "BANK_ACCOUNT"
    CARD = "CARD"
    SQUARE_BALANCE = "SQUARE_BALANCE"
    SQUARE_STORED_BALANCE = "SQUARE_STORED_BALANCE"

  end
end