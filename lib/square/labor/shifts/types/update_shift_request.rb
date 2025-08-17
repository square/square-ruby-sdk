
module Square
  module Labor
    module Shifts
      module Types
        class UpdateShiftRequest < Internal::Types::Model
          field :id, String, optional: false, nullable: false
          field :shift, Square::Types::Shift, optional: false, nullable: false

        end
      end
    end
  end
end
