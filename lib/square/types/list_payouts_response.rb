# frozen_string_literal: true

module Square
  module Types
    # The response to retrieve payout records entries.
    class ListPayoutsResponse < Internal::Types::Model
      field :payouts, Internal::Types::Array[Square::Types::Payout], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false

    end
  end
end
