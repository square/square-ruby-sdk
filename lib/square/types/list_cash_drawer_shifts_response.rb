# frozen_string_literal: true

module Square
    module Types
        class ListCashDrawerShiftsResponse < Internal::Types::Model
            field :cursor, String, optional: true, nullable: false
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :cash_drawer_shifts, Internal::Types::Array[Square::CashDrawerShiftSummary], optional: true, nullable: false
        end
    end
end
