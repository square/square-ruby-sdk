# frozen_string_literal: true

module Square
    module Types
        # The response to retrieve payout records entries.
        class ListPayoutsResponse < Square::Internal::Types::Model
            field :payouts, Square::Internal::Types::Array[Square::Payout], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
