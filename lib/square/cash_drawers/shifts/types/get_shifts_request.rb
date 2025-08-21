# frozen_string_literal: true

module Square
  module CashDrawers
    module Shifts
      module Types
        class GetShiftsRequest < Internal::Types::Model
          field :shift_id, -> { String }, optional: false, nullable: false
          field :location_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
