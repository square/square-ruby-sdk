# frozen_string_literal: true

module Square
    module Types
        class LaborShiftUpdatedEventObject < Square::Internal::Types::Model
            field :shift, Square::Shift, optional: true, nullable: false
        end
    end
end
