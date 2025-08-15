# frozen_string_literal: true

module Square
  # The response to retrieve payout records entries.
  class ListPayoutEntriesResponse < Internal::Types::Model
    field :payout_entries, Internal::Types::Array[Square::PayoutEntry], optional: true, nullable: false
    field :cursor, String, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
