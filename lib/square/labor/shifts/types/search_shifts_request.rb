
module Square
  module Labor
    module Shifts
      module Types
        class SearchShiftsRequest < Internal::Types::Model
          field :query, -> { Square::Types::ShiftQuery }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :cursor, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
