# frozen_string_literal: true

module Square
    module Types
        class LaborShiftCreatedEventObject < Square::Internal::Types::Model
            field :shift, Square::Shift, optional: true, nullable: false
        end
    end
end
