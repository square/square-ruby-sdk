# frozen_string_literal: true

module Square
    module Types
        class ListCashDrawerShiftEventsResponse < Square::Internal::Types::Model
            field :cursor, String, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :cash_drawer_shift_events, Square::Internal::Types::Array[Square::CashDrawerShiftEvent], optional: true, nullable: false
        end
    end
end
