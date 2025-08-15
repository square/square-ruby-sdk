# frozen_string_literal: true

module Square
  class LaborShiftUpdatedEventObject < Internal::Types::Model
    field :shift, Square::Shift, optional: true, nullable: false

  end
end
