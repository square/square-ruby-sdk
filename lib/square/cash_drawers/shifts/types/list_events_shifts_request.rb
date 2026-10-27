# frozen_string_literal: true

module Square
  module CashDrawers
    module Shifts
      module Types
        class ListEventsShiftsRequest < Internal::Types::Model
          field :shift_id, -> { String }, optional: false, nullable: false

          field :location_id, -> { String }, optional: false, nullable: false

          field :limit, -> { Integer }, optional: true, nullable: true

          field :cursor, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
