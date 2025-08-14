# frozen_string_literal: true

module Square
    module Types
        class SearchTerminalCheckoutsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :checkouts, Square::Internal::Types::Array[Square::TerminalCheckout], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
        end
    end
end
