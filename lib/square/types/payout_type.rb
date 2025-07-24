# frozen_string_literal: true

module square.rb
# The type of payout: “BATCH” or “SIMPLE”.
#  BATCH payouts include a list of payout entries that can be considered settled.
#  SIMPLE payouts do not have any payout entries associated with them
#  and will show up as one of the payout entries in a future BATCH payout.
  class PayoutType

    BATCH = "BATCH"
    SIMPLE = "SIMPLE"

  end
end