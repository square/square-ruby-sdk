# frozen_string_literal: true

module Square
  module Types
    class ListCashDrawerShiftEventsResponse < Internal::Types::Model
      field :cursor, -> { String }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :cash_drawer_shift_events, -> { Internal::Types::Array[Square::Types::CashDrawerShiftEvent] }, optional: true, nullable: false

    end
  end
end
