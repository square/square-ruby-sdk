# frozen_string_literal: true

module Square
    module Types
        class GetCashDrawerShiftResponse < Internal::Types::Model
            field :cash_drawer_shift, Square::CashDrawerShift, optional: true, nullable: false
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
